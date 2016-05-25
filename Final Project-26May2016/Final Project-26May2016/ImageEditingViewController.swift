//
//  ImageEditingViewController.swift
//  Final Project
//
//  Created by Kanika Goela on 21/5/2016.
//  Copyright © 2016 Kanika Goela. All rights reserved.
//

import UIKit
import QuartzCore


class ImageEditingViewController: UIViewController {
    
    
    
    @IBOutlet weak var mainImage: UIImageView!
    
    
    
    @IBOutlet weak var stickerImage: UIImageView!
    
    
    @IBOutlet weak var menuView: UIView!
    
    
    
    @IBOutlet weak var rejectButton: UIButton!
    
    
    
    @IBOutlet weak var acceptButton: UIButton!
    
    
    
    let yellowColor:[CGFloat] = [255,211,59]
    
    let greyColor:[CGFloat] = [86,84,102]
    
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    
    var imagePicked = UIImage()
    
    var stickerPicked = UIImage()
    
    var x:CGFloat = 0
    var y:CGFloat = 0
    
    var newScale:CGFloat = 1
    
    var result = UIImage()
    
    
    
    @IBAction func panHandler(sender: UIPanGestureRecognizer) {
        
        
        let translation = sender.translationInView(self.view)
        
        if let view = sender.view{
            
            x = view.center.x + translation.x
            
            y = view.center.y + translation.y
            
            view.center = CGPoint(x: x, y: y)
            
            
        }
        
        sender.setTranslation(CGPointZero, inView: self.view)
        
        //By doing this, we are resetting the view to where the pan sent it
        
        
        
    }
    
    
    
    
    @IBAction func pinchHandler(sender: UIPinchGestureRecognizer) {
        
        
        if let view = sender.view {
            view.transform = CGAffineTransformScale(view.transform, sender.scale, sender.scale)
            
            print(sender.scale)
            
            newScale = newScale * sender.scale
            
        }
        
        sender.scale = 1
        
        print("new scale is \(newScale)")
        
        //this is setting the scale to the new value
        
        
    }
    
    
    
    @IBAction func acceptButtonClicked(sender: AnyObject) {
        
        
        print("Save button Clicked")
        
        let stickerWidth = stickerPicked.size.width*newScale
        let stickerHeight = stickerPicked.size.height*newScale
        let stickerSize = CGSizeMake(stickerWidth,stickerHeight)
        let stickerOrigin = stickerImage.frame.origin
        
        let mainImageWidth = imagePicked.size.width
        let mainImageHeight = imagePicked.size.height
        let mainImageSize = imagePicked.size
        
        
        let newX:CGFloat = x - stickerWidth/2
        let newY:CGFloat = y - stickerHeight/2
        
        
        print ("height is \(stickerHeight)")
        print ("width is \(stickerWidth)")
        
        print("\(newX), \(newY)")
        
        
        UIGraphicsBeginImageContextWithOptions(mainImageSize, false, 0.0)
        imagePicked.drawInRect(CGRect(x: 0.0, y: 0.0, width: mainImageWidth, height: mainImageHeight))
        stickerPicked.drawInRect(CGRect(x: newX, y: newY, width:stickerWidth, height:stickerHeight))
        result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        
        
        
        UIImageWriteToSavedPhotosAlbum(result,self, "imageSaver:error:context:", nil)
        
        
        
        
        
    }
    
    
    
    func imageSaver(finalImage:UIImage, error:NSError?, context:UnsafePointer<Void>){
        
        print(error?.localizedDescription)
        
        
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
        
        mainImage.frame.size.height = imagePicked.size.height
        mainImage.frame.size.width = imagePicked.size.width
        
        stickerImage.frame.size.height = stickerPicked.size.height
        stickerImage.frame.size.width = stickerPicked.size.width
        
    }
    
    
  
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let destination = segue.destinationViewController as? ShareMoreViewController{
            
            destination.imagetoShare = self.result
            
        }
        
        
    }
    
    
}