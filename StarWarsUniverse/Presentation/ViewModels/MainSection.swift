//
//  MainSection.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 27.12.2022.
//

import Foundation

enum MainSection: Int, CaseIterable {
    case topFilter
    case bottomItem

    enum Item: Hashable {
        case topFilter(item: [String])
        case bottomItem(item: [StarWarsCellModel])
    }
}
