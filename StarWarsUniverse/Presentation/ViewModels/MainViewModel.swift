//
//  MainViewModel.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 27.12.2022.
//

import Foundation

protocol MainViewModelDelegate: AnyObject {
    func updateFailed(message: String)
    func updateDataSource(_ sender: MainViewModel, selectedFilterType: FilterType, models: [StarWarsCellModel])
    func showASndHideDownloadIndicator(_ sender: MainViewModel, isShow: Bool)
}

protocol MainViewModelProtocol {
    func getFilterItems() -> [String]
    func changeFilterType(at index: Int)
    func downloadNewData(filterType: FilterType)
    func getItemData(at index: Int, by name: String) -> [String: String]
    
    var delegate: MainViewModelDelegate? { get set }
}

final class MainViewModel: MainViewModelProtocol {
    weak var delegate: MainViewModelDelegate?
    
    private var cachePeople: [People] = []
    private var cachePlanets: [Planet] = []
    private var cacheStarShips: [StarShip] = []
    
    private var peopleNextPage: Int? = 1
    private var planetsNextPage: Int? = 1
    private var starShipsNextPage: Int? = 1
    
    private var selectedFilterType = FilterType.people
}

// MARK: - MainViewModel
extension MainViewModel {
    func getFilterItems() -> [String] {
        var list: [String] = []
        for item in FilterType.allCases {
            list.append(item.description)
        }
        return list
    }
    
    func getPeople(page: Int? = 1) {
        guard
            let page = page
        else {
            delegate?.showASndHideDownloadIndicator(self, isShow: false)
            return
        }
        StarWarsService.shared.getPeople(at: page, completion: { [weak self] (result) in
            guard
                let self = self
            else {
                self?.delegate?.updateFailed(message: "MainViewModel is missing!")
                return
                
            }
            switch result {
            case .failure(let error):
                self.delegate?.updateFailed(message: error.localizedDescription)
            case .success(let response):
                self.addItemsToData(people: response.results)
                let next = response.next?.components(separatedBy: "=").last
                self.peopleNextPage = Int(next ?? "")
            }
            self.delegate?.showASndHideDownloadIndicator(self, isShow: false)
        })
    }
    
    func getPlanets(page: Int? = 1) {
        guard
            let page = page
        else {
            delegate?.showASndHideDownloadIndicator(self, isShow: false)
            return
        }
        StarWarsService.shared.getPlanets(at: page, completion: { [weak self] (result) in
            guard
                let self = self
            else {
                self?.delegate?.updateFailed(message: "MainViewModel is missing!")
                return
                
            }
            switch result {
            case .failure(let error):
                self.delegate?.updateFailed(message: error.localizedDescription)
            case .success(let response):
                self.addItemsToData(planets: response.results)
                let next = response.next?.components(separatedBy: "=").last
                self.planetsNextPage = Int(next ?? "")
            }
            self.delegate?.showASndHideDownloadIndicator(self, isShow: false)
        })
    }
    
    func getStarShips(page: Int? = 1) {
        guard
            let page = page
        else {
            delegate?.showASndHideDownloadIndicator(self, isShow: false)
            return
        }
        StarWarsService.shared.getStartShips(at: page, completion: { [weak self] (result) in
            guard
                let self = self
            else {
                self?.delegate?.updateFailed(message: "MainViewModel is missing!")
                return
                
            }
            switch result {
            case .failure(let error):
                self.delegate?.updateFailed(message: error.localizedDescription)
            case .success(let response):
                self.addItemsToData(starShip: response.results)
                let next = response.next?.components(separatedBy: "=").last
                self.starShipsNextPage = Int(next ?? "")
            }
            self.delegate?.showASndHideDownloadIndicator(self, isShow: false)
        })
    }
    
    func downloadNewData(filterType: FilterType) {
        delegate?.showASndHideDownloadIndicator(self, isShow: true)
        switch filterType {
        case .planet:
            let nextPage = planetsNextPage
            getPlanets(page: nextPage)
        case .people:
            let nextPage = peopleNextPage
            getPeople(page: nextPage)
        case .starship:
            let nextPage = starShipsNextPage
            getStarShips(page: nextPage)
        }
    }
    
