//
//  ShareMoreViewController.swift
//  Final Project
//
//  Created by Kanika Goela on 16/5/2016.
//  Copyright © 2016 Kanika Goela. All rights reserved.
//

import UIKit

class ShareMoreViewController: UIViewController {
    
    
    @IBOutlet weak var backgroundView: UIView!
    
    
    @IBOutlet weak var shareButton: UIButton!
    
    
    @IBOutlet weak var moreButton: UIButton!
    
    
    @IBOutlet weak var doneButton: UIButton!
    
    
    
    let yellowColor:[Int] = [255,211,59]
    
    let greyColor:[Int] = [86,84,102]
    
    let buttonSize:[CGFloat] = [120.0,120.0]
    
    let cornerRadius:CGFloat = 60
    
    var items:[AnyObject] = []
    
    var imagetoShare = UIImage()
    
    
    
    func convert (color:Int)->CGFloat{
        
        var converted:CGFloat = CGFloat(color)
        
        return converted/255
    }
    
    
    
    
    @IBAction func shareButtonClicked(sender: AnyObject) {
        
        items.append(imagetoShare)
        let activityVC = UIActivityViewController(activityItems:items, applicationActivities:nil)
        
        presentViewController(activityVC, animated:true, completion:nil)
        
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        backgroundView.backgroundColor = UIColor(red: convert(yellowColor[0]), green: convert(yellowColor[1]), blue: convert(yellowColor[2]), alpha: 1.0)
        
        shareButton.layer.cornerRadius = cornerRadius
        moreButton.layer.cornerRadius = cornerRadius
        doneButton.layer.cornerRadius = cornerRadius
        
      shareButton.setTitle("Share", forState: UIControlState.Normal)
        moreButton.setTitle("More", forState: UIControlState.Normal)
        doneButton.setTitle("Done", forState: UIControlState.Normal)
        
        
        
        shareButton.backgroundColor = UIColor(red: convert(greyColor[0]), green: convert(greyColor[1]), blue: convert(greyColor[2]), alpha: 1.0)
        
        moreButton.backgroundColor = UIColor(red: convert(greyColor[0]), green: convert(greyColor[1]), blue: convert(greyColor[2]), alpha: 1.0)
        
         doneButton.backgroundColor = UIColor(red: convert(greyColor[0]), green: convert(greyColor[1]), blue: convert(greyColor[2]), alpha: 1.0)
        
//        shareButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
//         moreButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
//         doneButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
//        
        

        
        //getStartedButton.frame = CGRect(x: leftMargin, y: topMargin, width: buttonSize[0], height: buttonSize[1])
        


       
    }
    
    override func viewDidLayoutSubviews() {
        
        let leftMargin:CGFloat = (backgroundView.frame.width - buttonSize[0])/2
        
        let topMargin:CGFloat = (backgroundView.frame.height - 3*buttonSize[1])/5
        
        
        self.shareButton.frame = CGRect(x: leftMargin, y: topMargin*1.5, width: buttonSize[0], height: buttonSize[1])
        
        
        self.moreButton.frame = CGRect(x: leftMargin, y: (topMargin*2.5 + buttonSize[1]), width: buttonSize[0], height: buttonSize[1])
        
        self.doneButton.frame = CGRect(x: leftMargin, y: (topMargin*3.5 + buttonSize[1]*2), width: buttonSize[0], height: buttonSize[1])
        
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }
    

    
}
