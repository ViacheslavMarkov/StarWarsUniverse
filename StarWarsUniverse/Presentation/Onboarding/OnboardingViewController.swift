//
//  OnboardingViewController.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 13.04.2023.
//

import UIKit

final class OnboardingViewController: UIViewController {
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
        onboardingView.configure()
        onboardingView.delegate = self
        view.add([onboardingView])
        onboardingView.autoPinEdgesToSuperView()
    }
}

//MARK: - OnboardingViewDelegate
extension OnboardingViewController: OnboardingViewDelegate {
    func didTapMainButton(_ sender: OnboardingView) {
        UserDefaultsWrapper.set(true, key: .hasSeenOnboarding)
        appDelegate?.showMainTabBarController()
    }
}
