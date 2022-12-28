//
//  MainViewController.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 26.12.2022.
//

import UIKit

class MainViewController: UIViewController {
    var viewModel: MainViewModel!
    
    private let mainView: MainView = {
        let mainView = MainView()
        mainView.backgroundColor = .white
        return mainView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainView()
        registerCell()
    }
}

//MARK: - MainViewController
private extension MainViewController {
    func setupViewModel() {
//    viewModel = MainViewModel!
        viewModel.delegate = self
    }
    
    func setupMainView() {
//        mainView.collectionView.dataSource = viewModel.makeDataSource() as? any UICollectionViewDataSource
//        mainView.collectionView.delegate = self
        mainView.configure(filterItem: viewModel.getFilterItems())
        view.add([mainView])
        mainView.autoPinEdgesToSuperView()
    }
    
    func registerCell() {
//        mainView.collectionView.register(<#T##nib: UINib?##UINib?#>, forCellWithReuseIdentifier: <#T##String#>)
//        mainView.collectionView.register(<#T##nib: UINib?##UINib?#>, forCellWithReuseIdentifier: <#T##String#>)
    }
}

//MARK: - MainViewModelDelegate
//extension MainViewController: UICollectionViewDelegate {
//
//}

//MARK: - MainViewModelDelegate
//extension MainViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 0
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = UICollectionViewCell()
//        return cell
//    }
//
//
//}

//MARK: - MainViewModelDelegate
extension MainViewController: MainViewModelDelegate {
    
}
