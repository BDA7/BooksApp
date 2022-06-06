//
//  BookCollectionViewCell.swift
//  BooksApp
//
//  Created by Данила on 05.06.2022.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {
    lazy var image: UIImageView = { return UIImageView() }()

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.addSubview(image)
        image.frame = contentView.bounds
    }

    func loadImage(named: String) {
        image.image = UIImage(named: named)
    }
}
