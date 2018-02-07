//
//  Cart+CoreDataClass.swift
//  Online-Shopping
//
//  Created by Erick Sanchez on 2/6/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Cart)
public class Cart: NSManagedObject {
    
    public required convenience init(title: String, for user: User, in context: NSManagedObjectContext) {
        self.init(context: context)
        
        self.title = title
        self.user = user
    }

}
