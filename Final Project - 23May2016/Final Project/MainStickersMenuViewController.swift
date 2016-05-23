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
    
    
    
    @IBOutlet weak var button4: UIButton!
    
    
    
    @IBOutlet weak var button5: UIButton!
    
    
    @IBOutlet weak var button6: UIButton!
    
    let color1:[CGFloat] = [249,81,114]//light pink
    let color2:[CGFloat] = [255,227,59]
    let color3:[CGFloat] = [255,244,80]
    let color4:[CGFloat] = [218,40,90]//pink
    let color5:[CGFloat] = [253, 210, 46]//dark yellow
    let color6:[CGFloat] = [254,239,1]
    let color7:[CGFloat] = [86,84,102]//grey
    let cornerRadius:CGFloat = 0
    let borderWidth:CGFloat = 2
    let choices:[String] = ["Monthly","Weekly","Milestones","","","Humour"]
    var choice:Int = 2
    
    
    
    
    @IBAction func button1Clicked(sender: AnyObject) {
        choice = 1
        print(choices[choice-1])
        
    }
    
    
    
    
    @IBAction func button2Clicked(sender: AnyObject) {
        choice = 2
        print(choices[choice-1])
    }
    
    
    
    @IBAction func button3Clicked(sender: AnyObject) {
        choice = 3
        print(choices[choice-1])
    }
    
    
    
    @IBAction func button4Clicked(sender: AnyObject) {
        choice = 4
        print(choices[choice-1])
    }
    
    
    
    @IBAction func button5Clicked(sender: AnyObject) {
        choice = 5
       print(choices[choice-1])
    }
    
    
    
    @IBAction func button6Clicked(sender: AnyObject) {
        choice = 6
        print(choices[choice-1])
        
    }
    
 
    @IBAction func unwindtoMainStickersMenu(segue:UIStoryboardSegue) {
        
        print("Unwind from sticker display")
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        
        //set up of button colors, style and titles
        
        button1.backgroundColor = UIColor(red: color1[0]/255, green: color1[1]/255, blue: color1[2]/255, alpha: 1.0)
        
        button1.layer.cornerRadius = cornerRadius
        button1.layer.borderColor = UIColor.whiteColor().CGColor
        button1.layer.borderWidth = borderWidth
        
        button1.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        button1.setTitle(choices[0], forState: UIControlState.Normal)
        
        
        button2.backgroundColor = UIColor(red: color2[0]/255, green: color2[1]/255, blue: color2[2]/255, alpha: 1)
       button2.layer.cornerRadius = cornerRadius
        button2.layer.borderColor = UIColor.whiteColor().CGColor
        button2.layer.borderWidth = borderWidth
        
       button2.setTitleColor(UIColor(red: color7[0]/255, green: color7[1]/255, blue: color7[2]/255, alpha: 1), forState: UIControlState.Normal)
        button2.setTitle(choices[1], forState: UIControlState.Normal)
    
        
        button3.backgroundColor = UIColor(red: color3[0]/255, green: color3[1]/255, blue: color3[2]/255, alpha: 1)
        button3.layer.cornerRadius = cornerRadius
        button3.layer.borderColor = UIColor.whiteColor().CGColor
        button3.layer.borderWidth = borderWidth
        button3.setTitleColor(UIColor(red: color7[0]/255, green: color7[1]/255, blue: color7[2]/255, alpha: 1), forState: UIControlState.Normal)
        button3.setTitle(choices[2], forState: UIControlState.Normal)
        
        
        button4.backgroundColor = UIColor(red: color4[0]/255, green: color4[1]/255, blue: color4[2]/255, alpha: 1)
        button4.layer.cornerRadius = cornerRadius
        button4.layer.borderColor = UIColor.whiteColor().CGColor
        button4.layer.borderWidth = borderWidth
       button4.setTitle(choices[3], forState: UIControlState.Normal)
        
        
        button5.backgroundColor = UIColor(red: color5[0]/255, green: color5[1]/255, blue: color5[2]/255, alpha: 1)
        button5.layer.cornerRadius = cornerRadius
        button5.layer.borderColor = UIColor.whiteColor().CGColor
       button5.layer.borderWidth = borderWidth
        button5.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        button5.setTitle(choices[4], forState: UIControlState.Normal)
        
        
        button6.backgroundColor = UIColor(red: color6[0]/255, green: color6[1]/255, blue: color6[2]/255, alpha: 1)
        button6.layer.cornerRadius = cornerRadius
        button6.layer.borderColor = UIColor.whiteColor().CGColor
        button6.layer.borderWidth = borderWidth
        button6.setTitleColor(UIColor(red: color7[0]/255, green: color7[1]/255, blue: color7[2]/255, alpha: 1), forState: UIControlState.Normal)
        button6.setTitle(choices[5], forState: UIControlState.Normal)
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let destination = segue.destinationViewController as? StickersDisplayViewController{
            
            destination.choice = self.choice
        }
    }
   
}
