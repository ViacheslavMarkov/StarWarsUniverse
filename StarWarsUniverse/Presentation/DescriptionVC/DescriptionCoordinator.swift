//
//  DescriptionCoordinator.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 18.05.2023.
//

import UIKit

final class DescriptionCoordinator<T: ResponseModelProtocol>: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    let urlString: String
    let title: String
    
    init(
        navigationController: UINavigationController,
        urlString: String,
        title: String
    ) {
        self.navigationController = navigationController
        self.urlString = urlString
        self.title = title
    }
    
    func start() {
        let descriptionViewModel = DescriptionViewModel<T>(urlString: urlString)
        let descriptionViewController = DescriptionViewController<T>(viewModel: descriptionViewModel)
        
        descriptionViewController.coordinator = self
        descriptionViewController.title = title

        navigationController.pushViewController(descriptionViewController, animated: true)
    }
}
