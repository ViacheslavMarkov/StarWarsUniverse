//
//  OnboardingViewModel.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 18.05.2023.
//

import Foundation

protocol OnboardingViewModelProtocol {
    var data: [OnboardingModel] { get }
}

final class OnboardingViewModel: OnboardingViewModelProtocol {
    var data: [OnboardingModel] {
        [
            OnboardingModel(
                pageImageType: .episode1,
                nextButtonText: "Next",
                skipButtonText: "Skip"
            ),
            OnboardingModel(
                pageImageType: .episode2,
                nextButtonText: "Next",
                skipButtonText: "Skip"
            ),
            OnboardingModel(
                pageImageType: .episode3,
                nextButtonText: "Next",
                skipButtonText: "Skip"
            ),
            OnboardingModel(
                pageImageType: .episode4,
                nextButtonText: "Go to main page.",
                skipButtonText: nil
            )
        ]
    }
}
