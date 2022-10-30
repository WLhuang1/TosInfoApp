//
//  TeamViewController.swift
//  TosInfoApp
//
//  Created by 黃偉倫 on 2020/5/5.
//  Copyright © 2020 Wei-Lun Huang. All rights reserved.
//

import UIKit

class TeamViewController: UIViewController {
    
    
    @IBOutlet weak var TeaT1: UITextField!
    @IBOutlet weak var TeaT2: UITextField!
    @IBOutlet weak var TeaT3: UITextField!
    @IBOutlet weak var TeaT4: UITextField!
    @IBOutlet weak var TeaT5: UITextField!
    @IBOutlet weak var TeaT6: UITextField!
    
    @IBOutlet weak var TeaStaT: UITextField!
    
    
    var tea1: Int = 1
    var tea2: Int = 1
    var tea3: Int = 1
    var tea4: Int = 1
    var tea5: Int = 1
    var tea6: Int = 1
    var teasta: String = "..."
    
    
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    if (self.TeaT1.text != nil) {
    self.tea1 = Int(self.TeaT1.text!)!
    }
    if (self.TeaT2.text != nil) {
    self.tea2 = Int(self.TeaT2.text!)!
    }
    if (self.TeaT3.text != nil) {
    self.tea3 = Int(self.TeaT3.text!)!
    }
    if (self.TeaT4.text != nil) {
    self.tea4 = Int(self.TeaT4.text!)!
    }
    if (self.TeaT5.text != nil) {
    self.tea5 = Int(self.TeaT5.text!)!
    }
    if (self.TeaT6.text != nil) {
    self.tea6 = Int(self.TeaT6.text!)!
    }
        
    if (self.TeaStaT.text != nil) {
    self.teasta = self.TeaStaT.text!
    }
    
    if (segue.identifier == "Saveobj") {
    let secondVC = segue.destination as! TeamsController
   
        secondVC.tea1 = self.tea1
        secondVC.tea2 = self.tea2
        secondVC.tea3 = self.tea3
        secondVC.tea4 = self.tea4
        secondVC.tea5 = self.tea5
        secondVC.tea6 = self.tea6
        
        secondVC.teasta = self.teasta
        
        secondVC.SaveBo = true
        
        print("name save ")
        
    }else{
    let secondVC = segue.destination as! TeamsController
        
        secondVC.SaveBo = false
        print("name cancel")
        
        }
    
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

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
