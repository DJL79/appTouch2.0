//
//  SecondViewController.swift
//  appTouch2.0
//
//  Created by DJL on 16/05/2018.
//  Copyright © 2018 DJL. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

  
    @IBOutlet weak var viewConstraint: NSLayoutConstraint!
    // @IBOutlet weak var viewConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var sideView: UIView!
    //  @IBOutlet weak var sideView: UIView!
   // @IBOutlet weak var blurView: UIVisualEffectView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blurView.layer.cornerRadius = 15
        sideView.layer.shadowColor = UIColor.black.cgColor
        sideView.layer.shadowOpacity = 0.8
        sideView.layer.shadowOffset = CGSize(width: 5, height: 0)
        
        
        viewConstraint.constant = -175
        
    }
    
    
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
        
    @IBAction func panPerformed(_ sender: UIPanGestureRecognizer) {
    
        
        if sender.state == .began || sender.state == .changed{
            
            let translation = sender.translation(in: self.view).x
            
            if translation > 0 { //swipe right
                
                if viewConstraint.constant < 20 {
                    // self.viewConstraint.constant += translation
                    
                    UIView.animate(withDuration: 0.2) {
                        
                        self.viewConstraint.constant += translation / 10
                        self.view.layoutIfNeeded()
                    }
                }
                
            }else {     //swipe left
                
                if viewConstraint.constant > -175 {
                    // self.viewConstraint.constant += translation
                    
                    UIView.animate(withDuration: 0.2) {
                        
                        self.viewConstraint.constant += translation / 10
                        self.view.layoutIfNeeded()
                    }
                }
                
            }
            
            
        } else if sender.state == .ended {
            
            if viewConstraint.constant < -100 {
                
                UIView.animate(withDuration: 0.2) {
                    
                    self.viewConstraint.constant = -175
                    self.view.layoutIfNeeded()
                }
                
            } else {
                UIView.animate(withDuration: 0.2) {
                    
                    self.viewConstraint.constant = 0
                    self.view.layoutIfNeeded()
                }
            }
            
        }
        
    }
    
}

