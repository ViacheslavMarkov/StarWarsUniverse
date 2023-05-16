//
//  MainItemView.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 01.01.2023.
//

import UIKit

final class MainItemView: UIView {
    let image: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .clear
        return image
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = .customFont(type: .bold, size: 18)
        label.numberOfLines = 0
        return label
    }()

    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        NSLayoutConstraint.activate([
            image.width.constraint(equalTo: image.height)
        ])
        
        image.set(cornerRadius: image.frame.height / 2)
        image.set(borderColor: .black, borderWidth: 1)
    }
    
    private func setup() {
        add([
            image,
            label
        ])

        NSLayoutConstraint.activate([
            self.height.constraint(equalToConstant: 68),
            
            image.top.constraint(equalTo: top, constant: 8),
            image.leading.constraint(equalTo: leading, constant: 16),
            image.bottom.constraint(equalTo: bottom, constant: -8),
            
            label.top.constraint(equalTo: top, constant: 8),
            label.trailing.constraint(equalTo: trailing, constant: 16),
            label.leading.constraint(equalTo: image.trailing, constant: 16),
            label.bottom.constraint(equalTo: bottom, constant: -8)
        ])
    }
    
    func configure(item: StarWarsCellModel) {
        image.image = .image(name: item.imageNameType ?? .emptyImage, renderingMode: .alwaysOriginal)
        label.text = item.name
    }
}
