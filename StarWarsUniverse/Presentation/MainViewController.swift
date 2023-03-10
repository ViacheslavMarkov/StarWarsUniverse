//
//  MainViewController.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 26.12.2022.
//

import UIKit

typealias Snapshot = NSDiffableDataSourceSnapshot<Sections, StarWarsCellModel>
typealias DataSource = UITableViewDiffableDataSource<Sections, StarWarsCellModel>

class MainViewController: UIViewController {
    var viewModel: MainViewModelProtocol!
    
    private let mainView: MainView = {
        let mainView = MainView()
        mainView.backgroundColor = .white
        return mainView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        setupMainView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.downloadNewData(filterType: .people)
    }
}

//MARK: - MainViewController
private extension MainViewController {
    func setupViewModel() {
        viewModel = MainViewModel()
        viewModel.delegate = self
    }
    
    func setupMainView() {
        mainView.configure(filterItem: viewModel.getFilterItems())
        mainView.delegate = self
        view.add([mainView])
        mainView.autoPinEdgesToSuperView()
    }
}

//MARK: - MainViewDelegate
extension MainViewController: MainViewDelegate {
    func didTapItem(_ sender: MainView, selectedItemName: String, index: Int) {
        let dictionary = viewModel.getItemData(at: index, by: selectedItemName)
        presentTableViewAlert(title: selectedItemName, dictionary: dictionary)
    }
    
    func didNeedDownloadNewData(_ sender: MainView, tag: Int) {
        if let filterType = FilterType(rawValue: tag) {
            viewModel.downloadNewData(filterType: filterType)
        }
    }
    
    func filterTapped(_ sender: MainView, selectedIndex: Int) {
        viewModel.changeFilterType(at: selectedIndex)
        mainView.scrollView.scrollTo(page: selectedIndex)
    }
}

//MARK: - MainViewModelDelegate
extension MainViewController: MainViewModelDelegate {
    func showASndHideDownloadIndicator(_ sender: MainViewModel, isShow: Bool) {
        isShow ? showActivityIndicator() : hideActivityIndicator()
    }
    
    func updateDataSource(_ sender: MainViewModel, selectedFilterType: FilterType, models: [StarWarsCellModel]) {
        mainView.updateDataSource(selectedFilterType: selectedFilterType, models: models)
    }
    
    func updateFailed(message: String) {
        presentBasicAlert(message: "Data was not downloaded successfully!")
    }
}
