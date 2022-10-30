//
//  StageViewController.swift
//  TosInfoApp
//
//  Created by 黃偉倫 on 2020/5/4.
//  Copyright © 2020 Wei-Lun Huang. All rights reserved.
//

import UIKit
import CoreData

class StageViewController: UIViewController {
    
    @IBOutlet weak var Stagename: UILabel!
    @IBOutlet weak var Stageimage: UIImageView!
    
    
    @IBAction func Prevbutton(_ sender: Any) {
        self.stagenumber = self.stagenumber  - 1
        if self.stagenumber < 0 {
            self.stagenumber = 0
            
        }
        updatestage()
        
        print("Previous stage")
        
    }
    
    
    @IBAction func Nextbutton(_ sender: Any) {
        self.stagenumber = self.stagenumber  + 1
        let max = self.StageObjs.count - 1
        
                if self.stagenumber > max {
            self.stagenumber = self.StageObjs.count - 1
                    print("max")
            
        }

        updatestage()
        
        print("Next stage")
        
    }
    
    
    
    
    
    var managedObjectContext: NSManagedObjectContext!
    var appDelegate: AppDelegate!
    
    var stagenumber = 0
    var StageObjs: [NSManagedObject] = []
    //Segue
    
    
    func printStage(_ player: NSManagedObject) {
    let name = Stages.value(forKey: "name") as? String
    let step = Stages.value(forKey: "step") as? Int
    let bossimage = Stages.value(forKey: "bossimage") as? String
    let stageimage = Stages.value(forKey: "stageimage") as? String

       
    print("FoodItem: name = \(name!), health = \(step!) image: \(bossimage!)")
        
    }
    
    func updatestage(){
        /*
    // let StagesA = getStages()
        let Stages = NSEntityDescription.entity(forEntityName: "Stages", in: managedObjectContext)
        
        let stageimg = Stages.stagenumber
     
        self.Stagename.text = Stages.stagenumber(forKey: "name") as? String
       // self.Stageimage.image =
 */
        if self.stagenumber > self.StageObjs.count {
            self.stagenumber = self.StageObjs.count
            
        }
        let stageitem = StageObjs[self.stagenumber]
        
        let stageimg = stageitem.value(forKey: "stageimage") as? String
        self.Stageimage.image = UIImage(named: stageimg!)
        
        self.Stagename.text = stageitem.value(forKey: "name") as? String
        
        print("update \(self.stagenumber)")
        
        
    }
    
    
     func getStages() -> [NSManagedObject] {
     let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Stages")
     var players: [NSManagedObject] = []
     do {
     players = try self.managedObjectContext.fetch(fetchRequest)
     } catch {
     print("getPlayers error: \(error)")
     }
     return players
     }
    
    
     func printStages(_ player: NSManagedObject) {
     let name = player.value(forKey: "name") as? String
     let health = player.value(forKey: "step") as? Int
     print("Player: name = \(name!), health = \(health!)")
        
     }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        super.viewDidLoad()
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        managedObjectContext = appDelegate.persistentContainer.viewContext
        
         
        print("To Stage   receive \(self.stagenumber)")
        
        updatestage()

        
        // Do any additional setup after loading the view.
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
