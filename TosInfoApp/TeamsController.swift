//
//  TeamsController.swift
//  TosInfoApp
//
//  Created by 黃偉倫 on 2020/5/5.
//  Copyright © 2020 Wei-Lun Huang. All rights reserved.
//

import UIKit
import CoreData

class TeamsController: UITableViewController {
    
    var tea1: Int = 0
    var tea2: Int = 0
    var tea3: Int = 0
    var tea4: Int = 0
    var tea5: Int = 0
    var tea6: Int = 0
    var teasta: String = "..."
    var SaveBo: Bool = false
    
    var leadimg: String = "Gacha"
    
    
    //Segue
    @IBAction func unwindFromAddFoodView (sender: UIStoryboardSegue) {
    let secondVC = sender.source as! TeamViewController
    
        if SaveBo {
            Addfood()
        }
    
        
        /*
        if(addfoodname != ""){
    Addfood()
        }
 */
        
    }
    
    func Addfood(){
        
        let Newfood = addTeam(member1: self.tea1, member2: self.tea2, member3: self.tea3, member4: self.tea4, member5: self.tea5, member6: self.tea6, teamstage: self.teasta)
        
        TeamObjs.append(Newfood)
        print("Append OK")
        
        tableView.reloadData()
        print("Reload OK")
 
 
    }
    
    
    var managedObjectContext: NSManagedObjectContext!
    var appDelegate: AppDelegate!
    
    var TeamObjs: [NSManagedObject] = []
    
    func addTeam(member1: Int, member2: Int, member3: Int, member4: Int, member5: Int, member6: Int, teamstage: String) -> NSManagedObject
    {
        let fooditem = NSEntityDescription.insertNewObject(forEntityName: "Teams", into: self.managedObjectContext)
        fooditem.setValue(member1, forKey: "member1")
        fooditem.setValue(member2, forKey: "member2")
        fooditem.setValue(member3, forKey: "member3")
        fooditem.setValue(member4, forKey: "member4")
        fooditem.setValue(member5, forKey: "member5")
        fooditem.setValue(member6, forKey: "member6")
        fooditem.setValue(teamstage, forKey: "teamstage")
        
        appDelegate.saveContext()
        
        return fooditem
    }
    
    
    /*
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
 */
     
    /*
     func removeTeamByName(_ name: String) {
     let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Teams")
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
     */
    
     func removeTeam(_ Teams: NSManagedObject) {
     managedObjectContext.delete(Teams)
     appDelegate.saveContext()
        
     }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.viewDidLoad()
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        managedObjectContext = appDelegate.persistentContainer.viewContext
        
        tableView.reloadData()
        print("Reload OK")
        print("welcom tea")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return TeamObjs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "TeamCell", for: indexPath)

           // Configure the cell...
           let row = indexPath.row
           let Fooditem = TeamObjs[row]
      
        let mem1 = Fooditem.value(forKey: "member1") as? Int
        let mem2 = Fooditem.value(forKey: "member2") as? Int
        let mem3 = Fooditem.value(forKey: "member3") as? Int
        let mem4 = Fooditem.value(forKey: "member4") as? Int
        let mem5 = Fooditem.value(forKey: "member5") as? Int
        let mem6 = Fooditem.value(forKey: "member6") as? Int
        
        cell.textLabel?.text = "\(mem1!), \(mem2!), \(mem3!), \(mem4!), \(mem5!), \(mem6!)"
    
        let sta = Fooditem.value(forKey: "teamstage") as? String
        cell.detailTextLabel?.text = "for \(sta!)"
           
       //    let imagename = Fooditem.value(forKey: "imageFileName") as? String
       //    cell.imageView?.image = UIImage(named: imagename!)
        
    
        if (mem1! > 0) {
            if (mem1! < 10) {
                self.leadimg = "00\(mem1!)i"
                
            }  else if(mem1! < 41) {
                self.leadimg = "0\(mem1!)i"
                
            }
        
        }
        
        cell.imageView?.image = UIImage(named: self.leadimg)
        self.leadimg = "Gacha"
    
           return cell
       }
    
// Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
// Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let row = indexPath.row
            let fooditem = TeamObjs[row]
            TeamObjs.remove(at: row)
            removeTeam(fooditem)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
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
