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
        
        delegate = self
        
        self.viewControllers = items.map {
            switch $0.tag {
            case 0:
                var viewModel = TabBarItemViewModel<PeopleResponse>(tabItem: $0)
                let viewController = TabBarItemViewController(viewModel: viewModel)
                let nav = UINavigationController(rootViewController: viewController)
                return nav
            case 1:
                var viewModel = TabBarItemViewModel<StarShipResponse>(tabItem: $0)
                let viewController = TabBarItemViewController(viewModel: viewModel)
                let nav = UINavigationController(rootViewController: viewController)
                return nav
            case 2:
                var viewModel = TabBarItemViewModel<PlanetsResponse>(tabItem: $0)
                let viewController = TabBarItemViewController(viewModel: viewModel)
                let nav = UINavigationController(rootViewController: viewController)
                return nav
            case 3:
                var viewModel = TabBarItemViewModel<SpecieResponse>(tabItem: $0)
                let viewController = TabBarItemViewController(viewModel: viewModel)
                let nav = UINavigationController(rootViewController: viewController)
                return nav
            case 4:
                var viewModel = TabBarItemViewModel<VehicleResponse>(tabItem: $0)
                let viewController = TabBarItemViewController(viewModel: viewModel)
                let nav = UINavigationController(rootViewController: viewController)
                return nav
            default:
                print("Item does not exist")
                return UIViewController()
            }
        }
        
        setupCustomTabBar()
    }
    
    func createTabBarViewController(item: Tab) -> UINavigationController {
        let viewModel = TabBarItemViewModel<PeopleResponse>(tabItem: item)
        let viewController = TabBarItemViewController(viewModel: viewModel)
        let nav = UINavigationController(rootViewController: viewController)
        return nav
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
        
//        self.navigationController = UINavigationController(navigationBarClass: MainTabBarController, toolbarClass: nil)
    }
}

// MARK: - CustomTabBarViewDelegate
extension MainTabBarController: CustomTabBarViewDelegate {
    public func didTapItem(_ sender: CustomTabBarView, index: Int) {
        selectedIndex = index
        sender.updateUI(at: selectedIndex)
        navigationItem.title = "gfgfhfh"
        navigationItem.titleView?.tintColor = .red
        navigationItem.titleView?.backgroundColor = .green
    }
}

extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        navigationItem.title = viewController.navigationItem.title
    }
}
