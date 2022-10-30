//
//  StagesController.swift
//  TosInfoApp
//
//  Created by 黃偉倫 on 2020/5/4.
//  Copyright © 2020 Wei-Lun Huang. All rights reserved.
//

import UIKit
import CoreData

class StagesController: UITableViewController {
    
    var sendnumber: Int = 0
    
    //Segue
        @IBAction func unwindFromStageView (sender: UIStoryboardSegue) {
    let secondVC = sender.source as! StageViewController
        secondVC.stagenumber = self.sendnumber
            print("Back from view \(secondVC.stagenumber)")
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if (segue.identifier == "ToStage") {
    let secondVC = segue.destination as! StageViewController
        secondVC.stagenumber = self.sendnumber
        secondVC.StageObjs = self.StageObjs
        print("set stagenumber \(secondVC.stagenumber)")
    }
    }
    
    
    var managedObjectContext: NSManagedObjectContext!
    var appDelegate: AppDelegate!
    
    var StageObjs: [NSManagedObject] = []
    
    
    
    
    func addStage(stagestep: Int, bossimage: String, name: String, stageimage: String) -> NSManagedObject
    {
        let fooditem = NSEntityDescription.insertNewObject(forEntityName: "Stages", into: self.managedObjectContext)
        fooditem.setValue(name, forKey: "name")
        fooditem.setValue(stagestep, forKey: "step")
        fooditem.setValue(stageimage, forKey: "stageimage")
        fooditem.setValue(bossimage, forKey: "bossimage")
        appDelegate.saveContext()
        
        return fooditem
    }
    
    
    var stagename: [String] = ["1-1 Glacial Iceberg", "1-2 Afire Volcano", "1-3 Divine Woodland", "1-4 Holylight City", "1-5 Dark Cove", "1-6 Enochian Tower"]
    var stageimage: [String] = ["1-1", "1-2", "1-3", "1-4", "1-5", "1-6"]
    var bossimage: [String] = ["086i", "088i", "090i", "102i", "104i", "286i"]
    var stagestep: [Int] = [3, 3, 3, 3, 3, 5]
    

    
    
    
    
    
    func getStage() -> [NSManagedObject] {
     print("Get")
         
     let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Stages")
     var Foods: [NSManagedObject] = []
         
     do {
         print("Do")
     Foods = try self.managedObjectContext.fetch(fetchRequest)
         
     } catch {
     print("getPlayers error: \(error)")
         
     }
         
     return Foods
     }
     
     func printStage(_ player: NSManagedObject) {
     let name = Stages.value(forKey: "name") as? String
     let step = Stages.value(forKey: "step") as? Int
     let bossimage = Stages.value(forKey: "bossimage") as? String
     let stageimage = Stages.value(forKey: "stageimage") as? String

        
     print("FoodItem: name = \(name!), health = \(step!) image: \(bossimage!)")
         
     }
     
    /*
     func removeFoodsByName(_ name: String) {
     let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FoodItem")
     fetchRequest.predicate = NSPredicate(format: "name == %@", name)
     var Foods: [NSManagedObject]!
     do {
     Foods = try self.managedObjectContext.fetch(fetchRequest)
     } catch {
     print("removeFoodsByName error: \(error)")
     }
     for FoodItem in Foods {
     managedObjectContext.delete(FoodItem)
     }
     appDelegate.saveContext() // In AppDelegate.swift
     }
     
     func removeFood(_ FoodItem: NSManagedObject) {
     managedObjectContext.delete(FoodItem)
     appDelegate.saveContext()
     }
    */
    
    func initializestage() {
        
        var Newstage = addStage(stagestep: self.stagestep[0], bossimage: self.bossimage[0], name: self.stagename[0], stageimage: self.stageimage[0])
        
        
        for index in 0...5 {
        Newstage = addStage(stagestep: self.stagestep[index], bossimage: self.bossimage[index], name: self.stagename[index], stageimage: self.stageimage[index])
            
            print("set \(index)")
            
            StageObjs.append(Newstage)
            print("Append OK")
            
                    tableView.reloadData()
            print("Reload OK")
            
        }

        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        super.viewDidLoad()
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        managedObjectContext = appDelegate.persistentContainer.viewContext
        
        print("welcom stage")
        
        initializestage()
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return StageObjs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 

                let cell = tableView.dequeueReusableCell(withIdentifier: "StageCell", for: indexPath)

               // Configure the cell...
               let row = indexPath.row
               let Stageitem = StageObjs[row]
          
           
               cell.textLabel?.text = Stageitem.value(forKey: "name") as? String
        
        
               let calories = Stageitem.value(forKey: "step") as? Int
               cell.detailTextLabel?.text = "        \(calories!) steps"
               
               
               let imagename = Stageitem.value(forKey: "bossimage") as? String
               cell.imageView?.image = UIImage(named: imagename!)
        
        
        
        // Configure the cell...

        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
//select cell
    override func tableView(_ tableView: UITableView,
    didSelectRowAt indexPath: IndexPath) {
        
        /*
    let cell = tableView.cellForRow(at: indexPath) as! StageCell
        self.sendfood = String(cell.foodNameLabel.text!)
        print("Chabge \(self.sendfood)")
 */
        let cell = tableView.cellForRow(at: indexPath)
        self.sendnumber = indexPath.row
        
        print("row of index send")
        
        
   //  performSegue(withIdentifier: "ToStage", sender: nil)
     // sender could also be self
        
    }
    
    
    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
