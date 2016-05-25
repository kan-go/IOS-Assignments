//
//  ViewController.swift
//  Final Project
//
//  Created by Kanika Goela on 16/5/2016.
//  Copyright © 2016 Kanika Goela. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var backgroundView: UIView!
    
    
    @IBOutlet weak var getStartedButton: UIButton!
    
    
    
    @IBOutlet weak var importButton: UIButton!
    
    
    
    @IBOutlet weak var cameraButton: UIButton!
    
    
    
    @IBOutlet weak var logoView: UIView!
    
    
    var choice:String = ""
    
    
    let yellowColor:[Int] = [255,211,59]
    
    let greyColor:[Int] = [86,84,102]
    
    // pink = [218,40,90]
    // grey = [86,84,102]
    // original yellow = [253,236,76], 255,227,59
  
    
    
    let buttonSize:[CGFloat] = [75.0,75.0]
    let buttonSize2:[CGFloat] = [77.0,77.0]
    let logoSize:[CGFloat] = [120,120]
    
    
    
    @IBAction func getStartedButtonClicked(sender: AnyObject) {
        
     

        
        
        
       
        
    }
    
    
    
    @IBAction func unwindtoVC(segue:UIStoryboardSegue) {
        print ("Unwind to starting VC")
        
    }
    
    
    
    func convert (color:Int)->CGFloat{
        
        var converted:CGFloat = CGFloat(color)
        
        return converted/255
    }
    
    
    
    
    @IBAction func importButtonClicked(sender: AnyObject) {
        choice = "import"
        
        
    }
    
    
    
    @IBAction func cameraButtonClicked(sender: AnyObject) {
        choice = "camera"
        
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        backgroundView.backgroundColor = UIColor(red: convert(yellowColor[0]), green: convert(yellowColor[1]), blue: convert(yellowColor[2]), alpha: 1.0)
        
                getStartedButton.layer.cornerRadius = 5.0
        
        getStartedButton.backgroundColor = UIColor.clearColor()
        getStartedButton.setTitle("", forState: UIControlState.Normal)
        getStartedButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        getStartedButton.setImage(UIImage(named: "stamp-2.png"), forState: UIControlState.Normal)
        
        
        //        getStartedButton.layer.borderColor = UIColor.whiteColor().CGColor
        //
        //        getStartedButton.layer.borderWidth = 0.0
    
        //getStartedButton.backgroundColor = UIColor(red: convert(buttonColor[0]), green: convert(buttonColor[1]), blue: convert(buttonColor[2]), alpha: 1.0)
        
//                getStartedButton.setTitle("Browse Stickers", forState:UIControlState.Normal)
//                getStartedButton.setTitleColor(UIColor(red: convert(greyColor[0]), green: convert(greyColor[1]), blue: convert(greyColor[2]), alpha: 1.0), forState: UIControlState.Normal)
//        
        
        
  
        importButton.layer.cornerRadius = 5.0
        cameraButton.layer.cornerRadius = 5.0
        
        importButton.backgroundColor = UIColor.clearColor()
        cameraButton.backgroundColor = UIColor.clearColor()
        
        
        
        importButton.setTitle("", forState: UIControlState.Normal)
        cameraButton.setTitle("", forState: UIControlState.Normal)
        importButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        cameraButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        
        importButton.setImage(UIImage(named: "photo-2.png"), forState: UIControlState.Normal)
        cameraButton.setImage(UIImage(named: "photo-camera.png"), forState: UIControlState.Normal)
        
        logoView.backgroundColor = UIColor(red: convert(greyColor[0]), green: convert(greyColor[1]), blue: convert(greyColor[2]), alpha: 1.0)
        
        logoView.layer.cornerRadius = 60.0
        
        //logoView.layer.borderWidth = 5.0
        
        //logoView.layer.borderColor = UIColor(red: convert(yellowColor[0]), green: convert(yellowColor[1]), blue: convert(yellowColor[2]), alpha: 1.0).CGColor
        
        
        
            
            
            
            
            
            
            
            
            
            //checking if camera is available
            if (UIImagePickerController.isSourceTypeAvailable(.Camera)){
            cameraButton.enabled = false
        }
        
        
    }
    
    
    override func viewDidLayoutSubviews() {
        
        var leftMargin:CGFloat = (backgroundView.frame.width-(3*buttonSize[0]))/4
        
        
        var topMargin:CGFloat = 3*(backgroundView.frame.height-buttonSize[1])/4
        
        //var leftMargin2:CGFloat = (backgroundView.frame.width-buttonSize2[0])/2
        
        var leftMarginLogo = (backgroundView.frame.width - logoSize[0])/2
        var topMarginLogo = (backgroundView.frame.height - logoSize[1])/4
        
        
        

        importButton.frame = CGRect(x: leftMargin, y: topMargin, width: buttonSize[0], height: buttonSize[1])
        
        cameraButton.frame = CGRect(x: (2*leftMargin+buttonSize[0]), y: topMargin, width: buttonSize[0], height: buttonSize[1])
        
        getStartedButton.frame = CGRect(x: 3*leftMargin+2*buttonSize[0], y: topMargin, width: buttonSize2[0], height: buttonSize2[1])
        
        logoView.frame = CGRect(x:leftMarginLogo, y: topMarginLogo, width: logoSize[0], height: logoSize[1])
        
        

        
        
        //getStartedButton.frame = CGRect(x: leftMargin, y: topMargin, width: buttonSize[0], height: buttonSize[1])
        
        
        
        
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let destination = segue.destinationViewController as? ImageSelectionViewController
            
        {
            destination.count = 1
            destination.choice = self.choice
            print ("Preparing for segue")
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}

