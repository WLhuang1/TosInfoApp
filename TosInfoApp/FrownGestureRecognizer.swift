//
//  FrownGestureRecognizer.swift
//  TosInfoApp
//
//  Created by 黃偉倫 on 2020/5/5.
//  Copyright © 2020 Wei-Lun Huang. All rights reserved.
//

import UIKit
import UIKit.UIGestureRecognizerSubclass

class FrownGestureRecognizer: UIGestureRecognizer {
    
        
       var initialPoint: CGPoint!
       var previousPoint: CGPoint!
       var midPoint: CGPoint!
       
       var boxViews: [UIView] = []
       func drawBox(_ point: CGPoint) {
       let boxRect = CGRect(x: point.x, y: point.y,
       width: 5.0, height: 5.0)
       let boxView = UIView(frame: boxRect)
       boxView.backgroundColor = UIColor.red
       self.view?.addSubview(boxView)
       boxViews.append(boxView)
       }
       
       func clearBoxes() {
       for boxView in boxViews {
       boxView.removeFromSuperview()
       }
       boxViews.removeAll()
       }
       
       override func touchesBegan(_ touches: Set<UITouch>,
       with event: UIEvent) {
       print("backslash: touchesBegan FF")
       let touch = touches.first
       if let point = touch?.location(in: self.view) {
       initialPoint = point
       previousPoint = point
       midPoint = point
       state = .began
              drawBox(point)
           
           }
       }
       
       override func touchesMoved(_ touches: Set<UITouch>,
       with event: UIEvent) {
       print("backslash: touchesMoved FF")
       let touch = touches.first
       if let point = touch?.location(in: self.view) {
       if (point != previousPoint) {
       previousPoint = point
       state = .changed
           print("change FF")
           if (midPoint.y > point.y){
               midPoint = point
               print("mid change FF")
               
           }
           drawBox(point)
    
       } else {
       state = .failed
           print("fail FF")
       }
       }
       }
       
       override func touchesEnded(_ touches: Set<UITouch>,
       with event: UIEvent) {
       print("backslash: touchesEnded FF")
       let touch = touches.first
       if let point = touch?.location(in: self.view) {
           
           if (midPoint.y < point.y) {
       drawBox(point)
       state = .ended
           print("end FF")

       } else {
       state = .failed
           print("fail FF")
       }
           
       }
       }
       
       override func touchesCancelled(_ touches: Set<UITouch>,
       with event: UIEvent) {
       print("backslash: touchesCancelled FF")
       state = .cancelled
           print("cancel FF")
       }
       
       override func reset() {
       print("backslash: reset FF")
       }

    

}
