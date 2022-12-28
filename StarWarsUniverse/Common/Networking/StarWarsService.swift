//
//  StarWarsService.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 28.12.2022.
//

import Foundation

protocol StarWarsServiceProtocol {
    func getPeople(at page: Int, completion: @escaping (_ result: Result<PeopleResponse, ApiError>) -> Void)
    func getPerson(at number: Int, completion: @escaping (_ result: Result<People, ApiError>) -> Void)
    
    func getPlanets(at page: Int, completion: @escaping (_ result: Result<PlanetsResponse, ApiError>) -> Void)
    func getPlanet(at number: Int, completion: @escaping (_ result: Result<Planet, ApiError>) -> Void)
}

final class StarWarsService: StarWarsServiceProtocol {
    
    static let shared: StarWarsServiceProtocol = StarWarsService()
    
    public func getPeople(
        at page: Int,
        completion: @escaping (_ result: Result<PeopleResponse, ApiError>) -> Void
    ) {
        guard
            let request = ApiRequest.people(page: page).request
        else { return }
        
        NetworkRequestManager.shared.request(request: request) { (result: Result<PeopleResponse, ApiError>) in
            completion(result)
        }
    }
    
    public func getPerson(
        at number: Int,
        completion: @escaping (_ result: Result<People, ApiError>) -> Void
    ) {
        guard
            let request = ApiRequest.person(number: number).request
        else { return }
        
        NetworkRequestManager.shared.request(request: request) { (result: Result<People, ApiError>) in
            completion(result)
        }
    }
    
    public func getPlanets(
        at page: Int,
        completion: @escaping (_ result: Result<PlanetsResponse, ApiError>) -> Void
    ) {
        guard
            let request = ApiRequest.people(page: page).request
        else { return }
        
        NetworkRequestManager.shared.request(request: request) { (result: Result<PlanetsResponse, ApiError>) in
            completion(result)
        }
    }
    
    public func getPlanet(
        at number: Int,
        completion: @escaping (_ result: Result<Planet, ApiError>) -> Void
    ) {
        guard
            let request = ApiRequest.person(number: number).request
        else { return }
        
        NetworkRequestManager.shared.request(request: request) { (result: Result<Planet, ApiError>) in
            completion(result)
        }
    }
    
    public func getStartShips(
        at page: Int,
        completion: @escaping (_ result: Result<StarShipResponse, ApiError>) -> Void
    ) {
        guard
            let request = ApiRequest.people(page: page).request
        else { return }
        
        NetworkRequestManager.shared.request(request: request) { (result: Result<StarShipResponse, ApiError>) in
            completion(result)
        }
    }
    
    public func getStartShip(
        at number: Int,
        completion: @escaping (_ result: Result<StarShip, ApiError>) -> Void
    ) {
        guard
            let request = ApiRequest.person(number: number).request
        else { return }
        
        NetworkRequestManager.shared.request(request: request) { (result: Result<StarShip, ApiError>) in
            completion(result)
        }
    }
}
