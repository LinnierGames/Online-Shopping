//
//  FavoritesTableViewController.swift
//  Online-Shopping
//
//  Created by Erick Sanchez on 2/7/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//

import UIKit
import CoreData

class FavoritesTableViewController: FetchedResultsTableViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FavoriteTableViewCell
        
        let favoriteItem = fetchedResultsController.product(at: indexPath)
        cell.configure(favoriteItem)
        cell.delegate = self
        
        return cell
    }
    
    private func updateUI() {
        let fetch: NSFetchRequest<Product> = Product.fetchRequest()
        fetch.predicate = NSPredicate(format: "isStarred = true")
        fetch.sortDescriptors = [NSSortDescriptor(key: "title", ascending: false, selector: #selector(NSString.localizedStandardCompare(_:)))]
        fetchedResultsController = NSFetchedResultsController<NSManagedObject>(
            fetchRequest: fetch as! NSFetchRequest<NSManagedObject>,
            managedObjectContext: CoreDataStack.shared.viewContext,
            sectionNameKeyPath: nil, cacheName: nil
        )
    }
    
    override func viewDidLoad() {
        tableView.rowHeight = 58
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateUI()
    }
}

extension FavoritesTableViewController: FavoriteTableViewCellDelegate {
    func favorite(cell: FavoriteTableViewCell, didPressAddToCart button: UIButton) {
        //TODO: add item to cart
    }
}
