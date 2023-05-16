//
//  MainItemTableViewCell.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 01.01.2023.
//

import UIKit

final class MainItemTableViewCell: UITableViewCell, NibCapable {
    private lazy var view: MainItemView = {
        let view = MainItemView()
        return view
    }()

    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    override func prepareForReuse() {
        super.prepareForReuse()
        view.image.image = nil
        view.label.text = nil
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    private func setup() {
        contentView.add([
            view
        ])
        
        view.autoPinEdgesToSuperView()
        self.selectionStyle = .none
    }
    
    func configure(item: StarWarsCellModel) {
        view.configure(item: item)
    }
}
