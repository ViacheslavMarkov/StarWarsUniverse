//
//  OnboardingView.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 13.04.2023.
//

import UIKit

protocol OnboardingViewDelegate: AnyObject {
    func didTapMainButton(_ sender: OnboardingView)
}

final class OnboardingView: UIView {
    
    weak var delegate: OnboardingViewDelegate?
    private let buttonHeight: CGFloat = 56
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .clear
        image.image = .image(name: .starWarsImage, renderingMode: .alwaysOriginal)
        image.contentMode = .scaleToFill
        return image
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func setup() {
        add([
            image,
            button
        ])
        
        image.autoPinEdgesToSuperView()
        
        NSLayoutConstraint.activate([
            button.leading.constraint(equalTo: leading, constant: 36),
            button.trailing.constraint(equalTo: trailing, constant: -36),
            button.bottom.constraint(equalTo: bottom, constant: -50),
            button.height.constraint(equalToConstant: buttonHeight)
        ])
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc
    private func buttonTapped(_ sender: UIButton) {
        delegate?.didTapMainButton(self)
    }
    
    func configure() {
        button.setTitle(text: "Go to main screen")
        button.setTitleColor(color: .white)
        button.set(cornerRadius: 8)
        button.backgroundColor = .lightGray.withAlphaComponent(0.8)
    }
}
