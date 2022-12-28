//
//  UIFont+Extension.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 28.12.2022.
//

import UIKit

public extension UIFont {
    enum FontType: String {
        case black = "Montserrat-Black"
        case bold = "Montserrat-Bold"
        case extraBold = "Montserrat-ExtraBold"
        case regular = "Montserrat-Regular"
        case semiBold = "Montserrat-SemiBold"
    }

    static func customFont(
        type: FontType,
        size: CGFloat
    ) -> UIFont {
        UIFont(name: type.rawValue, size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
}
