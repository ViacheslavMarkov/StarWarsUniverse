//
//  CacheDataManager.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 16.05.2023.
//

import Foundation

final class CacheDataManager {
    static let shared = CacheDataManager()
    
    private var cachedData: [String: any ResponseModelProtocol] = [:]
    
    func addToCache(model: any ResponseModelProtocol, by key: String) {
        cachedData[key] = model
    }
    
    func getFromCacheDictionary(by key: String) -> (any ResponseModelProtocol)? {
        let model = cachedData.first(where: { $0.key == key })
        return model?.value
    }
}
