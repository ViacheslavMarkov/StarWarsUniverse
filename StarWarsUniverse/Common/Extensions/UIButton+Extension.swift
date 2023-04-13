//
//  UIButton+Extension.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 13.04.2023.
//

import UIKit

extension UIButton {
    func setTitleColor(color: UIColor = .black) {
            setTitleColor(color, for: .normal)
    }
    
    func setTitle(text: String = "") {
        setTitle(text, for: .normal)
    }
    
    func setFont(font: UIFont = .customFont(type: .bold, size: 24)) {
        titleLabel?.font = font
    }
    
    func setImage(image: UIImage = .image(name: .emptyImage, renderingMode: .alwaysOriginal) ?? UIImage()) {
        setImage(image, for: .normal)
    }
}
