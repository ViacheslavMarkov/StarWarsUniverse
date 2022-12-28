//
//  MainViewModel.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 27.12.2022.
//

import UIKit

protocol MainViewModelDelegate: AnyObject {
    func didGetPeople()
    func updateFailed(message: String)
    
}

protocol MainViewModelProtocol {
    func getPeople()
    func getFilterItems() -> [String]
    
    var delegate: MainViewModelDelegate? { get set }
}

typealias Snapshot = NSDiffableDataSourceSnapshot<MainSection, MainSection.Item>
typealias DataSource = UITableViewDiffableDataSource<MainSection, MainSection.Item>

final class MainViewModel: MainViewModelProtocol {
    
    weak var delegate: MainViewModelDelegate?
    
    private var dataSource: DataSource?
    private var snapshot = Snapshot()
    
    private var data = [MainSection: [MainSection.Item]]()
    
    private var dataToUse: [MainSection: [MainSection.Item]] {
        data
    }
    
    private var selectedFilterType = FilterType.planet {
        didSet {
            updateDynamicDataSource()
        }
    }
    
    public func applySnapshot(animatingDifferences: Bool = true) {
            snapshot.appendSections(MainSection.allCases)
            for (key, value) in dataToUse {
                snapshot.appendItems(value, toSection: key)
            }
        dataSource?.apply(snapshot, animatingDifferences: animatingDifferences)
//        }
    }
    
    func updateDynamicDataSource() {
        
    }
    
    func getFilterItems() -> [String] {
        var list: [String] = []
        for item in FilterType.allCases {
            list.append(item.description)
        }
        return list
    }
    
    func getPeople() {
        StarWarsService.shared.getPeople(at: 1, completion: { [weak self] (result) in
            switch result {
            case .failure(let error):
                self?.delegate?.updateFailed(message: error.localizedDescription)
            case .success(let response):
                self?.delegate?.didGetPeople()
            }
        })
    }
}

// MARK: - UICollectionViewDataSource
extension MainViewModel {
    func makeDataSource() -> DataSource? {
        
        return dataSource
    }
}
