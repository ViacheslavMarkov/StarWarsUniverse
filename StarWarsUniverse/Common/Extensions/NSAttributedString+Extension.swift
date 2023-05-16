//
//  NSAttributedString+Extension.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 16.05.2023.
//

import UIKit

extension NSAttributedString {
    static func strokeText(
        string: String,
        font: UIFont,
        textColor: UIColor
    ) -> NSAttributedString {
        let dictionary = [NSAttributedString.Key.font: font,
                          NSAttributedString.Key.underlineColor: textColor,
                          NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
                          NSAttributedString.Key.foregroundColor: textColor] as [NSAttributedString.Key : Any]
        return NSAttributedString(string: string, attributes: dictionary)
    }
}
