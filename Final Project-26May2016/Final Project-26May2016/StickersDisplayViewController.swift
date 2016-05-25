//
//  StickersDisplayViewController.swift
//  Final Project
//
//  Created by Kanika Goela on 20/5/2016.
//  Copyright © 2016 Kanika Goela. All rights reserved.
//

import UIKit

class StickersDisplayViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    @IBOutlet weak var backButton: UIButton!
    
    
    
    
    let reuseidentifier = "stickerDisplay"
    
    var imageArray:[UIImage] = []
    
    
    let greyColor:[CGFloat] = [86,84,102]
    
    let yellowColor:[CGFloat] = [255,211,59]
    
    var menuChoice:String = ""
    
    let imagePicker = UIImagePickerController()
    
    var imagePicked = UIImage()
    
    var stickerPicked = UIImage()
    var count:Int = 0
    
    
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imageArray.count
    }
    
    // make a cell for each cell index path
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
      
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseidentifier, forIndexPath: indexPath) as! StickerDisplayCell
        
        
        cell.imageDisplay.image = self.imageArray[indexPath.item]
        cell.backgroundColor = UIColor.clearColor()
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    
    func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
    
    stickerPicked = self.imageArray[indexPath.item]
        
        imagePicker.sourceType = .PhotoLibrary
        imagePicker.allowsEditing = false
        
        presentViewController(imagePicker, animated: true, completion: nil)
        count = count + 1

        print("assigning image picked")
        
        return true
        
        
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
     
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
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        if let image = info [UIImagePickerControllerOriginalImage] as? UIImage{
            
            self.imagePicked = image
            
        }
        
        dismissViewControllerAnimated(true, completion: nil)
        
        performSegueWithIdentifier("FromStickersToEditing", sender: self)
        
        
    }//end of function
    
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
        //blank if cancel button is clicked
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: greyColor[0]/255, green: greyColor[1]/255, blue: greyColor[2]/255, alpha: 1.0)
        
        collectionView.backgroundColor = UIColor(red: yellowColor[0]/255, green: yellowColor[1]/255, blue: yellowColor[2]/255, alpha: 1.0)
        
        
        backButton.layer.cornerRadius = 7.5
        
        print("Choice was \(menuChoice)")
        
        
        
        if (menuChoice == "Milestones"){
            print("In milestones")
            
            imageArray = [UIImage(named: "1.png")!, UIImage(named:"2.png")!, UIImage(named: "3.png")!, UIImage(named: "4.png")!, UIImage(named: "5.png")!, UIImage(named: "6.png")!, UIImage(named: "7.png")!, UIImage(named: "8.png")!]
        }
            
        else if (menuChoice == "Monthly"){
            print ("In monthly")
            
            imageArray = [UIImage(named: "1m.png")!, UIImage(named:"2m.png")!, UIImage(named: "3m.png")!, UIImage(named: "4m.png")!, UIImage(named: "5m.png")!, UIImage(named: "6m.png")!, UIImage(named: "7m.png")!, UIImage(named: "8m.png")!, UIImage(named: "9m.png")!, UIImage(named: "10m.png")!, UIImage(named: "11m.png")!, UIImage(named: "12m.png")!, UIImage(named: "ONE.png")! ]
            
        }
            
            
        else if (menuChoice == "Humour"){
            print("In humour")
            
            
            imageArray = [UIImage(named: "1h.png")!, UIImage(named:"2h.png")!, UIImage(named: "3h.png")!, UIImage(named: "4h.png")!, UIImage(named: "5h.png")!, UIImage(named: "6h.png")!, UIImage(named: "7h.png")!, UIImage(named: "8h.png")!, UIImage(named: "9h.png")!, UIImage(named: "10h.png")!, UIImage(named: "11h.png")!, UIImage(named: "12h.png")!, UIImage(named: "13h.png")!, UIImage(named: "14h.png")!, UIImage(named: "15h.png")!, UIImage(named: "16h.png")!]
            
        }
            
            
        else{
            
            print ("in default")
            
        }
        
    
        
        

        
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        print("In prep for segue")
        
        
        
    
    if let destination = segue.destinationViewController as? ImageEditingViewController {
        
        
        print("sticker and image info passed")
        
        destination.stickerPicked = self.stickerPicked
        destination.imagePicked = self.imagePicked
        
        
    }
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
