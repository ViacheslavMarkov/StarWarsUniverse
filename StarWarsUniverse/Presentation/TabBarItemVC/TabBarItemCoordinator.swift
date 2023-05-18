//
//  TabBarItemCoordinator.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 18.05.2023.
//

import UIKit

final class TabBarItemCoordinator<T: RequestResponseProtocol>: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    let tabItem: Tab
    
    private var viewController: TabBarItemViewController<T>?
    
    init(
        navigationController: UINavigationController,
        tabItem: Tab
    ) {
        self.navigationController = navigationController
        self.tabItem = tabItem
    }
    
    func start() {
        let viewModel = TabBarItemViewModel<T>(tabItem: tabItem)
        viewController = TabBarItemViewController<T>(viewModel: viewModel)
        viewController?.coordinator = self
    }
    
    func getViewController() -> UIViewController {
        guard let viewController = viewController else { return UIViewController() }
        return viewController
    }
    
    func goToDescriptionPage<M: ResponseModelProtocol>(
        _ type: M,
        urlString: String,
        name: String
    ) {
        let descriptionCoordinator = DescriptionCoordinator<M>(
            navigationController: navigationController,
            urlString: urlString,
            title: name
        )
        descriptionCoordinator.start()
    }
}
