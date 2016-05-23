//
//  ImageEditingViewController.swift
//  Final Project
//
//  Created by Kanika Goela on 21/5/2016.
//  Copyright © 2016 Kanika Goela. All rights reserved.
//

import UIKit

class ImageEditingViewController: UIViewController {
    
    

    @IBOutlet weak var mainImage: UIImageView!
    
    

    @IBOutlet weak var stickerImage: UIImageView!
    
    
    @IBOutlet weak var menuView: UIView!
    
    
    
    @IBOutlet weak var rejectButton: UIButton!
    
    
    
    @IBOutlet weak var acceptButton: UIButton!
    
    
    
    let yellowColor:[CGFloat] = [253,236,76]
    
    let greyColor:[CGFloat] = [86,84,102]
    
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    
    var imagePicked = UIImage()
    
    var stickerPicked = UIImage()
    
    
    
    
    
    @IBAction func panHandler(sender: UIPanGestureRecognizer) {
        
        print("pan")
        
        
        let translation = sender.translationInView(self.view)
        
        if let view = sender.view{
            
            let x:CGFloat = view.center.x + translation.x
            
            let y:CGFloat = view.center.y + translation.y
            
            view.center = CGPoint(x: x, y: y)
            
        }
        
        sender.setTranslation(CGPointZero, inView: self.view)
        //By doing this, we are resetting the view to where the pan sent it

        
        
    }
    
    
    
    
    @IBAction func pinchHandler(sender: UIPinchGestureRecognizer) {
        
        print(sender.scale)
        
        if let view = sender.view {
            view.transform = CGAffineTransformScale(view.transform, sender.scale, sender.scale)
            
        }
        
        sender.scale = 1
        //this is setting the scale to the new value
 
        
        
    }
    
    
    
    @IBAction func acceptButtonClicked(sender: AnyObject) {
        
        UIGraphicsBeginImageContextWithOptions(imagePicked.size, true, 0.0)
        imagePicked.drawInRect(CGRect(x: 0.0, y: 0.0, width: imagePicked.size.width, height: imagePicked.size.height))
        stickerImage.drawRect(CGRect(x: (imagePicked.size.width - stickerPicked.size.width), y: (imagePicked.size.height - stickerPicked.size.height), width: stickerPicked.size.width, height: stickerPicked.size.width))
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        
        
    }
    
    
    

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: greyColor[0]/255, green: greyColor[1]/255, blue: greyColor[2]/255, alpha: 1.0)

        
        menuView.backgroundColor = UIColor(red: greyColor[0]/255, green: greyColor[1]/255, blue: greyColor[2]/255, alpha: 1.0)
        
        rejectButton.backgroundColor = UIColor(red: yellowColor[0]/255, green: yellowColor[1]/255, blue: yellowColor[2]/255, alpha: 1.0)
        acceptButton.backgroundColor = UIColor(red: yellowColor[0]/255, green: yellowColor[1]/255, blue: yellowColor[2]/255, alpha: 1.0)
        
        rejectButton.layer.cornerRadius = 20.0
       acceptButton.layer.cornerRadius = 20.0
        
        mainImage.image = imagePicked
        
        stickerImage.image = stickerPicked
    
        
    }
    
    
    override func viewDidLayoutSubviews() {
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

}