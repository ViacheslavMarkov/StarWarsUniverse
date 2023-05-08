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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let mainView: MainView = {
        let mainView = MainView()
        mainView.backgroundColor = .white
        return mainView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

//MARK: - TabBarItemViewController
private extension TabBarItemViewController {
    func setupViewModel() {
    }
    
    func setupMainView() {
        view.add([mainView])
        mainView.autoPinEdgesToSuperView()
    }
}
