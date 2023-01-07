//
//  ActivityView.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 06.01.2023.
//

import UIKit

final class ActivityView: UIView {
    let indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        return indicator
    }()
    
    weak var delegate: ContainerTableViewDelegate?
    
    private var dataSource: DataSource?
    private var snapshot = Snapshot()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        add([
            indicator
        ])
        
        NSLayoutConstraint.activate([
            indicator.centerY.constraint(equalTo: centerY),
            indicator.centerX.constraint(equalTo: centerX),
            indicator.height.constraint(equalToConstant: 40),
            indicator.width.constraint(equalTo: indicator.height)
        ])
    }
    
    func startAnimating() {
        indicator.startAnimating()
    }
    
    func stopAnimating() {
        indicator.stopAnimating()
    }
}
