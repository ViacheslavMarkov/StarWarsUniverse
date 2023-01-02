//
//  PlanetTableViewCell.swift
//  StarWarsUniverse
//
//  Created by Viacheslav Markov on 01.01.2023.
//

import UIKit

final class PlanetTableViewCell: UITableViewCell, NibCapable {
    private lazy var planetView: PlanetView = {
        let planetView = PlanetView()
        return planetView
    }()
    
    public static let reuseID = "PlanetTableViewCell"

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
            planetView
        ])
        
        planetView.autoPinEdgesToSuperView()
        self.selectionStyle = .none
    }
    
    func configure(item: StarWarsCellModel) {
        planetView.configure(item: item)
    }
}
