//
//  Dictionary+Extension.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 28.12.2022.
//

import Foundation

extension Dictionary {
    var prettyPrintedJSON: String? {
        do {
            let data: Data = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            return String(data: data, encoding: .utf8)
        } catch _ {
            return nil
        }
    }
    
    func percentEncoded() -> Data? {
        return map { key, value in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return escapedKey + "=" + escapedValue
        }
        .joined(separator: "&")
        .data(using: .utf8)
    }
    
    func nullKeyRemoval() -> Dictionary {
        var dict = self
        
//        let keysToRemove = Array(dict.keys).filter { dict[$0] is NSNull }
//        for key in keysToRemove {
//            dict.removeValue(forKey: key)
//        }
        
        dict.forEach { (key, value) in
            if let value = value as? String,
               value.isEmpty {
                dict.removeValue(forKey: key)
            }
            
            if let value = value as? [String],
               value.isEmpty {
                dict.removeValue(forKey: key)
            }
        }
        
        return dict
    }
}
