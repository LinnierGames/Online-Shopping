//
//  CoreDataStack.swift
//  Online-Shopping
//
//  Created by Erick Sanchez on 2/6/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//

import Foundation
import CoreData

final class CoreDataStack {
    static let shared = CoreDataStack()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Online_Shopping")
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var viewContext: NSManagedObjectContext = {
        let viewContext = persistentContainer.viewContext
        return viewContext
    }()
    
    lazy var newPrivateContext: NSManagedObjectContext = {
        return persistentContainer.newBackgroundContext()
    }()
    
    func save(to context: NSManagedObjectContext = CoreDataStack.shared.viewContext) {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
