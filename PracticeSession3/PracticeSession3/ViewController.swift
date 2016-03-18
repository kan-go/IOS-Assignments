//
//  ViewController.swift
//  PracticeSession3
//
//  Created by Kanika Goela on 18/3/2016.
//  Copyright © 2016 Kanika Goela. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var inputName: UITextField!
    
    
    @IBOutlet weak var displayGreeting: UILabel!
    
    
    
    @IBAction func buttonClicked(sender: AnyObject) {
        
        var name:String = inputName.text!
        
        print(name)
        
        var Greeting:String = "Hello " + name + "!"
        
        print(Greeting)
        
        displayGreeting.text = Greeting
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

