//
//  LabelTableViewCell.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 05.01.2023.
//

import UIKit

protocol DescriptionTableViewCellDelegate: AnyObject {
    func didTapItem(_ sender: DescriptionTableViewCell, urlString: String)
}

final class DescriptionTableViewCell: UITableViewCell, NibCapable {
    weak var delegate: DescriptionTableViewCellDelegate?
    
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
    
    var indexPath: IndexPath? = nil {
        didSet {
            title.isHidden = indexPath?.row != 0
        }
    }

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
        info.attributedText = nil
        info.text = nil
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
        updateUI(infoText: infoText)
    }
    
    private func updateUI(infoText: String) {
        let isAttributed = infoText.contains("https://swapi.dev/api")
        let textColor: UIColor = isAttributed ? .systemBlue : .darkGray
        if isAttributed {
            let attributed = NSAttributedString
                .strokeText(
                    string: infoText,
                    font: .customFont(type: .semiBold, size: 14),
                    textColor: textColor)
            info.attributedText = attributed
            info.isUserInteractionEnabled = true
            
            let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapLink))
            info.addGestureRecognizer(gesture)
        } else {
            info.text = infoText
        }
    }
    
    @objc
    private func didTapLink(_ sender: UITapGestureRecognizer) {
        guard
            let label = sender.view as? UILabel,
            let urlString = label.text
        else { return }
        delegate?.didTapItem(self, urlString: urlString)
    }
}
