//
//  MainStickersMenuViewController.swift
//  Final Project
//
//  Created by Kanika Goela on 19/5/2016.
//  Copyright © 2016 Kanika Goela. All rights reserved.
//

import UIKit

class MainStickersMenuViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var button1: UIButton!
    
    
    
    @IBOutlet weak var button2: UIButton!
    
    
    
    
    @IBOutlet weak var button3: UIButton!
    
    
    
    @IBOutlet weak var button6: UIButton!
    
    
    
    let yellowColor:[CGFloat] = [255,211,59]
    let greyColor:[CGFloat] = [86,84,102]
    let pinkColor:[CGFloat] = [249,81,114]

    let buttonSize:[CGFloat] = [120.0,120.0]
    
    let cornerRadius:CGFloat = 60
    
    
    let menuChoices:[String] = ["Milestones","Humour", "Age", "Occasions"]
    var choice:Int = 2
    
    
    
    
    @IBAction func button1Clicked(sender: AnyObject) {
        choice = 1
        
    }
    
    
    
    
    @IBAction func button2Clicked(sender: AnyObject) {
        choice = 2
        
    }
    
    
    
    @IBAction func button3Clicked(sender: AnyObject) {
        choice = 3
        
    }
    
    
    

    
    
    @IBAction func button6Clicked(sender: AnyObject) {
        choice = 4
        
        
    }
    
    
    @IBAction func unwindtoMainStickersMenu(segue:UIStoryboardSegue) {
        
        print("Unwind from sticker display")
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.backgroundColor = UIColor(red: yellowColor[0]/255, green: yellowColor[1]/255, blue: yellowColor[2]/255, alpha: 1.0)
        
        
        button1.backgroundColor = UIColor(red: greyColor[0]/255, green: greyColor[1]/255, blue: greyColor[2]/255, alpha: 1.0)
        
        button1.layer.cornerRadius = cornerRadius
       
        
        button1.setTitleColor(UIColor(red: pinkColor[0]/255, green:pinkColor[1]/255, blue:pinkColor[2]/255, alpha:1.0), forState: UIControlState.Normal)
        
        button1.setTitle(menuChoices[0], forState: UIControlState.Normal)
        
        
        button2.backgroundColor = UIColor(red: greyColor[0]/255, green: greyColor[1]/255, blue: greyColor[2]/255, alpha: 1.0)
        
        button2.layer.cornerRadius = cornerRadius

        
        button2.setTitleColor(UIColor(red: pinkColor[0]/255, green:pinkColor[1]/255, blue:pinkColor[2]/255, alpha:1.0), forState: UIControlState.Normal)
        
        button2.setTitle(menuChoices[1], forState: UIControlState.Normal)
        
        
        button3.backgroundColor = UIColor(red: greyColor[0]/255, green: greyColor[1]/255, blue: greyColor[2]/255, alpha: 1.0)
        
        button3.layer.cornerRadius = cornerRadius
       
        button3.setTitleColor(UIColor(red: pinkColor[0]/255, green:pinkColor[1]/255, blue:pinkColor[2]/255, alpha:1.0), forState: UIControlState.Normal)
        
        
        button3.setTitle(menuChoices[2], forState: UIControlState.Normal)
        
        button6.backgroundColor = UIColor(red: greyColor[0]/255, green: greyColor[1]/255, blue: greyColor[2]/255, alpha: 1.0)
        
        button6.layer.cornerRadius = cornerRadius
        
        
        button6.setTitleColor(UIColor(red: pinkColor[0]/255, green:pinkColor[1]/255, blue:pinkColor[2]/255, alpha:1.0), forState: UIControlState.Normal)
        
        button6.setTitle(menuChoices[3], forState: UIControlState.Normal)
        
        
        
    }
    
    
    override func viewDidLayoutSubviews() {
        
        let leftMargin:CGFloat = (self.view.frame.width - 2*buttonSize[0])/3
        
        let topMargin:CGFloat = (self.view.frame.height - 2*buttonSize[1]-leftMargin)/2
        
        
        print(leftMargin)
        
        print(topMargin)
        
        
        button1.frame = CGRect(x: leftMargin, y: topMargin, width: buttonSize[0], height: buttonSize[1])
        
        button2.frame = CGRect(x: (2*leftMargin)+buttonSize[0], y: topMargin, width: buttonSize[0], height: buttonSize[1])
        
        button3.frame = CGRect(x: leftMargin, y: topMargin+leftMargin+buttonSize[1], width: buttonSize[0], height: buttonSize[1])
        
        button6.frame = CGRect(x: 2*leftMargin + buttonSize[0], y: topMargin+leftMargin+buttonSize[1], width: buttonSize[0], height: buttonSize[1])
        
        
    }
    
    
       
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        
         if let destination = segue.destinationViewController as? StickersDisplayViewController{
            
            destination.menuChoice = self.menuChoices[choice-1]
        
    }

        
        
    }
    
    
        
  
    
    
}
