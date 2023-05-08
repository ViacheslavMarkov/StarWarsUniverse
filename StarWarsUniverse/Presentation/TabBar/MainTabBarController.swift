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
    
    public init(
        items: [Tab]
    ) {
        self.items = items
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        UserDefaultsWrapper.set(false, key: .hasSeenOnboarding)
        
        self.viewControllers = items.map {
            let viewModel = TabBarItemViewModel(tabItem: $0)
            let viewController = TabBarItemViewController(viewModel: viewModel)
            return viewController
        }
        
        setupCustomTabBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
}

// MARK: - CustomTabBarViewDelegate
extension MainTabBarController: CustomTabBarViewDelegate {
    public func didTapItem(_ sender: CustomTabBarView, index: Int) {
        selectedIndex = index
        sender.updateUI(at: selectedIndex)
    }
}
