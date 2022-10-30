//
//  FriendTableViewController.swift
//  TosInfoApp
//
//  Created by 黃偉倫 on 2021/4/28.
//  Copyright © 2021 Wei-Lun Huang. All rights reserved.
//

import UIKit

class FriendTableViewController: UITableViewController {

    
    var charaimg: [String] = ["001i", "002i", "003i", "004i", "005i", "006i", "007i", "008i", "009i", "010i", "011i", "012i", "013i", "014i", "015i", "016i", "017i", "018i", "019i", "020i", "021i", "022i", "023i", "024i", "025i", "026i", "027i", "028i", "029i", "030i", "031i", "032i", "033i", "034i", "035i", "036i", "037i", "038i", "039i", "040i"]
    
    var TOSUID : [String] = ["110856482", "428657106", "33415252132"]
    var TOSPIC : [String] = ["002i", "003i", "004i"]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
       //Segue
       @IBAction func unwindFromAddFrienddView (sender: UIStoryboardSegue) {
       let secondVC = sender.source as! FriendAddViewController
        
        
        let UIDNO = Int(secondVC.ChaField.text!) ?? 0
            let AddText = secondVC.UIDField.text
            TOSUID.append(AddText!)
            TOSPIC.append(charaimg[UIDNO])
            
            tableView.reloadData()
        
        
       /*
           if SaveBo {
               print("Hello")
           }
       */
           
           /*
           if(addfoodname != ""){
       Addfood()
           }
    */
           
       }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return TOSUID.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriCell", for: indexPath)

            // Configure the cell...
               let row = indexPath.row
               let TTOSUID = TOSUID[row]
               let TTOSPIC = TOSPIC[row]

            cell.textLabel?.text = "UID:  \(TTOSUID) "
        
        
             //  let ccost = Fooditem.value(forKey: "cost") as? Int
             //  let crari = Fooditem.value(forKey: "rarity") as? Int
               cell.detailTextLabel?.text = " ..."
               
               
            //   let imagename = Fooditem.value(forKey: "imagename") as? String
               cell.imageView?.image = UIImage(named: TTOSPIC)
        
        
        
        // Configure the cell...

        return cell
    }
    

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

}
