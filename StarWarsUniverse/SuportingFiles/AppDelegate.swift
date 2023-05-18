//
//  AppDelegate.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 26.12.2022.
//

import UIKit

typealias Snapshot = NSDiffableDataSourceSnapshot<Sections, StarWarsCellModel>
typealias DataSource = UITableViewDiffableDataSource<Sections, StarWarsCellModel>

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    lazy var window: UIWindow? = .init(frame: UIScreen.main.bounds)

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        if UserDefaultsWrapper.get(key: .hasSeenOnboarding) == true {
            showMainTabBarController()
        } else {
            showOnboardingViewController()
        }
        
        return true
    }
}

//MARK: - AppDelegate
extension AppDelegate {
    func showMainTabBarController() {
        let navigationController = UINavigationController()
        let mainTabBarController = MainTabBarCoordinator(navigationController: navigationController)
        mainTabBarController.start()
        
        navigationController.setup()
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    private func showOnboardingViewController() {
        let navigationController = UINavigationController()
        let onboardingCoordinator = OnboardingCoordinator(navigationController: navigationController)
        onboardingCoordinator.start()
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
