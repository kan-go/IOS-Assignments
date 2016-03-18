//
//  ViewController.swift
//  TestProject2
//
//  Created by Kanika Goela on 12/3/2016.
//  Copyright © 2016 Kanika Goela. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBAction func buttonAction(sender: AnyObject) {
        
        var servings:Int = 2
        
        // Better to put Int or String when assigning values to variables. Xcode lets you do it without Int or String. It guesses based on the first value you assign
        
        print(servings)
        print(servings*5)
        
        var name:String = "Kanika"
        
        print(name)
        
        var greeting:String = "Hello " + name
        
        print(greeting)
        
        var greeting2:String = "hello"
        
        print(greeting2+" "+name)
        
        
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

