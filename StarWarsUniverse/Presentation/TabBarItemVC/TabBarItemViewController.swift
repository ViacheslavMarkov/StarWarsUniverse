//
//  TabBarItemViewController.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 08.05.2023.
//

import UIKit

final class TabBarItemViewController: UIViewController {
    
    var viewModel: TabBarItemViewModelProtocol
    
    init(viewModel: TabBarItemViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let tableViewContainer: ContainerTableView = {
        let view = ContainerTableView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel.fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}

//MARK: - TabBarItemViewModelDelegate
extension TabBarItemViewController: TabBarItemViewModelDelegate {
    func didUpdatedDataSource(_ sender: TabBarItemViewModelProtocol, models: [StarWarsCellModel]) {
        tableViewContainer.applySnapshot(items: models)
    }
}

//MARK: - TabBarItemViewController
private extension TabBarItemViewController {
    func setupTableView() {
        view.add([
            tableViewContainer
        ])
        tableViewContainer.autoPinSafeEdgesToSuperView()
        
        tableViewContainer.delegate = self
    }
}

//MARK: - ContainerTableViewDelegate
extension TabBarItemViewController: ContainerTableViewDelegate {
    func didNeedDownloadNewData(_ sender: ContainerTableView, tag: Int) {
        viewModel.fetchData()
    }
    
    func didTapItem(_ sender: ContainerTableView, index: Int, item: StarWarsCellModel) {
        print("didTapItem", item)
    }
}
