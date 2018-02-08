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
    
    // MARK: - RETURN VALUES
    
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Remove"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FavoriteTableViewCell
        
        let favoriteItem = fetchedResultsController.product(at: indexPath)
        cell.configure(favoriteItem)
        cell.delegate = self
        
        return cell
    }
    
    // MARK: - VOID METHODS
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "show product":
                guard
                    let nv = segue.destination as? UINavigationController,
                    let vc = nv.topViewController as? ProductDetailViewController,
                    let indexPath = tableView.indexPath(for: sender as! UITableViewCell) else {
                        return assertionFailure("no index path found")
                }
                
                let product = fetchedResultsController.product(at: indexPath)
                vc.product = product
            default: break
            }
        }
    }
    
    // MARK: Table View
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        //TODO: Remove from favorites
    }
    
    // MARK: - IBACTIONS
    
    // MARK: - LIFE CYCLE
    
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
