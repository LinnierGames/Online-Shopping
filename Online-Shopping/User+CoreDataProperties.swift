//
//  User+CoreDataProperties.swift
//  Online-Shopping
//
//  Created by Erick Sanchez on 2/6/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "Users")
    }

    @NSManaged public var name: String?
    @NSManaged public var cart: Cart?

}
