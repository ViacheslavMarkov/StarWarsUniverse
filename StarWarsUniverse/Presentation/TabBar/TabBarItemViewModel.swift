//
//  TabBarItemViewModel.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 08.05.2023.
//

import Foundation

protocol TabBarItemViewModelDelegate: AnyObject {
}

protocol TabBarItemViewModelProtocol {
}

final class TabBarItemViewModel: TabBarItemViewModelProtocol {
    
    let tabItem: Tab
    
    init(tabItem: Tab) {
        self.tabItem = tabItem
    }
}
