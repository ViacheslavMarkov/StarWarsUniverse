//
//  ImageAndTwoButtonView.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 18.05.2023.
//

import UIKit

final class ImageAndTwoButtonView: UIView {
    private let buttonHeight: CGFloat = 56
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .clear
        image.image = .image(name: .starWarsImage, renderingMode: .alwaysOriginal)
        image.contentMode = .scaleToFill
        return image
    }()
    
    let skipButton: UIButton = {
        let button = UIButton()
        button.isUserInteractionEnabled = true
        return button
    }()
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.isUserInteractionEnabled = true
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
            nextButton,
            skipButton
        ])
        
        image.autoPinEdgesToSuperView()
        
        NSLayoutConstraint.activate([
            nextButton.leading.constraint(equalTo: leading, constant: 36),
            nextButton.trailing.constraint(equalTo: trailing, constant: -36),
            nextButton.bottom.constraint(equalTo: bottom, constant: -50),
            nextButton.height.constraint(equalToConstant: buttonHeight),
            
            skipButton.top.constraint(equalTo: safeTop),
            skipButton.width.constraint(equalToConstant: buttonHeight),
            skipButton.trailing.constraint(equalTo: trailing, constant: -24)
        ])
    }

    func configure(at model: OnboardingModel) {
        image.image = .image(name: model.pageImageType, renderingMode: .alwaysOriginal)
        
        nextButton.setTitle(text: model.nextButtonText)
        nextButton.setTitleColor(color: .white)
        nextButton.set(cornerRadius: 8)
        nextButton.backgroundColor = .lightGray.withAlphaComponent(0.8)
        
        skipButton.setTitle(text: model.skipButtonText ?? "")
        skipButton.isHidden = model.skipButtonText == nil
        skipButton.setTitleColor(color: .white)
        skipButton.set(cornerRadius: 8)
        skipButton.backgroundColor = .lightGray.withAlphaComponent(0.8)
    }
}
