//
//  OnboardingView.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 13.04.2023.
//

import UIKit

protocol OnboardingViewDelegate: AnyObject {
    func didTapMainButton(_ sender: OnboardingView, tag: Int)
}

final class OnboardingView: UIView {
    
    weak var delegate: OnboardingViewDelegate?
    private let buttonHeight: CGFloat = 56
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = false
        scrollView.contentInsetAdjustmentBehavior = .never
        return scrollView
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
            scrollView
        ])
        
        scrollView.autoPinEdgesToSuperView()
    }
    
    @objc
    private func buttonTapped(_ sender: UIButton) {
        delegate?.didTapMainButton(self, tag: sender.tag == 3 ? sender.tag : scrollView.currentPage())
    }
    
    private func makeImageAndTwoButtonView (
        model: OnboardingModel,
        index: Int
    ) -> ImageAndTwoButtonView {
        let imageAndTwoButtonView = ImageAndTwoButtonView()
        imageAndTwoButtonView.configure(at: model)
        imageAndTwoButtonView.nextButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        imageAndTwoButtonView.nextButton.tag = index
        imageAndTwoButtonView.skipButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        imageAndTwoButtonView.skipButton.tag = 3
        return imageAndTwoButtonView
    }
    
    func configureScrollViewContent(models: [OnboardingModel]) {
        for (index, model) in models.enumerated() {
            let imageAndTwoButtonView = makeImageAndTwoButtonView(model: model, index: index)
            scrollView.add([imageAndTwoButtonView])

            NSLayoutConstraint.activate([
                imageAndTwoButtonView.top.constraint(equalTo: scrollView.top),
                imageAndTwoButtonView.bottom.constraint(equalTo: scrollView.bottom),
                imageAndTwoButtonView.width.constraint(equalTo: scrollView.width),
                imageAndTwoButtonView.height.constraint(equalTo: scrollView.height)
            ])

            switch index {
            case 0:
                NSLayoutConstraint.activate([
                    imageAndTwoButtonView.leading.constraint(equalTo: scrollView.leading)
                ])

                if models.count == 1 {
                    NSLayoutConstraint.activate([
                        imageAndTwoButtonView.trailing.constraint(equalTo: scrollView.trailing)
                    ])
                }
            case models.count - 1:
                let prevView = scrollView.subviews[index - 1]
                NSLayoutConstraint.activate([
                    imageAndTwoButtonView.leading.constraint(equalTo: prevView.trailing),
                    imageAndTwoButtonView.trailing.constraint(equalTo: scrollView.trailing)
                ])
            default:
                let prevView = scrollView.subviews[index - 1]
                NSLayoutConstraint.activate([
                    imageAndTwoButtonView.leading.constraint(equalTo: prevView.trailing)
                ])
            }
        }
    }
}
