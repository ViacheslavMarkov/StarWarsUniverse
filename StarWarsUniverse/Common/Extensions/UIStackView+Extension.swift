//
//  UIStackView+Extension.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 28.12.2022.
//

import UIKit

extension UIStackView {
    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis = .horizontal) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
    }

    func add(arrangedSubviews: [UIView]) {
        arrangedSubviews.forEach {
            addArrangedSubview($0)
        }
    }

    func removeArrangedSubviews() {
        arrangedSubviews.forEach {
            removeArrangedSubview($0)
        }
    }
}
