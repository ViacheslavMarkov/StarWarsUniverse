//
//  CustomTabBarView.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 08.05.2023.
//

import UIKit

protocol CustomTabBarViewDelegate: AnyObject {
    func didTapItem(_ sender: CustomTabBarView, index: Int)
}
final class CustomTabBarView: UIView {
     weak var delegate: CustomTabBarViewDelegate?
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 2
        return stack
    }()

    private let viewHeight: CGFloat
    private let items: [Tab]

    init(
        viewHeight: CGFloat = 60,
        items: [Tab]
    ) {
        self.items = items
        self.viewHeight = viewHeight
        
        super.init(frame: .zero)
        
        setup()
        configureUI()
        updateUI()
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
            stack
        ])
        
        stack.autoPinEdgesToSuperView()
    }
    
    private func createTabBarItemView(at item: Tab) -> TabBarItemView {
        let view = TabBarItemView(item: item)
        return view
    }
    
    private func configureUI() {
        items.forEach({ item in
            let view = createTabBarItemView(at: item)
            view.tag = item.tag
            let gesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
            view.addGestureRecognizer(gesture)
            stack.addArrangedSubview(view)
        })
    }
    
    @objc
    private func viewTapped(_ sender: UITapGestureRecognizer) {
        guard let view = sender.view as? TabBarItemView else { return }
        let index = view.tag
        delegate?.didTapItem(self, index: index)
    }
    
    func updateUI(at newIndex: Int = 0) {
        for (index, view) in stack.subviews.enumerated() {
            guard let view = view as? TabBarItemView else { return }
            let isSelected = index == newIndex
            view.updateUI(isSelected: isSelected)
        }
    }
}
