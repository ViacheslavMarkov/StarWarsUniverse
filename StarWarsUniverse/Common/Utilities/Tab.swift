//
//  Tab.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 08.05.2023.
//

import UIKit

enum Tab: String, CaseIterable {
    case people
    case starships
    case planets
    case species
    case vehicles
    case films

    var title: String {
        switch self {
        case .people:
            return "People"
        case .planets:
            return "Planets"
        case .starships:
            return "Starships"
        case .vehicles:
            return "Vehicles"
        case .species:
            return "Species"
        case .films:
            return "Film"
        }
    }
    
    var tag: Int {
        switch self {
        case .people:
            return 0
        case .starships:
            return 1
        case .planets:
            return 2
        case .species:
            return 3
        case .vehicles:
            return 4
        case .films:
            return 5
        }
    }

    var image: UIImage? {
        switch self {
        case .people:
            return .image(
                name: .personTabIcon,
                renderingMode: .alwaysTemplate
            )
        case .planets:
            return .image(
                name: .planetTabIcon,
                renderingMode: .alwaysTemplate
            )
        case .starships:
            return .image(
                name: .starshipTabIcon,
                renderingMode: .alwaysTemplate
            )
        case .vehicles:
            return .image(
                name: .vehicleTabIcon,
                renderingMode: .alwaysTemplate
            )
        case .species:
            return .image(
                name: .specieTabIcon,
                renderingMode: .alwaysTemplate
            )
        default:
            return UIImage()
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
        case .starships:
            return EndPoint.starships.urlString + "1"
        case .species:
            return EndPoint.species.urlString + "1"
        case .planets:
            return EndPoint.planets.urlString + "1"
        case .vehicles:
            return EndPoint.vehicles.urlString + "1"
        case .films:
            return EndPoint.films.urlString + "1"
        }
    }
    
    var defaultResponseType: any RequestResponseProtocol {
        switch self {
        case .people:
            let models = [
                PeopleModel(
                    name: "name",
                    gender: "",
                    urlString: "",
                    height: "",
                    mass: "",
                    films: [],
                    species: [],
                    vehicles: [],
                    starships: [],
                    hairColor: "",
                    skinColor: "",
                    eyeColor: "",
                    birthYear: "",
                    homeWorld: ""
                )
            ]
            let response = PeopleResponse(count: 0,
                                          next: "",
                                          previous: "",
                                          results: models)
            return response
        case .planets:
            let models = [
                PlanetModel(
                    name: "",
                    climate: "",
                    urlString: "",
                    rotationPeriod: "",
                    orbitalPeriod: "",
                    diameter: "",
                    gravity: "",
                    terrain: "",
                    surfaceWater: "",
                    population: "",
                    residents: [],
                    films: []
                )
            ]
            let response = PlanetsResponse(count: 0,
                                           next: "",
                                           previous: "",
                                           results: models)
            return response
        case .starships:
            let models = [
                StarShipModel(
                    name: "",
                    model: "",
                    urlString: "",
                    manufacturer: "",
                    costInCredits: "",
                    length: "",
                    maxAtmospheringSpeed: "",
                    crew: "",
                    passengers: "",
                    cargoCapacity: "",
                    hyperdriveRating: "",
                    starshipClass: "",
                    pilots: [],
                    films: []
                )
            ]
            let response = StarShipResponse(count: 0,
                                            next: "",
                                            previous: "",
                                            results: models)
            return response
        case .species:
            let models = [
                SpecieModel(
                    name: "",
                    classification: "",
                    urlString: "",
                    cargoCapacity: "",
                    consumables: "",
                    costInCredits: "",
                    crew: "",
                    films: [],
                    people: [],
                    length: "",
                    manufacturer: "",
                    maxAtmospheringSpeed: "",
                    passengers: "",
                    vehicleClass: ""
                )
            ]
            let response = SpecieResponse(count: 0,
                                          next: "",
                                          previous: "",
                                          results: models)
            return response
        default:
            let models = [
                VehicleModel(
                    name: "",
                    model: "",
                    urlString: "",
                    averageHeight: "",
                    averageLifespan: "",
                    designation: "",
                    eyeColors: "",
                    films: [],
                    hairColors: "",
                    homeWorld: "",
                    language: "",
                    people: [],
                    skinColors: ""
                )
            ]
            let response = VehicleResponse(count: 0,
                                           next: "",
                                           previous: "",
                                           results: models)
            return response
        }
    }
}
