//
//  CharacterInformationViewController.swift
//  TosInfoApp
//
//  Created by 黃偉倫 on 2021/4/28.
//  Copyright © 2021 Wei-Lun Huang. All rights reserved.
//

import UIKit

class CharacterInformationViewController: UIViewController {

    var charaimg: [String] = ["001D", "002D", "003D", "004D", "005D"]
    var selectNum : Int = 0
    
    @IBOutlet weak var CharaImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        selectNum = selectNum % 5
        ShowCharacter()
        
        // Do any additional setup after loading the view.
    }
    
    func ShowCharacter() {
        
        CharaImage.image = UIImage(named: charaimg[selectNum])
        
    }
    
    //Buttons
    
    @IBAction func PrevButton(_ sender: Any) {
        
        if (selectNum > 0) {
        selectNum = selectNum - 1
            ShowCharacter()
        } else {
            print("Happy")
        }

        
    }
    
    @IBAction func NextButton(_ sender: Any) {
        if (selectNum < 4) {
        selectNum = selectNum + 1
            ShowCharacter()
        } else {
            print("Happy")
        }
        
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
