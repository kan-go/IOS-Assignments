//
//  StickersCollectionViewController.swift
//  Final Project
//
//  Created by Kanika Goela on 19/5/2016.
//  Copyright © 2016 Kanika Goela. All rights reserved.
//

import UIKit

class StickersCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

        
    @IBOutlet weak var bgView: UIView!
    
        let reuseidentifier = "stickerDisplay"
        
        var imagearray:[UIImage] = []
    
    
    let bgColor:[CGFloat] = [253,236,76]
        
        var choice:Int = 1
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
    
    
        
        
        // tell the collection view how many cells to make
        func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return self.imagearray.count
        }
        
        // make a cell for each cell index path
        func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
            
            // get a reference to our storyboard cell
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseidentifier, forIndexPath: indexPath) as! StickerDisplayCell
            
            // Use the outlet in our custom class to get a reference to the UILabel in the cell
            cell.stickerImage.image = self.imagearray[indexPath.item]
            cell.backgroundColor = UIColor.clearColor()
            
            return cell
        }
        
        // MARK: - UICollectionViewDelegate protocol
        
        func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
            // handle tap events
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
            
            bgView.backgroundColor = UIColor(red: bgColor[0], green: bgColor[1], blue: bgColor[2], alpha: 1)
            
            
            if (choice == 1){
                
                imagearray = [UIImage(named: "1.png")!, UIImage(named:"2.png")!, UIImage(named: "3.png")!, UIImage(named: "4.png")!, UIImage(named: "5.png")!, UIImage(named: "6.png")!, UIImage(named: "7.png")!, UIImage(named: "8.png")!]
            }
                
            else if (choice == 2) {
                
                imagearray = [UIImage(named: "1m.png")!, UIImage(named:"2m.png")!, UIImage(named: "3m.png")!, UIImage(named: "4m.png")!, UIImage(named: "5m.png")!, UIImage(named: "6m.png")!, UIImage(named: "7m.png")!, UIImage(named: "8m.png")!, UIImage(named: "9m.png")!, UIImage(named: "10m.png")!, UIImage(named: "11m.png")!, UIImage(named: "12m.png")!, UIImage(named: "ONE.png")! ]
                
            }
                
                
            else{
                
                imagearray = [UIImage(named: "1.png")!, UIImage(named:"2.png")!, UIImage(named: "3.png")!, UIImage(named: "4.png")!, UIImage(named: "5.png")!, UIImage(named: "6.png")!, UIImage(named: "7.png")!, UIImage(named: "8.png")!]
            }
            
            
            
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        
}
