//
//  CharacterController.swift
//  TosInfoApp
//
//  Created by 黃偉倫 on 2020/5/5.
//  Copyright © 2020 Wei-Lun Huang. All rights reserved.
//

import UIKit
import CoreData

class CharacterController: UITableViewController {
    
    var managedObjectContext: NSManagedObjectContext!
    var appDelegate: AppDelegate!
    
    var CharaObjs: [NSManagedObject] = []
    
    var characost: [Int] = [1, 2, 4, 9, 1, 2, 4, 9, 1, 2, 4, 9, 1, 2, 4, 9, 1, 2, 4, 9, 1, 2, 4, 9, 1, 2, 4, 9, 1, 2, 4, 9, 1, 2, 4, 9, 1, 2, 4, 9]
    var charararity: [Int] = [2, 3, 4, 5, 2, 3, 4, 5, 2, 3, 4, 5, 2, 3, 4, 5, 2, 3, 4, 5, 2, 3, 4, 5, 2, 3, 4, 5, 2, 3, 4, 5, 2, 3, 4, 5, 2, 3, 4, 5]
    
    var charaacts: [String] = ["Explode all Earth Runestones to deal a Water Damage to all enemies.", "Explode all Earth Runestones to deal a Water Damage to all enemies.", "Explode all Earth Runestones to deal a Water Damage to all enemies.", "Explode all Earth Runestones to deal a Water Damage to all enemies and generate Enchanted Runestones", "Explode all Water Runestones to deal a Fire Damage to all enemies", "Explode all Water Runestones to deal a Fire Damage to all enemies", "Explode all Water Runestones to deal a Fire Damage to all enemies", "Explode all Water Runestones to deal a Fire Damage to all enemies and generate Enchanted Runestones", "Explode all Fire Runestones to deal an Earth Damage to all enemies", "Explode all Fire Runestones to deal an Earth Damage to all enemies", "Explode all Fire Runestones to deal an Earth Damage to all enemies", "Explode all Fire Runestones to deal an Earth Damage to all enemies and generate Enchanted Runestones", "Explode all Dark Runestones to deal a Light Damage to all enemies", "Explode all Dark Runestones to deal a Light Damage to all enemies", "Explode all Dark Runestones to deal a Light Damage to all enemies", "Explode all Dark Runestones to deal a Light Damage to all enemies and generate Enchanted Runestones", "Explode all Light Runestones to deal a Dark Damage to all enemies", "Explode all Light Runestones to deal a Dark Damage to all enemies", "Explode all Light Runestones to deal a Dark Damage to all enemies", "Explode all Light Runestones to deal a Dark Damage to all enemies and generate Enchanted Runestones", "Turn all Heart Runestones into Water Runestones", "Turn all Heart Runestones into Water Runestones", "Turn all Heart Runestones into Water Runestones", "Turn all Heart Runestones into Water Runestones", "Turn all Earth Runestones into Heart Runestones.", "Turn all Earth Runestones into Heart Runestones.", "Turn all Earth Runestones into Heart Runestones.", "Turn all Earth Runestones into Heart Runestones.", "Damage received -50% for 3 Rounds.", "Damage received -50% for 3 Rounds.", "Damage received -50% for 3 Rounds.", "Damage received -50% for 3 Rounds.", "Enemies' Defense -75% for 3 Rounds.", "Enemies' Defense -75% for 3 Rounds.", "Enemies' Defense -75% for 3 Rounds.", "Enemies' Defense -90% for 3 Rounds.", "Turn all Light Runestones into Heart Runestones.", "Turn all Light Runestones into Heart Runestones.", "Turn all Light Runestones into Heart Runestones.", "Turn all Light Runestones into Heart Runestones."]
    
    var charaleads: [String] = ["Water Attack x 1.5", "Water Attack x 1.5", "Water Attack x 2", "Water Attack x 2", "Fire Attack x 1.5", "Fire Attack x 1.5", "Fire Attack x 2", "Fire Attack x 2", "Earth Attack x 1.5", "Earth Attack x 1.5", "Earth Attack x 2", "Earth Attack x 2", "Light Attack x 1.5", "Light Attack x 1.5", "Light Attack x 2", "Light Attack x 2", "Dark Attack x 1.5", "Dark Attack x 1.5", "Dark Attack x 2", "Dark Attack x 2", "Dragon Attack x 2", "Dragon Attack x 2", "Dragon Attack x 2", "Dragon Attack x 2.5", "Beast Recovery x 2", "Beast Recovery x 2", "Beast Recovery x 2", "Beast Recovery x 2.5", "Beast HP x 2", "Beast HP x 2", "Beast HP x 2", "Beast HP x 2.5", "Beast Attack x 2", "Beast Attack x 2", "Beast Attack x 2", "Beast Attack x 2.5", "Beast Attack x 2", "Beast Attack x 2", "Beast Attack x 2", "Beast Attack x 2.5"]

    var charaatt: [String] = ["Water", "Water", "Water", "Water", "Fire", "Fire", "Fire", "Fire", "Earth", "Earth", "Earth", "Earth", "Light", "Light", "Light", "Light", "Dark", "Dark", "Dark", "Dark","Water", "Water", "Water", "Water", "Fire", "Fire", "Fire", "Fire", "Earth", "Earth", "Earth", "Earth", "Light", "Light", "Light", "Light", "Dark", "Dark", "Dark", "Dark"]
    var chararace: [String] = ["Human", "Human", "Human", "Human", "Human", "Human", "Human", "Human","Human", "Human", "Human", "Human","Human", "Human", "Human", "Human","Human", "Human", "Human", "Human", "Dragon", "Dragon", "Dragon", "Dragon", "Beast", "Beast", "Beast", "Beast", "Beast", "Beast", "Beast", "Beast","Beast", "Beast", "Beast", "Beast","Beast", "Beast", "Beast", "Beast","Beast", "Beast", "Beast", "Beast"]

