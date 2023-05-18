//
//  OnboardingViewController.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 13.04.2023.
//

import UIKit

final class OnboardingViewController: UIViewController {
    var coordinator: OnboardingCoordinator?
    
    var viewModel: OnboardingViewModelProtocol
    
    init(viewModel: OnboardingViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let onboardingView: OnboardingView = {
        let view = OnboardingView()
        view.backgroundColor = .white
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainView()
    }
}

//MARK: - OnboardingViewController
private extension OnboardingViewController {
    func setupMainView() {
        let models = viewModel.data
        onboardingView.configureScrollViewContent(models: models)
        onboardingView.delegate = self
        view.add([onboardingView])
        onboardingView.autoPinEdgesToSuperView()
    }
}

//MARK: - OnboardingViewDelegate
extension OnboardingViewController: OnboardingViewDelegate {
    func didTapMainButton(_ sender: OnboardingView, tag: Int) {
        switch tag {
        case 3:
            UserDefaultsWrapper.set(true, key: .hasSeenOnboarding)
            appDelegate?.showMainTabBarController()
        default:
            onboardingView.scrollView.scrollTo(page: tag + 1)
        }
    }
}
