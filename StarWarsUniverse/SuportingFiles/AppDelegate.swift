//
//  AppDelegate.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 26.12.2022.
//

import UIKit

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

extension AppDelegate {
    private func makeMainTabBarController() -> MainTabBarController? {
        let mainViewModel = MainViewModel()
        let mainViewController = MainViewController()
        mainViewController.viewModel = mainViewModel
        
        let mainTabBarController = MainTabBarController(screens: [mainViewController])
        
        return mainTabBarController
    }
    
    func showMainTabBarController() {
        window?.rootViewController = makeMainTabBarController()
        window?.makeKeyAndVisible()
    }
    
    private func showOnboardingViewController() {
        let viewController = OnboardingViewController()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
}
