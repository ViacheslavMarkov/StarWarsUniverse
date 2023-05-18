//
//  DescriptionViewController.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 15.05.2023.
//

import UIKit

final class DescriptionViewController<T: ResponseModelProtocol>: UIViewController {
    var coordinator: DescriptionCoordinator<T>?
    
    var viewModel: DescriptionViewModelProtocol
    
    init(viewModel: DescriptionViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchItemData()
    }
}

//MARK: - DescriptionViewController
private extension DescriptionViewController {
    func setupDescriptionView(at dictionary: [String: Any]) {
        let descriptionView = DescriptionView(dictionary: dictionary)
        descriptionView.delegate = self
        
        view.addSubview(descriptionView)
        descriptionView.autoPinSafeEdgesToSuperView(topConstant: 16)
    }
}

//MARK: - DescriptionViewModelDelegate
extension DescriptionViewController: DescriptionViewModelDelegate {
    func updateFailed(message: String) {
        hideActivityIndicator()
        presentBasicAlert(message: message, isAutomaticallyDismissed: true) {
            print("presentBasicAlert")
        }
    }
    
    func showHideDownloadIndicator(_ sender: DescriptionViewModelProtocol, isShow: Bool) {
        isShow ? showActivityIndicator() : hideActivityIndicator()
    }
    
    func didFetchData(_ sender: DescriptionViewModelProtocol) {
        let dictionary = viewModel.getDictionary()
        guard
            let descriptionView = view.subviews.compactMap({ $0 as? DescriptionView }).first
        else {
            setupDescriptionView(at: dictionary)
            return
        }
        descriptionView.updateUI(at: dictionary)
        title = viewModel.getTitle()
    }
}

//MARK: - DescriptionViewDelegate
extension DescriptionViewController: DescriptionViewDelegate {
    func didTapNewURL(_ sender: DescriptionView, urlString: String) {
        viewModel.updateData(at: urlString)
        
        guard let tab = viewModel.getTab() else { return }
        switch tab {
        case .people:
            viewModel = DescriptionViewModel<PeopleModel>(urlString: urlString)
        case .starships:
            viewModel = DescriptionViewModel<StarShipModel>(urlString: urlString)
        case .planets:
            viewModel = DescriptionViewModel<PlanetModel>(urlString: urlString)
        case .species:
            viewModel = DescriptionViewModel<SpecieModel>(urlString: urlString)
        case .vehicles:
            viewModel = DescriptionViewModel<VehicleModel>(urlString: urlString)
        case .films:
            viewModel = DescriptionViewModel<FilmModel>(urlString: urlString)
        }
        
        viewModel.delegate = self
        viewModel.fetchItemData()
    }
}
