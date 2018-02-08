//
//  ProductDetailViewController.swift
//  Online-Shopping
//
//  Created by Erick Sanchez on 2/7/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//

import UIKit

class ProductDetailViewController: UITableViewController {
    
    var product: Product?

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!
    
    @IBAction func pressDone(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    private func updateUI() {
        guard let product = self.product else {
            return assertionFailure("product was not set")
        }
        
        labelTitle.text = product.title
        labelPrice.text = String(product.price)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateUI()
    }
    
}
