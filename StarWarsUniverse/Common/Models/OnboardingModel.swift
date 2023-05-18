//
//  OnboardingModel.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 18.05.2023.
//

import Foundation

struct OnboardingModel: Hashable {
    let pageImageType   : ImageNameType
    let nextButtonText  : String
    let skipButtonText  : String?

    init(
        pageImageType   : ImageNameType,
        nextButtonText  : String,
        skipButtonText  : String?
    ) {
        self.pageImageType  = pageImageType
        self.nextButtonText = nextButtonText
        self.skipButtonText = skipButtonText
    }
}
