//
//  LetterView.swift
//  WordHunt
//
//  Created by arbenjusufhayati on 7/10/16.
//  Copyright © 2016 Versus UE. All rights reserved.
//

import UIKit

protocol ViewTouchDelegate{
    func TouchedView(view:LetterView, touch:UITouch)
}

@IBDesignable class LetterView: UIView{
    
    var view: UIView!
    
    var nibName: String = "LetterView"
    
    var delegate: ViewTouchDelegate?
    var touched: Bool = false
    
    @IBOutlet var label: UILabel!
    
    var model : LetterBoxModel!{
        
        didSet{
            updateLabel()
        }
    }
    
    func updateLabel(){
        self.label.text = self.model!.boxLetter
        self.view.setNeedsLayout()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    func setup(){
        
      self.view = loadViewFromNib()
      self.view.multipleTouchEnabled = true
        
      self.view.frame = bounds
        //self.view.autoresizingMask = UIViewAutoresizing.FlexibleHeight
        
        addSubview(self.view)
    
    }
    
    func loadViewFromNib() -> UIView{
        
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        return view
        
    }
    
    func TouchedView(view: LetterView, touch:UITouch) {
        print("touched \(self.label.text)")
    }
    


}
