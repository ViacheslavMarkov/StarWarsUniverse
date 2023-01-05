//
//  PresenterTableViewAlertView.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 05.01.2023.
//

import UIKit

class PresenterTableViewAlertView: UIView {
    
    var closeCallback: (() -> Void)?
    
    private let mainView: UIView = {
        let mainView = UIView()
        mainView.backgroundColor = .white
        mainView.set(cornerRadius: 15)
        return mainView
    }()
    
    private let titleLabelView: UILabel = {
        let label = UILabel()
        label.font = .customFont(type: .semiBold, size: 16)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.setImage(.image(name: .circleCloseButton, renderingMode: .alwaysOriginal), for: .normal)
        button.isUserInteractionEnabled = true
        return button
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.isScrollEnabled = false
        return tableView
    }()
    
    private var tableViewHeight = CGFloat(0)
    
    private let defaultButtonHeight = CGFloat(56)
    private let closeButtonHeight = CGFloat(30)
    private let spacing = CGFloat(12)
    private let defaultTitleHeight = CGFloat(20)
    
    var title: String
    var dictionary: [String: String]
    
    init(
        title: String,
        dictionary: [String: String]
    ) {
        self.title = title
        self.dictionary = dictionary
        
        super.init(frame: .zero)
        setup()
        
        updateUI()
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        let color = UIColor(red: 0, green: 0, blue: 0, alpha: 0.48)
        self.backgroundColor = color
        
        tableViewHeight = tableView.contentSize.height
        
        NSLayoutConstraint.activate([
            mainView.height.constraint(equalToConstant: tableViewHeight + 80),
            
            tableView.height.constraint(equalToConstant: tableViewHeight)
        ])
    }
    
    private func setup() {
        add([
            mainView
        ])
        
        mainView.add([
            titleLabelView,
            closeButton,
            tableView
        ])
        
        NSLayoutConstraint.activate([
            mainView.trailing.constraint(equalTo: trailing, constant: -16),
            mainView.leading.constraint(equalTo: leading, constant: 16),
            mainView.centerX.constraint(equalTo: centerX),
            mainView.centerY.constraint(equalTo: centerY),
            
            closeButton.trailing.constraint(equalTo: mainView.trailing, constant: -spacing),
            closeButton.top.constraint(equalTo: mainView.top, constant: spacing),
            closeButton.height.constraint(equalToConstant: closeButtonHeight),
            closeButton.width.constraint(equalToConstant: closeButtonHeight),
            closeButton.bottom.constraint(equalTo: tableView.top, constant: -spacing),
            
            titleLabelView.leading.constraint(equalTo: mainView.leading, constant: spacing),
            titleLabelView.trailing.constraint(equalTo: mainView.trailing, constant: -spacing),
            titleLabelView.centerY.constraint(equalTo: closeButton.centerY),
            
            tableView.leading.constraint(equalTo: mainView.leading, constant: spacing),
            tableView.trailing.constraint(equalTo: mainView.trailing, constant: -spacing),
            tableView.bottom.constraint(equalTo: mainView.top, constant: -spacing)
        ])
        
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeButtonTapped)))
        
        closeButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeButtonTapped)))
    }
    
    private func updateUI() {
        titleLabelView.text = title
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(LabelTableViewCell.self, forCellReuseIdentifier: LabelTableViewCell.identifier)
    }
    
    @objc
    private func closeButtonTapped(_ sender: UITapGestureRecognizer) {
        closeCallback?()
    }
}

//MARK: - UITableViewDataSource
extension PresenterTableViewAlertView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dictionary.keys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: LabelTableViewCell.identifier, for: indexPath) as? LabelTableViewCell
        else { return UITableViewCell() }
        let keys = dictionary.compactMap({ $0.key }).sorted(by: { $0 > $1 })
        let key = keys[indexPath.row]
        let itemText = dictionary[key] ?? ""
        cell.configure(titleText: key, infoText: itemText)
        return cell
    }
}

//MARK: - UITableViewDelegate
extension PresenterTableViewAlertView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
