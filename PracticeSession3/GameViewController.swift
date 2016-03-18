//
//  GameViewController.swift
//  PracticeSession3
//
//  Created by Kanika Goela on 18/3/2016.
//  Copyright © 2016 Kanika Goela. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    
    
    @IBOutlet weak var numberGuessed: UITextField!
    
    @IBOutlet weak var gameDisplayMessage: UILabel!
    
    
    @IBAction func gameButtonClicked(sender: AnyObject) {
        
        let secretNumber:Int = 100
        
        let numGuessedString:String = numberGuessed.text!
        
        let numGuessedInt:Int = Int(numGuessedString)!
        
        var message:String = "Correct!"
        
       // if(numGuessed == nil){
            
            //message = "You are trying to crash me!"
           // print(message)
        //}
        
        print(numGuessedInt)
        
        if (numGuessedInt == secretNumber){
            
            print (message)
            
        }
        
        else if(numGuessedInt > secretNumber){
            
            message = "Larger"
            print (message)
        }
        
        else {
            message = "Smaller"
           print (message)
        }
        
        gameDisplayMessage.text = message
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
