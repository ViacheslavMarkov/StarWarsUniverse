//
//  UIScrollView+Extension.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 01.01.2023.
//

import UIKit

extension UIScrollView {
    func currentPage(scrollDirection: DirectionType = .horizontal) -> Int {
        switch scrollDirection {
        case .horizontal:
            return Int(contentOffset.x / frame.width)
        case .vertical:
            return Int(contentOffset.y / frame.height)
        }
    }

    func scrollTo(page: Int, scrollDirection: DirectionType = .horizontal) {
        guard page >= 0 else { return }

        let dimensionToUse = scrollDirection == .horizontal ? frame.width : frame.height
        let offset = dimensionToUse * CGFloat(page)

        switch scrollDirection {
        case .horizontal:
            setContentOffset(.init(x: offset, y: 0), animated: true)
        case .vertical:
            setContentOffset(.init(x: 0, y: offset), animated: true)
        }
    }
}
