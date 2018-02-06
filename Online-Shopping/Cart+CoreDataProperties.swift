//
//  Cart+CoreDataProperties.swift
//  Online-Shopping
//
//  Created by Erick Sanchez on 2/6/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//
//

import Foundation
import CoreData


extension Cart {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Cart> {
        return NSFetchRequest<Cart>(entityName: "Carts")
    }


}
