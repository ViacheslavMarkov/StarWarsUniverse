//
//  UIView+Extension.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 27.12.2022.
//

import UIKit

// MARK: - Inits
extension UIView {
    convenience init(backgroundColor: UIColor) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
    }

    convenience init(
        backgroundColor: UIColor? = nil,
        cornerRadius: CGFloat? = nil
    ) {
        self.init(frame: .zero)

        if let backgroundColor = backgroundColor {
            self.backgroundColor = backgroundColor
        }

        if let cornerRadius = cornerRadius {
            self.set(cornerRadius: cornerRadius)
        }
    }
}

// MARK: - Helpers
extension UIView {
    static var reuseIdentifier: String {
        String(describing: self)
    }
    
    var safeTop: NSLayoutYAxisAnchor {
        safeAreaLayoutGuide.topAnchor
    }
    
    var safeLeading: NSLayoutXAxisAnchor {
        safeAreaLayoutGuide.leadingAnchor
    }
    
    var safeBottom: NSLayoutYAxisAnchor {
        safeAreaLayoutGuide.bottomAnchor
    }
    
    var safeTrailing: NSLayoutXAxisAnchor {
        safeAreaLayoutGuide.trailingAnchor
    }
    
    var top: NSLayoutYAxisAnchor {
        topAnchor
    }
    
    var leading: NSLayoutXAxisAnchor {
        leadingAnchor
    }
    
    var bottom: NSLayoutYAxisAnchor {
        bottomAnchor
    }
    
    var trailing: NSLayoutXAxisAnchor {
        trailingAnchor
    }
    
    var centerX: NSLayoutXAxisAnchor {
        centerXAnchor
    }
    
    var centerY: NSLayoutYAxisAnchor {
        centerYAnchor
    }
    
    var height: NSLayoutDimension {
        heightAnchor
    }
    
    var width: NSLayoutDimension {
        widthAnchor
    }
    
    func add(_ subviews: [UIView]) {
        subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
    func autoPinSafeEdgesToSuperView(bottomConst: CGFloat = 0, topConstant: CGFloat = 0) {
        guard let superView = superview else {
            return
        }
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            safeTop.constraint(equalTo: superView.safeTop, constant: topConstant),
            safeLeading.constraint(equalTo: superView.safeLeading),
            safeTrailing.constraint(equalTo: superView.safeTrailing),
            safeBottom.constraint(equalTo: superView.safeBottom, constant: bottomConst)
        ])
    }
    
    func autoPinEdgesToSuperView() {
        guard let superView = superview else {
            return
        }
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            top.constraint(equalTo: superView.top),
            leading.constraint(equalTo: superView.leading),
            trailing.constraint(equalTo: superView.trailing),
            bottom.constraint(equalTo: superView.bottom)
        ])
    }
    
    func set(cornerRadius: CGFloat) {
        clipsToBounds = true
        layer.masksToBounds = true
        layer.cornerRadius = cornerRadius
    }
    
    func set(borderColor: UIColor, borderWidth: CGFloat = 1) {
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
    }
    
    func setShadow(
        shadowColor: CGColor = UIColor.black.cgColor,
        shadowOffset: CGSize = CGSize(width: 0, height: 4),
        shadowRadius: CGFloat = 4.0,
        shadowOpacity: Float = 0.25
    ) {
        self.layer.shadowColor = shadowColor
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOpacity = shadowOpacity
    }
}
