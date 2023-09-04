//
//  MainTabBarController.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 13.04.2023.
//

import UIKit

final class MainTabBarController: UITabBarController {
    private let items: [Tab]
    private let tabBarHeight: CGFloat = 60
    private lazy var customTabBarView = CustomTabBarView(viewHeight: tabBarHeight, items: items)
    private var selectedItem: Tab = .people
    
    let navController: UINavigationController
    
    public init(
        items: [Tab],
        navigationController: UINavigationController
    ) {
        self.items = items
        self.navController = navigationController
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        UserDefaultsWrapper.set(false, key: .hasSeenOnboarding)
        
        self.viewControllers = items.map { item in
            return createTabBarViewController(type: item.defaultResponseType, tabItem: item)
        }
        
        setupCustomTabBar()
        createNavTitle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navController.navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

//MARK: - MainTabBarController
private extension MainTabBarController {
    func setupCustomTabBar() {
        tabBar.backgroundColor = .customGray
        tabBar.addSubview(customTabBarView)
        
        customTabBarView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            customTabBarView.heightAnchor.constraint(equalToConstant: tabBarHeight),
            customTabBarView.topAnchor.constraint(equalTo: tabBar.topAnchor, constant: 8),
            customTabBarView.leftAnchor.constraint(equalTo: tabBar.leftAnchor, constant:  tabBarHeight / 2),
            customTabBarView.rightAnchor.constraint(equalTo: tabBar.rightAnchor, constant:  -tabBarHeight / 2)
        ])
        
        customTabBarView.delegate = self
    }
    
    func createNavTitle() {
        let title = selectedItem.title
        navigationItem.title = title
    }
    
    func createTabBarViewController<T: RequestResponseProtocol>(type: T, tabItem: Tab) -> UIViewController {
        let tabBarItemCoordinator = TabBarItemCoordinator<T>(navigationController: navController, tabItem: tabItem)
        tabBarItemCoordinator.start()
        return tabBarItemCoordinator.getViewController()
    }
}

// MARK: - CustomTabBarViewDelegate
extension MainTabBarController: CustomTabBarViewDelegate {
    public func didTapItem(_ sender: CustomTabBarView, index: Int, selectedItem: Tab) {
        selectedIndex = index
        self.selectedItem = selectedItem
        sender.updateUI(at: selectedIndex)
        createNavTitle()
    }
}

// MARK: - UITabBarControllerDelegate
extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        navigationItem.title = viewController.navigationItem.title
    }
}
