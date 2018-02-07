//
//  Product+CoreDataClass.swift
//  Online-Shopping
//
//  Created by Erick Sanchez on 2/6/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Product)
public final class Product: NSManagedObject {
    
    public required convenience init(title: String, price: Double, for cart: Cart, in context: NSManagedObjectContext) {
        self.init(context: context)
        
        self.title = title
        self.price = price
        self.cart = cart
        self.isStarred = false
    }
}

extension NSFetchedResultsController {
    @objc func proudct(at indexPath: IndexPath) -> Product {
        return self.object(at: indexPath) as! Product
    }
}
