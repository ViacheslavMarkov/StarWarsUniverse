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
}

protocol MainViewModelProtocol {
    func getFilterItems() -> [String]
    func changeFilterType(at index: Int)
    func downloadNewData(filterType: FilterType)
    
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
    func updateDynamicDataSource() {
        
    }
    
    func getFilterItems() -> [String] {
        var list: [String] = []
        for item in FilterType.allCases {
            list.append(item.description)
        }
        return list
    }
    
    func getPeople(page: Int? = 1) {
        guard let page = page else { return }
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
        })
    }
    
    func getPlanets(page: Int? = 1) {
        guard let page = page else { return }
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
        })
    }
    
    func getStarShips(page: Int? = 1) {
        guard let page = page else { return }
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
        })
    }
    
    func downloadNewData(filterType: FilterType) {
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
}
