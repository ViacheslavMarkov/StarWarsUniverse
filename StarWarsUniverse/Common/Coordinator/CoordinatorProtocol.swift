//
//  CoordinatorProtocol.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 18.05.2023.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    init(navigationController: UINavigationController)

    func start()
}
