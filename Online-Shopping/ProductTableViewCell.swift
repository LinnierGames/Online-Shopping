//
//  ProductTableViewCell.swift
//  Online-Shopping
//
//  Created by Erick Sanchez on 2/7/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//

import UIKit

@objc protocol ProductTableViewCellDelegate {
    @objc optional func product(cell: ProductTableViewCell, didPressFavorite sender: UIButton)
    @objc optional func product(cell: ProductTableViewCell, didPressCart sender: UIButton)
}

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    @IBOutlet weak var delegate: ProductTableViewCellDelegate?
    
    func configure(product: Product) {
        self.labelTitle.text = product.title
        self.labelDescription.text = String(product.price)
        if product.isStarred {
            self.favoritButton.backgroundColor = .green
        } else {
            self.favoritButton.backgroundColor = .clear
        }
    }

    @IBOutlet weak var cartButton: UIButton!
    @IBAction func pressCart(_ sender: UIButton) {
        delegate?.product?(cell: self, didPressCart: sender)
    }
    
    @IBOutlet weak var favoritButton: UIButton!
    @IBAction func pressFavorite(_ sender: UIButton) {
        delegate?.product?(cell: self, didPressFavorite: sender)
    }
}
