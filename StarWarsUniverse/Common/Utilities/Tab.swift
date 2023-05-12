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
    case planet
    case specie
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
        case .planet:
            return 2
        case .specie:
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
    
    var pageURLString: String {
        switch self {
        case .people:
            return EndPoint.people.urlString + "1"
        case .starship:
            return EndPoint.starships.urlString + "1"
        case .specie:
            return EndPoint.species.urlString + "1"
        case .planet:
            return EndPoint.planets.urlString + "1"
        case .vehicle:
            return EndPoint.vehicles.urlString + "1"
        }
    }
    
//    var responseType<T: RequestResponseProtocol>: T {
//        return T.self as! T
//        switch self {
//        case .people:
//            return PeopleResponse
//        case .starship:
//            return StarShipResponse
//        case .specie:
//            return SpecieResponse.self as! Decodable & Encodable
//        case .planet:
//            return PlanetsResponse.self as! Decodable & Encodable
//        case .vehicle:
//            return VehicleResponse.self as! Decodable & Encodable
//        }
//    }
}
