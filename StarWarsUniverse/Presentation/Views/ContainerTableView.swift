//
//  ContainerTableView.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 01.01.2023.
//

import UIKit

protocol ContainerTableViewDelegate: AnyObject {
    func didNeedDownloadNewData(_ sender: ContainerTableView, tag: Int)
    func didTapItem(_ sender: ContainerTableView, index: Int)
}

final class ContainerTableView: UIView {
    let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
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
            tableView
        ])
        tableView.autoPinSafeEdgesToSuperView()
        
        setupTableView()
    }
    
    private func setupTableView() {
        prepareDataSource()
        tableView.dataSource = dataSource
        tableView.delegate = self
        
        tableView.register(PlanetTableViewCell.self, forCellReuseIdentifier: PlanetTableViewCell.identifier)
    }
    
    private func prepareDataSource() {
        dataSource?.defaultRowAnimation = .fade
        dataSource = UITableViewDiffableDataSource(
            tableView: tableView
        ) { (tableView, indexPath, item) -> UITableViewCell? in
            return self.cellForRowAt(indexPath, with: item)
        }
    }
    
    private func cellForRowAt(_ indexPath: IndexPath, with item: StarWarsCellModel) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: PlanetTableViewCell.identifier) as? PlanetTableViewCell
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
        delegate?.didTapItem(self, index: indexPath.row)
    }
}
