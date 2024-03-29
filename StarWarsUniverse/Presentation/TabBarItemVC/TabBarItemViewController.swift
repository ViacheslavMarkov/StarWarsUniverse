//
//  TabBarItemViewController.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 08.05.2023.
//

import UIKit

final class TabBarItemViewController<T: RequestResponseProtocol>: UIViewController {
    var coordinator: TabBarItemCoordinator<T>?
    
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
        navigationController?.navigationItem.setLeftBarButton(nil, animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}

//MARK: - TabBarItemViewController
private extension TabBarItemViewController {
    func setupTableView() {
        view.add([
            tableViewContainer
        ])
        tableViewContainer.autoPinSafeEdgesToSuperView()
        
        tableViewContainer.emptyMessageLabel.isHidden = viewModel.getItemsCounter() != 0
        
        tableViewContainer.delegate = self
    }
    
    func pushToDescriptionScreen(
        urlString: String,
        name: String
    ) {
        guard let item = viewModel.getSelectedItem(at: urlString) else { return }
        coordinator?.goToDescriptionPage(item, urlString: urlString, name: name)
    }
    
    func goToDescriptionPage<T: ResponseModelProtocol>(
        _ type: T,
        urlString: String,
        name: String
    ) {
        
        coordinator?.goToDescriptionPage(type, urlString: urlString, name: name)
    }
}

//MARK: - TabBarItemViewModelDelegate
extension TabBarItemViewController: TabBarItemViewModelDelegate {
    func showASndHideDownloadIndicator(_ sender: TabBarItemViewModelProtocol, isShow: Bool) {
        tableViewContainer.emptyMessageLabel.isHidden = viewModel.getItemsCounter() != 0
        print("showASndHideDownloadIndicator")
    }
    
    func updateFailed(message: String) {
        print("updateFailed")
        tableViewContainer.emptyMessageLabel.isHidden = viewModel.getItemsCounter() != 0
        presentBasicAlert(message: message, isAutomaticallyDismissed: true) {
            print("presentBasicAlert")
        }
    }
    
    func didUpdatedDataSource(_ sender: TabBarItemViewModelProtocol, models: [StarWarsCellModel]) {
        tableViewContainer.applySnapshot(items: models)
    }
}

//MARK: - ContainerTableViewDelegate
extension TabBarItemViewController: ContainerTableViewDelegate {
    func didNeedDownloadNewData(_ sender: ContainerTableView, tag: Int) {
        viewModel.fetchData()
    }
    
    func didTapItem(_ sender: ContainerTableView, index: Int, item: StarWarsCellModel) {
        guard
            let urlString = item.urlString,
            let name = item.name
        else { return }
        
        pushToDescriptionScreen(urlString: urlString, name: name)
    }
}
