//
//  BeerTableViewCell.swift
//  TestG
//
//  Created by Ostap Derkach on 22.01.2020.
//  Copyright © 2020 Test. All rights reserved.
//

import UIKit
import Kingfisher

final class BeerTableViewCell: BaseTableViewCell, ReusableIdentifier, NibLoadable {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var taglineLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var beerImageView: UIImageView!

    struct Configuration: Equatable {
        let name: String
        let tagline: String
        let descriptionInfo: String
        let beerImageURL: URL?
    }

    private func setupStyling() {
        contentView.backgroundColor = UIColor.cellBackground

        beerImageView.contentMode = .scaleAspectFit
        beerImageView.clipsToBounds = true
        beerImageView.backgroundColor = UIColor.cellBackground

        nameLabel.numberOfLines = 0
        taglineLabel.numberOfLines = 0
        descriptionLabel.numberOfLines = 0

        Style.Label.cellTitle(nameLabel)
        Style.Label.cellTitle1(descriptionLabel)
        Style.Label.cellDescription(descriptionLabel)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupStyling()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = ""
        taglineLabel.text = ""
        descriptionLabel.text = ""
        beerImageView.image = nil
    }

    func update(with configuration: Configuration) {
        nameLabel.text = configuration.name
        taglineLabel.text = configuration.tagline
        descriptionLabel.text = configuration.descriptionInfo
        beerImageView.kf.setImage(with: configuration.beerImageURL,
                                  placeholder: Asset.beerPlaceholder.image,
                                  options: [.backgroundDecode, .transition(.fade(0.2))])
    }
}

extension BeerTableViewCell.Configuration {
    init(with beer: Beer) {
        self.init(name: beer.name,
                  tagline: beer.tagline,
                  descriptionInfo: beer.description,
                  beerImageURL: URL(string: beer.beerImageUrl))
    }
}
