//
//  MainView.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 27.12.2022.
//

import UIKit

protocol MainViewDelegate: AnyObject {
    func filterTapped(_ sender: MainView, selectedIndex: Int)
}

public final class MainView: UIView {
    private let hStack: UIStackView = {
        let hStack = UIStackView()
        hStack.alignment = .fill
        hStack.distribution = .fillEqually
        return hStack
    }()
    
    private let fullLineView = UIView(backgroundColor: .black)
    private let selectedLineView = UIView(backgroundColor: .red)

    private lazy var selectedLineViewLeading = selectedLineView.leading.constraint(equalTo: self.leading)
    
    public let tableView = UITableView()
    
    private let filterViewHeight: CGFloat = 40
    private let space: CGFloat = 16
    
    weak var delegate: MainViewDelegate?

    public init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()

        let multiplier = 1.0 / CGFloat(hStack.arrangedSubviews.count)
        
        guard selectedLineView.frame.width != self.frame.width * multiplier else { return }
        NSLayoutConstraint.activate([
            selectedLineView.width.constraint(equalTo: fullLineView.width, multiplier: multiplier)
        ])
    }
    
    private func setup() {
        add([
            hStack,
            fullLineView,
            selectedLineView,
            tableView
        ])

        NSLayoutConstraint.activate([
            hStack.top.constraint(equalTo: safeTop),
            hStack.leading.constraint(equalTo: leading),
            hStack.trailing.constraint(equalTo: trailing),
            hStack.height.constraint(equalToConstant: filterViewHeight),
            hStack.bottom.constraint(equalTo: tableView.top, constant: -space),

            fullLineView.leading.constraint(equalTo: leading),
            fullLineView.trailing.constraint(equalTo: trailing),
            fullLineView.top.constraint(equalTo: hStack.bottom),
            fullLineView.height.constraint(equalToConstant: 1),

            selectedLineViewLeading,
            selectedLineView.top.constraint(equalTo: hStack.bottom, constant: -1),
            selectedLineView.height.constraint(equalToConstant: 3),
            
            tableView.leading.constraint(equalTo: leading),
            tableView.trailing.constraint(equalTo: trailing),
            tableView.bottom.constraint(equalTo: bottom)
        ])
    }
    
    func configure(filterItem: [String]) {
        if hStack.arrangedSubviews.isEmpty {
            addLabels(item: filterItem)
        } else {
            if hStack.arrangedSubviews.count == filterItem.count {
                for (value, label) in zip(filterItem, hStack.arrangedSubviews) {
                    (label as? UILabel)?.text = value
                }
            } else {
                hStack.removeArrangedSubviews()
                addLabels(item: filterItem)
            }
        }
    }
    
    private func makeLabel(text: String, tag: Int) -> UILabel {
        let label = UILabel()
        label.textColor = tag == 0 ? .black : .lightGray
        label.font = .customFont(type: .semiBold, size: 14)
        label.text = text
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        )
        label.tag = tag
        return label
    }

    private func addLabels(item: [String]) {
        for (index, value) in item.enumerated() {
            let label = makeLabel(text: value, tag: index)
            hStack.addArrangedSubview(label)
        }
    }

    @objc
    private func labelTapped(_ gesture: UITapGestureRecognizer) {
        guard let view = gesture.view as? UILabel else { return }
        
        let widthOfSubline = frame.width / CGFloat(hStack.subviews.count)
        selectedLineViewLeading.constant = widthOfSubline * CGFloat(view.tag)

        hStack.arrangedSubviews.forEach {
            if let attributedLabel = $0 as? UILabel {
                if attributedLabel.tag == view.tag {
                    attributedLabel.textColor = .black
                } else {
                    attributedLabel.textColor = .gray
                }
            }
        }

        UIViewPropertyAnimator(duration: 0.2, curve: .linear) { [weak self] in
            self?.layoutIfNeeded()
        }.startAnimation()

        delegate?.filterTapped(self, selectedIndex: view.tag)
    }
}