    var charaname: [String] = ["Molly", "Hydromancer Molly", "Aqua Sorceress Molly", "Aqua Elementalist Molly", "Sean", "Swordsman Sean", "Blazing Swordsman Sean", "Inferno Swordsman Sean", "Duncan", "Cleric Duncan", "Druid Duncan", "Lord of Forest Duncan", "Baron Nathaniel", "Viscount Nathaniel", "Earl Nathaniel", "Marquess Nathaniel", "Solace Endor", "Dark Mage Endor", "Dark Archmage Endor", "Necromancer Endor", "Aqua Solitary", "Prime Aqua Ascetic", "Hermit of Dainty Rivers", "Qinglong the Sage of the East", "Pyro Solitary", "Prime Pyro Ascetic", "Hermit of Searing Blazes", "Zhuque the Sage of the South", "Terra Solitary", "Prime Terra Ascetic", "Hermit of the Vague Territory", "Xuanwu the Sage of the North", "Light Solitary", "Prime Light Ascetic", "Hermit of Luminous Virtue", "Baihu the Sage of the West", "Shadow Solitary", "Prime Shadow Ascetic", "Hermit of Noble Authority", "Taotie the Sage of the Center"]

    var charaimg: [String] = ["001i", "002i", "003i", "004i", "005i", "006i", "007i", "008i", "009i", "010i", "011i", "012i", "013i", "014i", "015i", "016i", "017i", "018i", "019i", "020i", "021i", "022i", "023i", "024i", "025i", "026i", "027i", "028i", "029i", "030i", "031i", "032i", "033i", "034i", "035i", "036i", "037i", "038i", "039i", "040i"]

    //number,  series
    
    
    
    
    
    func addChara(chano: Int, chacost: Int, chara: Int, chaname: String, charace: String, chaatt: String, chaact: String, chalead: String, chaimg: String, chaser: String) -> NSManagedObject
    {
        let fooditem = NSEntityDescription.insertNewObject(forEntityName: "Characters", into: self.managedObjectContext)
     fooditem.setValue(chano, forKey: "number")
     fooditem.setValue(chacost, forKey: "cost")
     fooditem.setValue(chara, forKey: "rarity")
     fooditem.setValue(chaname, forKey: "name")
     fooditem.setValue(charace, forKey: "race")
     fooditem.setValue(chaatt, forKey: "attribute")
     fooditem.setValue(chaact, forKey: "activeskill")
     fooditem.setValue(chalead, forKey: "leaderskill")
     fooditem.setValue(chaimg, forKey: "imagename")
     fooditem.setValue(chaser, forKey: "series")
 
        appDelegate.saveContext()
        
        return fooditem
    }
    
    
    func initializeChara() {
        
        var Newchara = addChara(chano: 0, chacost: self.characost[0], chara: self.charararity[0], chaname: self.charaname[0], charace: self.chararace[0], chaatt: self.charaatt[0], chaact: self.charaacts[0], chalead: self.charaleads[0], chaimg: self.charaimg[0], chaser: "nothing")
        
        
    for index in 0...19 {
     let cnum = index + 1
     let cseries = "Protagonists"
     
    var Newchara = addChara(chano: cnum, chacost: characost[index], chara: charararity[index], chaname: charaname[index], charace: chararace[index], chaatt: charaatt[index], chaact: charaacts[index], chalead: charaleads[index], chaimg: charaimg[index], chaser: cseries)
            
            print("set \(index)")
            
            CharaObjs.append(Newchara)
            print("Append OK")
            
            tableView.reloadData()
            print("Reload OK")
            
        }
     
    for index in 20...39 {
      let cnum = index + 1
      let cseries = "Protagonists"
      
     var Newchara = addChara(chano: cnum, chacost: characost[index], chara: charararity[index], chaname: charaname[index], charace: chararace[index], chaatt: charaatt[index], chaact: charaacts[index], chalead: charaleads[index], chaimg: charaimg[index], chaser: cseries)
             
             print("set \(index)")
             
             CharaObjs.append(Newchara)
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
        
        initializeChara()
        
        
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return CharaObjs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "CharaCell", for: indexPath)

           // Configure the cell...
           let row = indexPath.row
           let Fooditem = CharaObjs[row]
      
           let cname = Fooditem.value(forKey: "name") as? String
           let cnum = Fooditem.value(forKey: "number") as? Int
        cell.textLabel?.text = "No. \(cnum!) : \(cname!)"
    
    
         //  let ccost = Fooditem.value(forKey: "cost") as? Int
         //  let crari = Fooditem.value(forKey: "rarity") as? Int
           cell.detailTextLabel?.text = " ..."
           
           
           let imagename = Fooditem.value(forKey: "imagename") as? String
           cell.imageView?.image = UIImage(named: imagename!)
    
    
           return cell
       }
    
    
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

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
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        
        
        if segue.identifier == "ToCharacterInformation" {
            let vc = segue.destination as! CharacterInformationViewController
            let index = self.tableView.indexPathForSelectedRow?.row
            
            vc.selectNum = index!
            
      //      print(BasicNotes[index!].value(forKey: "content")!)
            print("To Detail View")
            
          //  vc.quotation = quotations[index!]
        }
    }
    

}