    func addItemsToData(
        people: [People]? = nil,
        planets: [Planet]? = nil,
        starShip: [StarShip]? = nil
    ) {
        switch selectedFilterType {
        case .planet:
            planets?.forEach({ (item) in
                let names = cachePlanets.compactMap({ $0.name })
                if !names.contains(item.name ) {
                    cachePlanets.append(item)
                }
            })
            let models = createModels(planets: planets ?? [])
            delegate?.updateDataSource(self, selectedFilterType: .planet, models: models)
        case .people:
            people?.forEach({ (item) in
                let names = cachePeople.compactMap({ $0.name })
                if !names.contains(item.name ) {
                    cachePeople.append(item)
                }
            })
            let models = createModels(people: people ?? [])
            delegate?.updateDataSource(self, selectedFilterType: .people, models: models)
        case .starship:
            starShip?.forEach({ (item) in
                let names = cacheStarShips.compactMap({ $0.name })
                if !names.contains(item.name ) {
                    cacheStarShips.append(item)
                }
            })
            let models = createModels(starShip: starShip ?? [])
            delegate?.updateDataSource(self, selectedFilterType: .starship, models: models)
        }
    }
    
    func createModels(
        people: [People] = [],
        planets: [Planet] = [],
        starShip: [StarShip] = []
    ) -> [StarWarsCellModel] {
        switch selectedFilterType {
        case .planet:
            let list: [StarWarsCellModel] = (0..<planets.count).map { (index) -> StarWarsCellModel in
                return StarWarsCellModel(
                    name: planets[index].name,
                    imageNameType: planets[index].climate.imageType
                )
            }
            return list
        case .people:
            let list: [StarWarsCellModel] = (0..<people.count).map { (index) -> StarWarsCellModel in
                return StarWarsCellModel(
                    name: people[index].name,
                    imageNameType: people[index].gender.imageType
                )
            }
            return list
        case .starship:
            let list: [StarWarsCellModel] = (0..<starShip.count).map { (index) -> StarWarsCellModel in
                return StarWarsCellModel(
                    name: starShip[index].name,
                    imageNameType: starShip[index].model.imageType
                )
            }
            return list
        }
    }
    
    func changeFilterType(at index: Int) {
        if selectedFilterType.rawValue == index { return }
        if let type = FilterType.init(rawValue: index) {
            selectedFilterType = type
            downloadNewData(filterType: selectedFilterType)
        }
    }
    
    func getItemData(at index: Int, by name: String) -> [String: String] {
        let filterItems = getFilterItems()
        if let firstIndex = filterItems.firstIndex(where: { $0 == name }) {
            let filterItem = FilterType.init(rawValue: firstIndex)
            switch filterItem {
            case .people:
                let item = cachePeople[index]
                return [
                    "Name": item.name,
                    "Skin color": item.skinColor,
                    "Height": item.height,
                    "Birth year": item.birthYear,
                    "Home world": item.homeWorld,
                    "Mass": item.mass,
                    "Hair color": item.hairColor,
                    "Gender": item.gender.title,
                    "Number of films": getLastNumber(array: item.films),
                    "Number of species": getLastNumber(array: item.species),
                    "Number of starships": getLastNumber(array: item.starships)
                ]
            case .planet:
                let item = cachePlanets[index]
                return [
                    "Name": item.name,
                    "Population": item.population,
                    "Diameter": item.diameter,
                    "Gravity": item.gravity,
                    "Orbital period": item.orbitalPeriod,
                    "Climate": item.climate.rawValue,
                    "Rotation period": item.rotationPeriod,
                    "Number of films": getLastNumber(array: item.films),
                    "Residents": getLastNumber(array: item.residents),
                    "Terrain": item.terrain ?? "",
                    "Surface water": item.surfaceWater ?? ""
                ]
            case .starship:
                let item = cacheStarShips[index]
                return [
                    "Name": item.name,
                    "Model": item.model.rawValue,
                    "Cost in credits": item.costInCredits,
                    "Manufacturer": item.manufacturer,
                    "Length": item.length,
                    "Max atmosphering speed": item.maxAtmospheringSpeed,
                    "Crew": item.crew,
                    "Passengers": item.passengers,
                    "Cargo capacity": item.cargoCapacity,
                    "Starship class": item.starshipClass,
                    "Hyperdrive rating": item.hyperdriveRating,
                    "Number of films": getLastNumber(array: item.films),
                    "Pilots": getLastNumber(array: item.pilots)
                ]
            default: return [:]
            }
        }
        return [:]
    }
    
    func getLastNumber(array: [String]) -> String {
        var newList = ""
        for item in array {
            let list = item.components(separatedBy: "/").compactMap({ Int($0) })
            if let number = list.last {
                let separator = newList.isEmpty ? "" : ", "
                newList += "\(separator)\(number)"
            }
        }
        return newList
    }
}
