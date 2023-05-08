//
//  Tab.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 08.05.2023.
//

import UIKit

enum Tab: String, CaseIterable {
    case people
    case starship
    case specie
    case planet
    case vehicle

    var title: String {
        switch self {
        case .people:
            return "People"
        case .planet:
            return "Planets"
        case .starship:
            return "Starships"
        case .vehicle:
            return "Vehicles"
        case .specie:
            return "Species"
        }
    }
    
    var tag: Int {
        switch self {
        case .people:
            return 0
        case .starship:
            return 1
        case .specie:
            return 2
        case .planet:
            return 3
        case .vehicle:
            return 4
        }
    }

    var image: UIImage? {
        switch self {
        case .people:
            return .image(
                name: .personTabIcon,
                renderingMode: .alwaysTemplate
            )
        case .planet:
            return .image(
                name: .planetTabIcon,
                renderingMode: .alwaysTemplate
            )
        case .starship:
            return .image(
                name: .starshipTabIcon,
                renderingMode: .alwaysTemplate
            )
        case .vehicle:
            return .image(
                name: .vehicleTabIcon,
                renderingMode: .alwaysTemplate
            )
        case .specie:
            return .image(
                name: .specieTabIcon,
                renderingMode: .alwaysTemplate
            )
        }
    }
    
    var selectedColor: UIColor? {
        return .selectedGray
    }
    
    var unselectedColor: UIColor? {
        return .titleGray
    }
}
