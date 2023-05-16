//
//  UINavigationBar+Extension.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 15.05.2023.
//

import UIKit

extension UINavigationController {
    func setup() {
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black,
            .font: UIFont.customFont(type: .bold, size: 18)
        ]

        let appearence = UINavigationBarAppearance()
        appearence.configureWithDefaultBackground()
        appearence.titleTextAttributes = attributes
        appearence.backgroundColor = .white
        appearence.shadowImage = UIImage()
        appearence.shadowColor = .clear
        appearence.backgroundImage = UIImage()

        navigationBar.standardAppearance = appearence
        navigationBar.scrollEdgeAppearance = appearence
        navigationBar.compactAppearance = appearence
        navigationBar.prefersLargeTitles = true

        navigationBar.isTranslucent = true
        navigationBar.tintColor = .black
    }
}
