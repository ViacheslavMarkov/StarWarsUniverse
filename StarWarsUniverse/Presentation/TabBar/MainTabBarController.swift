//
//  MainTabBarController.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 13.04.2023.
//

import UIKit

protocol TabBarConforming: UIViewController {
}

final class MainTabBarController: UITabBarController {
    
    private let screens: [TabBarConforming]
    
    public init(
        screens: [TabBarConforming]
    ) {
        self.screens = screens
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaultsWrapper.set(false, key: .hasSeenOnboarding)
    }
}
