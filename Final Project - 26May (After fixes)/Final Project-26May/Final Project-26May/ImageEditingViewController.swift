//
//  ImageEditingViewController.swift
//  Final Project
//
//  Created by Kanika Goela on 21/5/2016.
//  Copyright © 2016 Kanika Goela. All rights reserved.
//

import UIKit
import QuartzCore
import AVFoundation


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
    
    var message:String = ""
    
    var stickerWidth = CGFloat()
    var stickerHeight = CGFloat()
    
    
    
    @IBAction func panHandler(sender: UIPanGestureRecognizer) {
        
        
        let translation = sender.translationInView(self.view)
        
        if let view = sender.view{
            
            x = view.center.x + translation.x
            
            y = view.center.y + translation.y
            
            view.center = CGPoint(x: x, y: y)
            
            
        }
        
        sender.setTranslation(CGPointZero, inView: self.view)
        
       
        
    }
    
    
    
    
    @IBAction func pinchHandler(sender: UIPinchGestureRecognizer) {
        
        
        if let view = sender.view {
            view.transform = CGAffineTransformScale(view.transform, sender.scale, sender.scale)
            
            newScale = newScale * sender.scale
            
        }
        
        sender.scale = 1
        
    }
    
    
    
    @IBAction func acceptButtonClicked(sender: AnyObject) {
        
        
        print("Save button Clicked")
        
        
        if (message != "No Image Picked"){
        
        print ("main image width is \(imagePicked.size.width) and height is \(imagePicked.size.height)")
        print ("sticker image width is \(stickerPicked.size.width) and height is \(stickerPicked.size.height)")
            
            
        print ("main image frame width is is \(mainImage.frame.size.width) and height is \(mainImage.frame.size.height) and origin is x \(mainImage.frame.origin.x) and y \(mainImage.frame.origin.y)")
            
            print ("main image position within frame is \(mainImage.displayedImageBounds().origin) and size is \(mainImage.displayedImageBounds().size)")
            
            
        print ("sticker frame width is is \(stickerImage.frame.size.width) and height is \(stickerImage.frame.height) and origin x is \(stickerImage.frame.origin.x) and y \(stickerImage.frame.origin.y)")
            
            
            print("sticker image position within frame is \(stickerImage.displayedImageBounds().origin) and size is \(stickerImage.displayedImageBounds().size)")
            
            
         
        
        let newImageWidth = imagePicked.size.width
        let newImageHeight = imagePicked.size.height
            let newImageSize = CGSizeMake(newImageWidth,newImageHeight)
            
            
            
            
        let actualX:CGFloat = (stickerImage.frame.origin.x + newScale*stickerImage.displayedImageBounds().origin.x) - (mainImage.frame.origin.x + mainImage.displayedImageBounds().origin.x)
            
            let actualY:CGFloat = (stickerImage.frame.origin.y + newScale*stickerImage.displayedImageBounds().origin.y) - (mainImage.frame.origin.y + mainImage.displayedImageBounds().origin.y)
            
            let newX:CGFloat = actualX*newImageWidth/mainImage.displayedImageBounds().size.width
            
            // this is the scaled X
            
            let newY:CGFloat = actualY*newImageHeight/mainImage.displayedImageBounds().size.height
            
            // this is the scaled Y
            
             print("new sticker origin x is \(newX), new sticker origin y is \(newY)")
            
            
            if (stickerImage.displayedImageBounds().origin.x == 0){
                
               stickerWidth = newImageWidth*stickerImage.frame.size.width/mainImage.displayedImageBounds().size.width
                
               stickerHeight = stickerPicked.size.height/stickerPicked.size.width * stickerWidth
                
            }
            
            
            else if (stickerImage.displayedImageBounds().origin.y == 0){
            
             stickerHeight = newImageHeight*stickerImage.frame.size.height/mainImage.displayedImageBounds().size.height
                
            stickerWidth = stickerPicked.size.width/stickerPicked.size.height*stickerHeight
                
                print ("new sticker width is \(stickerWidth) and new stiker height is \(stickerHeight)")
            
            }
            
            else{
                
                print ("Unexpectedddddddd")
                
                stickerHeight = newImageHeight*stickerImage.frame.size.height/mainImage.displayedImageBounds().size.height
                
                stickerWidth = stickerPicked.size.width/stickerPicked.size.height*stickerHeight
                
              
                
                
            }
        
            
            print ("new sticker width is \(stickerWidth) and new stiker height is \(stickerHeight)")
        
        
        UIGraphicsBeginImageContextWithOptions(newImageSize, false, 0.0)
            
        imagePicked.drawInRect(CGRect(x: 0.0, y: 0.0, width: newImageWidth, height: newImageHeight))
            
        stickerPicked.drawInRect(CGRect(x: newX, y: newY, width:stickerWidth, height:stickerHeight))
            
        result = UIGraphicsGetImageFromCurrentImageContext()
            
        UIGraphicsEndImageContext()
            
            imagePicked = UIImage()
            stickerPicked = UIImage()
            
        
        
        print ("new image height is \(result.size.height) and width is \(result.size.width)")
        
        
        UIImageWriteToSavedPhotosAlbum(result,self, "imageSaver:error:context:", nil)
        
        }// end of checking if image was picked
        
        
        else{
            
            UIGraphicsBeginImageContextWithOptions(stickerPicked.size, false, 0.0)
           stickerPicked.drawInRect(CGRect(x: 0.0, y: 0.0, width: stickerPicked.size.width, height: stickerPicked.size.height))
            result = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            UIImageWriteToSavedPhotosAlbum(result,self, "imageSaver:error:context:", nil)

            
            
        }// this is to save only the sticker
        
        
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
        
        
        
        //mainImage.contentMode = UIViewContentModeScaleAspectFit
        
        
        //mainImage.autoresizingMask
        
        
        
        
        //stickerImage.contentMode = UIViewContentModeScaleAspectFit
        
        
        
        
        
        
        
    }
    
    override func viewDidLayoutSubviews(){
        
    }
    
    
    
    override func viewWillAppear(animated:Bool) {
    
      UIGraphicsEndImageContext()
        
        
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

extension UIImageView {
    
    func displayedImageBounds() -> CGRect {
        
        let boundsWidth = bounds.size.width
        let boundsHeight = bounds.size.height
        let imageSize = image!.size
        let imageRatio = imageSize.width / imageSize.height
        let viewRatio = boundsWidth / boundsHeight
        if ( viewRatio > imageRatio ) {
            let scale = boundsHeight / imageSize.height
            let width = scale * imageSize.width
            let topLeftX = (boundsWidth - width) * 0.5
            return CGRectMake(topLeftX, 0, width, boundsHeight)
        }
        let scale = boundsWidth / imageSize.width
        let height = scale * imageSize.height
        let topLeftY = (boundsHeight - height) * 0.5
        return CGRectMake(0,topLeftY, boundsWidth,height)
    }
}