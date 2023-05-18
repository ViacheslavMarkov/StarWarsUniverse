//
//  MainTabBarCoordinator.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 18.05.2023.
//

import UIKit

final class MainTabBarCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let mainTabBarController = MainTabBarController(
            items: TabBarManager.shared.getTabBarItems(),
            navigationController: navigationController
        )

        navigationController.pushViewController(mainTabBarController, animated: true)
    }
}
