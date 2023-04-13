//
//  UserDefaultsWrapper.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 13.04.2023.
//

import Foundation

enum UserDefaultsWrapper {
    private static let defaults = UserDefaults.standard

    public static func set(_ value: Any?, key: UserDefaultsKeys) {
        defaults.set(value, forKey: key.rawValue)
    }

    static func get<Value>(key: UserDefaultsKeys) -> Value? {
        return defaults.object(forKey: key.rawValue) as? Value
    }
    
    static func resetDefaultsData() {
        self.set(nil, key: .hasSeenOnboarding)
    }
}
