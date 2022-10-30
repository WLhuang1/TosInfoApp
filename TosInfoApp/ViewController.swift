//
//  ViewController.swift
//  TosInfoApp
//
//  Created by 黃偉倫 on 2020/5/4.
//  Copyright © 2020 Wei-Lun Huang. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var gachanum: String = "Gacha"
    
    @IBOutlet weak var posterimage: UIImageView!
    
    
    //gesture
    
    var SmileRec = SmileGestureRecognizer(target: self, action: #selector(handleSmile))
    var FrownRec = FrownGestureRecognizer(target: self, action: #selector(handleFrown))
  
    
    @IBAction func Clearbutton(_ sender: Any) {
        SmileRec.clearBoxes()
        FrownRec.clearBoxes()
        
    self.gachanum = "Gacha"
    self.posterimage.image = UIImage(named: self.gachanum)
        
        print("clear")
        
    }
    
    func Goodfood() {
        print("Good")
        
        if(self.gachanum == "Gacha") {
            let gnum = Int.random(in: 1...20)
            if(gnum < 10){
            self.gachanum = "Pet00\(gnum)"
            print("name:\(self.gachanum)")
            }else{
                self.gachanum = "Pet0\(gnum)"
            print("name:\(self.gachanum)")
                
            }
                
        }
    self.posterimage.image = UIImage(named: "News")
        print("GOOD Change NEWS")
        
    }
    
    func Badfood() {
        print("bad")
        
        if(self.gachanum == "Gacha") {
        let gnum = Int.random(in: 21...40)
        self.gachanum = "Pet0\(gnum)"
        print("name:\(self.gachanum)")
                    
        }
    self.posterimage.image = UIImage(named: "TOS-NEWS")
        print("GOOD CHange")
        
    }
    
    
    @objc func handleSmile(_ sender: SmileGestureRecognizer) {
        print("SSSSSSSSSSS")
        
    if sender.state == .ended {
    print("backslash detected SS")
    Goodfood()
    }
        
    }
    
    @objc func handleFrown(_ sender: FrownGestureRecognizer) {
        print("FFFFFF")
        
    if sender.state == .ended {
    print("backslash detected FF")
    Badfood()
    }
        
    }
    
        // In ViewController
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
    shouldReceive touch: UITouch) -> Bool {
    if touch.view is UIButton {
    return false
    }
    // Add more checks for other types of view elements, as needed
    return true
        
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
    shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer)
    -> Bool {
    if gestureRecognizer is SmileGestureRecognizer {
    if otherGestureRecognizer is FrownGestureRecognizer {
    return true
    }
    }
    return false
        
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("hellp")
        
            // In viewDidLoad... SS
        SmileRec = SmileGestureRecognizer(target: self, action: #selector(handleSmile))
        SmileRec.delegate = self
        self.view.addGestureRecognizer(SmileRec)
                
                
            // In viewDidLoad... FF
        FrownRec = FrownGestureRecognizer(target: self, action: #selector(handleFrown))
        FrownRec.delegate = self
        self.view.addGestureRecognizer(FrownRec)
        
        //poster
        self.posterimage.image = UIImage(named: self.gachanum)
        
        
        
        
/*
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        managedObjectContext = appDelegate.persistentContainer.viewContext
        
        for index in 0...5{
            addStage(stagestep: self.stagestep[index], bossimage: self.bossimage[index], name: self.stagename[index], stageimage: self.stageimage[index])
            
            print("set \(index)")
            
        }
*/
        
    }
    
    

}

