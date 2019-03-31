//
//  TableViewController.swift
//  Galleria
//
//  Created by Pramodya Abeysinghe on 31/3/19.
//  Copyright © 2019 Pramodya. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController, NSFetchedResultsControllerDelegate {

    var frc: NSFetchedResultsController = NSFetchedResultsController<NSFetchRequestResult>()
    var pc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func fetchRequest() -> NSFetchRequest<NSFetchRequestResult> {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Photo")
        let sorter = NSSortDescriptor(key: "textTitle", ascending: true)
        
        fetchRequest.sortDescriptors = [sorter]
        
        return fetchRequest
    }
    
    func getFRC() -> NSFetchedResultsController<NSFetchRequestResult> {
        frc = NSFetchedResultsController(fetchRequest: fetchRequest(), managedObjectContext: pc, sectionNameKeyPath: nil, cacheName: nil)
        
        return frc
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        frc = getFRC()
        frc.delegate = self
        
        do {
            try frc.performFetch()
        } catch {
            debugPrint(">>>>>>>>>>>>> \(error.localizedDescription)")
            return
        }
        
        self.tableView.reloadData()
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let numOfRows = frc.sections?[section].numberOfObjects
        
        return numOfRows!
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        let photoItem = frc.object(at: indexPath) as! Photo
        
        cell.cellTitleLbl.text = photoItem.textTitle
        cell.cellDescLbl.text = photoItem.textDescription
        cell.cellImg.image = UIImage(data: photoItem.image! as Data)
        
        return cell
    }
 
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let managedObject : NSManagedObject = frc.object(at: indexPath) as! NSManagedObject
        pc.delete(managedObject)
        
        do {
            try pc.save()
        } catch {
            debugPrint(error.localizedDescription)
            return
        }
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "edit" {
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPath(for: cell)
            let itemController: AddViewController = segue.destination as! AddViewController
            let item: Photo = frc.object(at: indexPath!) as! Photo
            
            itemController.item = item
        }
    }
 
}
