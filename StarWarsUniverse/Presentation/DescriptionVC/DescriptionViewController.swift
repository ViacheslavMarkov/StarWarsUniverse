//
//  DescriptionViewController.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 15.05.2023.
//

import UIKit

final class DescriptionViewController: UIViewController {
    
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
        setupDescriptionView(at: dictionary)
    }
}

//MARK: - DescriptionViewDelegate
extension DescriptionViewController: DescriptionViewDelegate {
    func didTapNewURL(_ sender: DescriptionView, urlString: String) {
        viewModel.updateData(at: urlString)
    }
}
