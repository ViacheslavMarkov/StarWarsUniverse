//
//  DescriptionViewModel.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 15.05.2023.
//

import Foundation

protocol DescriptionViewModelProtocol {
    var delegate: DescriptionViewModelDelegate? { get set }
    
    func fetchItemData()
    func getDictionary() -> [String: Any]
    func updateData(at newUrlString: String)
    
    func getTitle() -> String?
    func getTab() -> Tab?
}

protocol DescriptionViewModelDelegate: AnyObject {
    func showHideDownloadIndicator(_ sender: DescriptionViewModelProtocol, isShow: Bool)
    func didFetchData(_ sender: DescriptionViewModelProtocol)
    func updateFailed(message: String)
}

final class DescriptionViewModel<T: ResponseModelProtocol>: DescriptionViewModelProtocol {
    
    weak var delegate: DescriptionViewModelDelegate?
    var response: (any ResponseModelProtocol)?
    
    var urlString: String
    private let manager = CacheDataManager.shared
    
    init(urlString: String) {
        self.urlString = urlString
    }
    
    func fetchItemData() {
        delegate?.showHideDownloadIndicator(self, isShow: true)
        
        if let model = manager.getFromCacheDictionary(by: urlString),
           let res = model as? T {
            response = res
            self.delegate?.showHideDownloadIndicator(self, isShow: false)
            self.delegate?.didFetchData(self)
            return
        }
        
        StarWarsService().fetchData(by: urlString) { [weak self] (result: Result<T, ApiError>) in
            guard
                let self = self
            else {
                self?.delegate?.updateFailed(message: "DescriptionViewModel is missing!")
                return
                }
            
            switch result {
            case .failure(let failure):
                self.delegate?.updateFailed(message: failure.errorMessage)
            case .success(let success):
                self.response = success
                manager.addToCache(model: success, by: self.urlString)
                self.delegate?.didFetchData(self)
            }
            self.delegate?.showHideDownloadIndicator(self, isShow: false)
        }
    }
    
    func getDictionary() -> [String: Any] {
        guard let item = response else { return [:] }
        return item.description.nullKeyRemoval()
    }
    
    func updateData(at newUrlString: String) {
        urlString = newUrlString
        response = nil
    }
    
    func getTab() -> Tab? {
        let list = urlString.components(separatedBy: "/")
        
        guard
            let firstIndex = list.firstIndex(of: "api"),
              let tab = Tab(rawValue: list[firstIndex + 1])
        else { return nil }
        return tab
    }
    
    func getTitle() -> String? {
        return response?.name
    }
}
