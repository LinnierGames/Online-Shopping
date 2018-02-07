//
//  User+CoreDataClass.swift
//  Online-Shopping
//
//  Created by Erick Sanchez on 2/6/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//
//

import Foundation
import CoreData

@objc(User)
public class User: NSManagedObject {
    
    public required convenience init(name: String, in context: NSManagedObjectContext) {
        self.init(context: context)
        
        self.name = name
    }

}
