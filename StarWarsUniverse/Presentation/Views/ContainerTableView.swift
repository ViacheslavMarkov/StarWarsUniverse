//
//  ContainerTableView.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 01.01.2023.
//

import UIKit

protocol ContainerTableViewDelegate: AnyObject {
    func didNeedDownloadNewData(_ sender: ContainerTableView, tag: Int)
    func didTapItem(_ sender: ContainerTableView, index: Int, item: StarWarsCellModel)
}

final class ContainerTableView: UIView {
    private enum Defaults {
        static let title = "Empty list!"
        static let edgeInsets: CGFloat = 20
    }
    
    let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    let emptyMessageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .correctGreen
        label.font = .customFont(type: .bold, size: 24)
        label.minimumScaleFactor = 0.5
        label.text = Defaults.title
        label.textAlignment = .center
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    weak var delegate: ContainerTableViewDelegate?
    
    private var dataSource: DataSource?
    private var snapshot = Snapshot()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        add([
            tableView,
            emptyMessageLabel
        ])
        tableView.autoPinSafeEdgesToSuperView()
        
        NSLayoutConstraint.activate([
            emptyMessageLabel.centerX.constraint(equalTo: tableView.centerX),
            emptyMessageLabel.centerY.constraint(equalTo: tableView.centerY),
            emptyMessageLabel.leading.constraint(equalTo: tableView.leading, constant: Defaults.edgeInsets),
            emptyMessageLabel.trailing.constraint(equalTo: tableView.trailing, constant: -Defaults.edgeInsets)
        ])
        
        setupTableView()
    }
    
    private func setupTableView() {
        prepareDataSource()
        tableView.dataSource = dataSource
        tableView.delegate = self
        
        tableView.register(MainItemTableViewCell.self, forCellReuseIdentifier: MainItemTableViewCell.identifier)
    }
    
    private func prepareDataSource() {
        dataSource?.defaultRowAnimation = .fade
        dataSource = UITableViewDiffableDataSource(
            tableView: tableView
        ) { (tableView, indexPath, item) -> UITableViewCell? in
            return self.cellForRowAt(indexPath, with: item)
        }
    }
    
    private func cellForRowAt(
        _ indexPath: IndexPath,
        with item: StarWarsCellModel
    ) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: MainItemTableViewCell.identifier) as? MainItemTableViewCell
        else {
            return UITableViewCell()
        }
        cell.configure(item: item)
        return cell
    }
    
    func applySnapshot(
        _ animatingDifferences: Bool = false,
        items: [StarWarsCellModel] = []
    ) {
        tableView.reloadData()
        
        if snapshot.numberOfSections == .zero {
            snapshot.appendSections([Sections.first])
        }
        
        snapshot.appendItems(items)
        dataSource?.apply(snapshot, animatingDifferences: animatingDifferences)
    }
}

//MARK: - UITableViewDelegate
extension ContainerTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if tableView.isLastCellVisible(indexPath) {
            tag = self.tag
            delegate?.didNeedDownloadNewData(self, tag: tag)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard
            let section = dataSource?.snapshot().sectionIdentifiers[indexPath.section],
            let item = dataSource?.snapshot().itemIdentifiers(inSection: section)[indexPath.row]
        else { return }
        
        delegate?.didTapItem(self, index: indexPath.row, item: item)
    }
}
