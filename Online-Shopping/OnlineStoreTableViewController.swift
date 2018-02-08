//
//  OnlineStoreTableViewController.swift
//  Online-Shopping
//
//  Created by Erick Sanchez on 2/7/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//

import UIKit
import CoreData

class OnlineStoreTableViewController: FetchedResultsTableViewController {
    
    // MARK: - RETURN VALUES
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProductTableViewCell
        
        let product = fetchedResultsController.product(at: indexPath)
        cell.configure(product)
        cell.delegate = self
        
        return cell
    }
    
    // MARK: - VOID METHODS
    
    private func updateUI() {
        let fetch: NSFetchRequest<Product> = Product.fetchRequest()
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
    
    // MARK: - IBACTIONS
    
    // MARK: - LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 68
        
        saveHandler = {
            CoreDataStack.shared.save()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateUI()
    }
}

extension OnlineStoreTableViewController: ProductTableViewCellDelegate {
    func product(cell: ProductTableViewCell, didPressCart sender: UIButton) {
        //TODO: add products to carts
    }
    
    func product(cell: ProductTableViewCell, didPressFavorite sender: UIButton) {
        guard
            let indexPath = tableView.indexPath(for: cell) else {
                return assertionFailure("did not find an indexPath")
        }
        
        let product = fetchedResultsController.product(at: indexPath)
        let invertedBool = !(product.isStarred)
        product.isStarred = invertedBool
        CoreDataStack.shared.save()
        
        cell.configure(product)
    }
}
