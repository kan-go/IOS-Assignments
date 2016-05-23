//
//  StickerPickViewController.swift
//  Final Project
//
//  Created by Kanika Goela on 21/5/2016.
//  Copyright © 2016 Kanika Goela. All rights reserved.
//

import UIKit

class StickerPickViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    @IBOutlet weak var collectionView: UICollectionView!

    
    let reuseidentifier = "stickerPick"
    
    var imageArray:[UIImage] = []
    
    
    let yellowColor:[CGFloat] = [253,236,76]
    
    let greyColor:[CGFloat] = [86,84,102]
    
    var menuChoice:String = "Monthly"
    
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    
    var imagePicked = UIImage()
    
    var stickerPicked = UIImage()
    
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imageArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
  
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseidentifier, forIndexPath: indexPath) as! StickerPickCell
        
        cell.stickerPickDisplay.image = self.imageArray[indexPath.item]
        cell.backgroundColor = UIColor.clearColor()
        
        return cell
    }
    

    
    
    
    
    func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool{
        stickerPicked = self.imageArray[indexPath.item]
        print ("Sticker assigned")
        return true
        
    }
    
    
    
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
       
        print("You selected cell #\(indexPath.item)!")
    
        
    }
    
    func collectionView(collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let screenWidth = screenSize.width
        
        if (screenWidth<350){
            
            return CGSize(width: 125, height: 125)
            
        }
            
        else{
            
            return CGSize(width: 150, height: 150)
            
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
  
        self.view.backgroundColor = UIColor(red: greyColor[0]/255, green: greyColor[1]/255, blue: greyColor[2]/255, alpha: 1.0)

        
        collectionView.backgroundColor = UIColor(red: yellowColor[0]/255, green: yellowColor[1]/255, blue: yellowColor[2]/255, alpha: 1.0)
        
        print("From StickerPickViewController Choice was \(menuChoice)")
        
    }
    
    
    override func viewWillAppear(animated:Bool) {
   
        if (menuChoice == "Milestones"){
            print("In milestones")
            
            imageArray = [UIImage(named: "1.png")!, UIImage(named:"2.png")!, UIImage(named: "3.png")!, UIImage(named: "4.png")!, UIImage(named: "5.png")!, UIImage(named: "6.png")!, UIImage(named: "7.png")!, UIImage(named: "8.png")!]
        }
            
        else if (menuChoice == "Monthly"){
            print ("In monthly")
            
            imageArray = [UIImage(named: "1m.png")!, UIImage(named:"2m.png")!, UIImage(named: "3m.png")!, UIImage(named: "4m.png")!, UIImage(named: "5m.png")!, UIImage(named: "6m.png")!, UIImage(named: "7m.png")!, UIImage(named: "8m.png")!, UIImage(named: "9m.png")!, UIImage(named: "10m.png")!, UIImage(named: "11m.png")!, UIImage(named: "12m.png")!, UIImage(named: "ONE.png")! ]
            
        }
            
        else{
            
            print ("in default")
            
        }

        
    }
    
    
    override func viewWillLayoutSubviews() {
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let destination = segue.destinationViewController as? ImageEditingViewController{
            
            destination.imagePicked = self.imagePicked
            destination.stickerPicked = self.stickerPicked
            
        }
        
        
    }
    
    
}
