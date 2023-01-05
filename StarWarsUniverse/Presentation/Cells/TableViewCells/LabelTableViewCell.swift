//
//  LabelTableViewCell.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 05.01.2023.
//

import UIKit

final class LabelTableViewCell: UITableViewCell, NibCapable {
    private lazy var title: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .customFont(type: .bold, size: 16)
        return label
    }()
    
    private lazy var info: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = .customFont(type: .semiBold, size: 14)
        label.numberOfLines = 0
        return label
    }()

    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    public override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    private func setup() {
        contentView.add([
            title,
            info
        ])
        
        NSLayoutConstraint.activate([
            title.top.constraint(equalTo: top, constant: 4),
            title.leading.constraint(equalTo: leading, constant: 16),
            title.trailing.constraint(equalTo: info.leading, constant: -16),
            title.bottom.constraint(equalTo: bottom, constant: -4),
            
            info.top.constraint(equalTo: top, constant: 4),
            info.trailing.constraint(equalTo: trailing, constant: -16),
            info.bottom.constraint(equalTo: bottom, constant: -4)
        ])
        
        self.selectionStyle = .none
    }
    
    func configure(titleText: String, infoText: String) {
        title.text = "\(titleText) :"
        info.text = "\(infoText)"
    }
}
