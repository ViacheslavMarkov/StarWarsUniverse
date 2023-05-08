//
//  TabBarItemView.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 08.05.2023.
//

import UIKit

public final class TabBarItemView: UIView {
    private lazy var vStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [image, label],
                                axis: .vertical)
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 0
        return stack
    }()
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .clear
        image.isUserInteractionEnabled = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.minimumScaleFactor = 0.7
        return label
    }()
    
    private let item: Tab
    
    init(item: Tab) {
        self.item = item
        super.init(frame: .zero)
        setup()
        configureUI()
    }
    
    public required init?(coder: NSCoder) {
        assertionFailure("No storyboards")
        return nil
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = .clear
    }
    
    private func setup() {
        add([
            vStack
        ])
        vStack.autoPinEdgesToSuperView()
        
        NSLayoutConstraint.activate([
            image.height.constraint(equalToConstant: 30),
            image.width.constraint(equalToConstant: 30)
        ])
    }
    
    private func configureUI() {
        image.image = item.image
        image.backgroundColor = .clear
        
        label.text = item.title
        label.isHidden = item.title.isEmpty
    }
    
    func updateUI(isSelected: Bool) {
        image.tintColor = isSelected ? item.selectedColor : item.unselectedColor
        
        label.textColor = isSelected ? item.selectedColor : item.unselectedColor
        label.font = isSelected ? .customFont(type: .bold, size: 12) : .customFont(type: .semiBold, size: 10)
    }
}
