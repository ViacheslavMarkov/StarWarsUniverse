//
//  TabBarManager.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 08.05.2023.
//

import Foundation

final class TabBarManager {
    
    static let shared = TabBarManager()
    
    func getTabBarItems() -> [Tab] {
        var list: [Tab] = []
        if let listNames: [String] = UserDefaultsWrapper.get(key: .listTabBarItems) {
            for name in listNames {
                if let item = Tab(rawValue: name) {
                    list.append(item)
                }
            }
            return list
        }
        return [.people, .starship, .specie]
    }
    
    func addNewItem(by name: String, completion: () -> Void) {
        var items = getTabBarItems().map({ $0.rawValue })
        if !items.contains(name) {
            items.append(name)
            UserDefaultsWrapper.set(items, key: .listTabBarItems)
            completion()
        }
    }
    
    func removeItem(by name: String, completion: () -> Void) {
        var items = getTabBarItems().map({ $0.rawValue })
        if let firstIndex = items.firstIndex(of: name) {
            let _ = items.remove(at: firstIndex)
            UserDefaultsWrapper.set(items, key: .listTabBarItems)
            completion()
        }
    }
    
    func isAddedAllItems() -> Bool {
        getTabBarItems().count == Tab.allCases.count
    }
    
    func isAvailableRemovingItem() -> Bool {
        getTabBarItems().count > 3
    }
}
