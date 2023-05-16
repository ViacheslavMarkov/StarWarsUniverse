//
//  TabBarItemViewModel.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 08.05.2023.
//

import Foundation

protocol TabBarItemViewModelDelegate: AnyObject {
    func didUpdatedDataSource(_ sender: TabBarItemViewModelProtocol, models: [StarWarsCellModel])
    func showASndHideDownloadIndicator(_ sender: TabBarItemViewModelProtocol, isShow: Bool)
    func updateFailed(message: String)
}

protocol TabBarItemViewModelProtocol {
    var delegate: TabBarItemViewModelDelegate? { get set }
    
    func fetchData()
    func getTitle() -> String
    func getItemsCounter() -> Int
}

final class TabBarItemViewModel<T: RequestResponseProtocol>: TabBarItemViewModelProtocol {
    
    private var cacheModels: [any ResponseModelProtocol] = []
    private var pageURLString: String?
    
    weak var delegate: TabBarItemViewModelDelegate?
    
    let tabItem: Tab
    
    init(
        tabItem: Tab
    ) {
        self.tabItem = tabItem
        
        pageURLString = tabItem.pageURLString
    }
    
    func fetchData() {
        guard
            let pageURLString = pageURLString
        else {
            return
        }
        
        delegate?.showASndHideDownloadIndicator(self, isShow: true)
        
        StarWarsService.shared.fetchData(by: pageURLString, completion: { [weak self] (result: Result<T, ApiError>) in
            guard
                let self = self
            else {
                self?.delegate?.updateFailed(message: "TabBarItemViewModel is missing!")
                return
                
            }
            
            switch result {
            case .failure(let error):
                print(error)
                self.delegate?.updateFailed(message: error.errorMessage)
            case .success(let response):
                self.addItemsToData(response: response)
                self.pageURLString = response.next
            }
            self.delegate?.showASndHideDownloadIndicator(self, isShow: false)
        })
    }
    
    func addItemsToData(
        response: T? = nil
    ) {
        guard let list = response?.results as? [any ResponseModelProtocol] else { return }
        
        list.forEach({ (item) in
            let names = cacheModels.compactMap({ $0.name })
            if !names.contains(item.name ) {
                cacheModels.append(item)
            }
        })
        let models = createModels(models: list)
        delegate?.didUpdatedDataSource(self, models: models)
    }
    
    func createModels(
        models: [any ResponseModelProtocol]
    ) -> [StarWarsCellModel] {
        let list: [StarWarsCellModel] = (0..<models.count).map { (index) -> StarWarsCellModel in
            return StarWarsCellModel(
                name: models[index].name,
                imageNameType: models[index].imageType,
                urlString: models[index].urlString
            )
        }
        return list
    }
    
    func getTitle() -> String {
        return tabItem.title
    }
    
    func getItemsCounter() -> Int {
        return cacheModels.count
    }
}
