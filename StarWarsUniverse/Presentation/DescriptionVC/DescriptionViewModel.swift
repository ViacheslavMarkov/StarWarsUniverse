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
}

protocol DescriptionViewModelDelegate: AnyObject {
    func showHideDownloadIndicator(_ sender: DescriptionViewModelProtocol, isShow: Bool)
    func didFetchData(_ sender: DescriptionViewModelProtocol)
    func updateFailed(message: String)
}

final class DescriptionViewModel: DescriptionViewModelProtocol {
    
    weak var delegate: DescriptionViewModelDelegate?
    var response: PeopleModel?
    
    var urlString: String
    
    init(urlString: String) {
        self.urlString = urlString
    }
    
    func fetchItemData() {
        delegate?.showHideDownloadIndicator(self, isShow: true)
        
        StarWarsService().fetchData(by: urlString) { [weak self] (result: Result<PeopleModel, ApiError>) in
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
                self.delegate?.didFetchData(self)
            }
            self.delegate?.showHideDownloadIndicator(self, isShow: false)
        }
    }
    
    func getDictionary() -> [String: Any] {
        guard let item = response else { return [:] }
        return item.description
    }
    
    func updateData(at newUrlString: String) {
        urlString = newUrlString
        response = nil
        fetchItemData()
    }
}
