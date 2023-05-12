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
            switch $0.tag {
            case 0:
                let viewModel = TabBarItemViewModel<PeopleResponse>(tabItem: $0)
                let viewController = TabBarItemViewController(viewModel: viewModel)
                return viewController
            case 1:
                let viewModel = TabBarItemViewModel<StarShipResponse>(tabItem: $0)
                let viewController = TabBarItemViewController(viewModel: viewModel)
                return viewController
            case 2:
                let viewModel = TabBarItemViewModel<PlanetsResponse>(tabItem: $0)
                let viewController = TabBarItemViewController(viewModel: viewModel)
                return viewController
            case 3:
                let viewModel = TabBarItemViewModel<SpecieResponse>(tabItem: $0)
                let viewController = TabBarItemViewController(viewModel: viewModel)
                return viewController
            case 4:
                let viewModel = TabBarItemViewModel<VehicleResponse>(tabItem: $0)
                let viewController = TabBarItemViewController(viewModel: viewModel)
                return viewController
            default:
                print("Item does not exist")
                return UIViewController()
            }
        }
        
        setupCustomTabBar()
        createNavTitle()
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
    }
    
    func createNavTitle() {
        let title = selectedItem.title
        navigationItem.title = title
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

extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        navigationItem.title = viewController.navigationItem.title
    }
}
