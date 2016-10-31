//
//  ViewController.swift
//  WordHunt
//
//  Created by arbenjusufhayati on 7/10/16.
//  Copyright © 2016 Versus UE. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ViewTouchDelegate {
    
    var words: [LetterBoxModel]!
    
    var boxes : [LetterView] = [LetterView]()
    
    private var imageViews:[LetterView] = []
    
    var userAnswer: String!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        setupWords()
        setupBoxes()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func TouchedView(view: LetterView, touch: UITouch) {
     
     //   detectTouch(view, touch: touch)
        
        if !self.boxes.contains(view){
            self.boxes.append(view)
            print("touched \(view.label.text)")
        }
       
        
    }

    func detectTouch(view: LetterView, touch:UITouch){
        
 
        let touchLocation = touch.locationInView(self.view)
        
        for subview in self.view.subviews{
           
            if subview.isKindOfClass(UIStackView){
                 for sv in subview.subviews
                 {
                    if sv.isKindOfClass(LetterView){
                        let svFrame = sv.convertRect(sv.frame, toView: self.view);
                        
                        if CGRectContainsPoint(svFrame, touchLocation){
                            
                            let svLetterView = sv as! LetterView
                            
                            if !self.boxes.contains(svLetterView){
                            self.boxes.append(svLetterView)
                            print(svLetterView.label.text!)
                            }
                        }
                    }
                }
            }
           
        }
    }
    
    func setupWords() {
        
        let engine = WordEngine(capacityX: 5, capacityY: 1)
        
         words = engine.letters
        
    }
    
    func setupBoxes(){
    
        var indexBoxes = 0
        
        for subview in self.view.subviews
        {
            
            if subview.isKindOfClass(UIStackView)
            {
                let sv = subview as! UIStackView
                
                for subview in sv.subviews
                {
                    if subview.isKindOfClass(LetterView){
                        let lv = subview as! LetterView
                        
                        lv.delegate = self
                        
                        let model = words[indexBoxes]
                        lv.model = model
                   
                        indexBoxes += 1
                        
                        self.imageViews.append(lv)
                      // print(lv.model.boxLetter!)
                    }
                }
            }
        }
    }
    
    func highlightImageViews(touches: Set<NSObject>){
        if let touch = touches.first as? UITouch {
            for iv in imageViews {
                let point = touch.locationInView(iv.superview)
                
                print(point)
                print(iv.frame)
                if (CGRectContainsPoint(iv.frame, point)) {
                    iv.alpha = 0.5
                }
            }
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.highlightImageViews(touches)
        super.touchesBegan(touches, withEvent: event)
        if let touch = touches.first {
            
            
            
            if let letterView = touch.view  {
                if letterView is LetterView{
                    let lv  = letterView as? LetterView
                    lv?.delegate?.TouchedView(lv!, touch: touch)
                    print(lv?.label.text)
                }
            }
        }
        
    }
//
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.highlightImageViews(touches)
        super.touchesBegan(touches, withEvent: event)
        
        if let touch = touches.first {
            self.highlightImageViews(touches)
            for lv in touch.view!.subviews{
               
                if lv is UIStackView{
                    let svs = lv as! UIStackView
                    
                    for sv in svs.subviews {
                        
                        if let letter = sv as? LetterView{
                                  print(letter)
                        }
                  
                    }
                   
                }

            }
        }
        
    }
//
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
         super.touchesEnded(touches, withEvent: event)
        self.boxes = [LetterView]()
    }

}

