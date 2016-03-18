//
//  PasswordViewController.swift
//  PracticeSession3
//
//  Created by Kanika Goela on 18/3/2016.
//  Copyright © 2016 Kanika Goela. All rights reserved.
//

import UIKit

class PasswordViewController: UIViewController {
    
    
    @IBOutlet weak var inputPassword: UITextField!
    
    @IBOutlet weak var displayMessage: UILabel!
    
    
    @IBAction func pwdButtonClicked(sender: AnyObject) {
        
        var passwordEntered:String = inputPassword.text!
        
        if(passwordEntered=="playgame"){
            
            performSegueWithIdentifier("GameSegue", sender: self)
            print ("This should take to the next page")
            
        }
        
        else{
            let errorMessage:String = "Sorry, wrong password! Try Again."
            displayMessage.text = errorMessage
            print (errorMessage)
            
        }
        
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
