//
//  ImageSelectionViewController.swift
//  Final Project
//
//  Created by Kanika Goela on 20/5/2016.
//  Copyright © 2016 Kanika Goela. All rights reserved.
//

import UIKit

class ImageSelectionViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UICollectionViewDataSource, UICollectionViewDelegate{
    
    
    @IBOutlet weak var displayImage: UIImageView!
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    @IBOutlet weak var backButton: UIButton!
    
    
    
    var choice:String = ""
    
    var menuChoice:String = ""
    
    let imagePicker = UIImagePickerController()
    
    var count = 0
    
    let reuseidentifier = "subMenu"
    
    let yellowColor:[CGFloat] = [255,211,59]
    
    let greyColor:[CGFloat] = [86,84,102]
    
    let pinkColor:[CGFloat] = [249, 81, 114]
    
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    
   var imagePicked = UIImage()
    
    
    let menuArray:[String] = ["Milestones","Humour", "Monthly"]
    
    
    
    @IBAction func unwindToImageSelectionVC(segue:UIStoryboardSegue)
    {
        
        print("unwind to image selection VC")
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        if let image = info [UIImagePickerControllerOriginalImage] as? UIImage{
            
            self.imagePicked = image
            self.displayImage.image = self.imagePicked
            
        }
        
        dismissViewControllerAnimated(true, completion: nil)
        
        
    }//end of function
    
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
        //blank if cancel button is clicked
    }
    
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.menuArray.count
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseidentifier, forIndexPath: indexPath) as! SubMenuCollectionViewCell
        
        cell.subMenuLabel.text = self.menuArray[indexPath.item]
        
        let screenWidth = screenSize.width
        
        if (screenWidth<350){
            
            cell.layer.cornerRadius = 10.0
            
        }
        
        else{
            
            cell.layer.cornerRadius = 20.0
            
        }
        
        
       // cell.subMenuLabel.textColor = UIColor(red: pinkColor[0], green: pinkColor[1], blue: pinkColor[2], alpha: 1.0)
        
        //cell.backgroundColor = UIColor(red: yellowColor[0], green: yellowColor[1], blue: yellowColor[2], alpha: 1.0)
        
        
       // cell.layer.borderColor = UIColor(red: pinkColor[0], green: pinkColor[1], blue: pinkColor[2], alpha: 1.0).CGColor
        
        //cell.layer.borderWidth = 1.0
        
        
        return cell
        
    }
    
    
    func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        menuChoice = menuArray[indexPath.item]
        print("In did should function - picked \(menuChoice)")
        return true
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        
    }
    
    func collectionView(collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let screenWidth = screenSize.width
        
        if (screenWidth<350){
            
            return CGSize(width:100 , height: 30)
            
        }
            
        else{
            
            return CGSize(width: 100, height: 50)
            
        }
        
        
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        self.view.backgroundColor = UIColor(red: greyColor[0]/255, green: greyColor[1]/255, blue: greyColor[2]/255, alpha: 1.0)
        collectionView.backgroundColor = UIColor(red: greyColor[0]/255, green: greyColor[1]/255, blue: greyColor[2]/255, alpha: 1.0)
backButton.layer.cornerRadius = 7.5
        //backButton.layer.backgroundColor = UIColor(red: yellowColor[0]/255, green: yellowColor[1]/255, blue: yellowColor[2]/255, alpha: 1.0).CGColor
        
        
        backButton.setTitleColor(UIColor(red: pinkColor[0]/255,green:pinkColor[1]/255, blue:pinkColor[2]/255, alpha:1.0), forState: UIControlState.Normal)
  
        
        
    }
    
    
    
    override func viewWillAppear(animated: Bool) {
  
        
        if (count<=1) {
            
            if (choice == "camera"){
                
                imagePicker.sourceType = .Camera
                presentViewController(imagePicker, animated: true, completion: nil)
                
                
            }
                
            else{
                
                imagePicker.sourceType = .PhotoLibrary
                imagePicker.allowsEditing = false
                
                presentViewController(imagePicker, animated: true, completion: nil)
                
            }
            
        }//end of checking count of the number of times view has appeared
        
        count = count+1

        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        

        if let destination = segue.destinationViewController as? StickerPickViewController{
            
            print ("In prepare for segue to StickerPickViewController- \(self.menuChoice)")
            destination.menuChoice = self.menuChoice
            destination.imagePicked = self.imagePicked
            
            
        }
        
        
    }
    
    
}

