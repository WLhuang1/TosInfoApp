//
//  FriendAddViewController.swift
//  TosInfoApp
//
//  Created by 黃偉倫 on 2021/4/28.
//  Copyright © 2021 Wei-Lun Huang. All rights reserved.
//

import UIKit

class FriendAddViewController: UIViewController {
    
    
    @IBOutlet weak var UIDField: UITextField!
    
    
    @IBOutlet weak var ChaField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func SaveButton(_ sender: Any) {
        performSegue(withIdentifier: "UnWindToFriend", sender: self)
        
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
