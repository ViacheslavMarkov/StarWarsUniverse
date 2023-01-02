//
//  UIImage+Extension.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 01.01.2023.
//

import UIKit

extension UIImage {
    static func image(
        name: ImageNameType,
        renderingMode: RenderingMode = .alwaysTemplate
    ) -> UIImage? {
        .init(named: name.rawValue)?
        .withRenderingMode(renderingMode)
    }
}
