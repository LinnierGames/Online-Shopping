//
//  FavoriteTableViewCell.swift
//  Online-Shopping
//
//  Created by Erick Sanchez on 2/7/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//

import UIKit

@objc protocol FavoriteTableViewCellDelegate {
    @objc optional func favorite(cell: FavoriteTableViewCell, didPressAddToCart button: UIButton)
}

class FavoriteTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    @IBOutlet weak var delegate: FavoriteTableViewCellDelegate?
    
    func configure(_ product: Product) {
        self.labelTitle.text = product.title
        self.labelDescription.text = String(product.price)
    }
    
    @IBOutlet weak var addButton: UIButton!
    @IBAction func pressAddToCart(_ sender: UIButton) {
        delegate?.favorite?(cell: self, didPressAddToCart: sender)
    }
    
}
