//
//  DescriptionView.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 15.05.2023.
//

import UIKit

protocol DescriptionViewDelegate: AnyObject {
    func didTapNewURL(_ sender: DescriptionView, urlString: String)
}

final class DescriptionView: UIView {
    weak var delegate: DescriptionViewDelegate?
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.isScrollEnabled = false
        return tableView
    }()
    
    private let spacing = CGFloat(12)
    var dictionary: [String: Any]
    
    init(
        dictionary: [String: Any]
    ) {
        self.dictionary = dictionary
        
        super.init(frame: .zero)
        setup()
        
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = .white
    }
    
    private func setup() {
        add([
            tableView
        ])
        
        tableView.autoPinEdgesToSuperView()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(DescriptionTableViewCell.self, forCellReuseIdentifier: DescriptionTableViewCell.identifier)
        tableView.isScrollEnabled = true
        tableView.separatorStyle = .none
    }
    
    func updateUI(at newDictionary: [String: Any]) {
        dictionary = newDictionary
        tableView.reloadData()
//        tableView.dataSource.del
    }
}

//MARK: - UITableViewDataSource
extension DescriptionView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dictionary.keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let keys = dictionary.compactMap({ $0.key }).sorted(by: { $0 > $1 })
        let key = keys[section]
        let items = dictionary[key] ?? ""
        var numberOfRowsInSection = 0
        
        if let _ = items as? String {
            numberOfRowsInSection = 1
        }
        
        if let items = items as? [String] {
            numberOfRowsInSection = items.count
        }
        
        return numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionTableViewCell.identifier, for: indexPath) as? DescriptionTableViewCell
        else { return UITableViewCell() }
        
        let keys = dictionary.compactMap({ $0.key }).sorted(by: { $0 > $1 })
        let key = keys[indexPath.section]
        let items = dictionary[key] ?? ""
        
        var infoText: String = ""
        
        if let item = items as? String {
            infoText = item
        }
        
        if let items = items as? [String] {
            infoText = items[indexPath.row]
        }
        
        cell.indexPath = indexPath
        cell.configure(titleText: key, infoText: infoText)
        cell.delegate = self
        
        return cell
    }
}

//MARK: - UITableViewDelegate
extension DescriptionView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

//MARK: - DescriptionTableViewCellDelegate
extension DescriptionView: DescriptionTableViewCellDelegate {
    func didTapItem(_ sender: DescriptionTableViewCell, urlString: String) {
        delegate?.didTapNewURL(self, urlString: urlString)
    }
}
