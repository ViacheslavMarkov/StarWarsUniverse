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
    private let navigationController = UINavigationController()

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
    private func makeMainNavController() -> UINavigationController? {
        let mainTabBarController = MainTabBarController(items: TabBarManager.shared.getTabBarItems())
        let navigationController = UINavigationController(rootViewController: mainTabBarController)
        navigationController.setup()
        
        return navigationController
    }
    
    func showMainTabBarController() {
        window?.rootViewController = makeMainNavController()
        window?.makeKeyAndVisible()
    }
    
    private func showOnboardingViewController() {
        let onboardingCoordinator = OnboardingCoordinator(navigationController: navigationController)
        onboardingCoordinator.start()
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
