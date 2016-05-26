//
//  ColorClass.swift
//  Final Project
//
//  Created by Kanika Goela on 16/5/2016.
//  Copyright © 2016 Kanika Goela. All rights reserved.
//

import Foundation
import UIKit

class ColorClass{
    
    var red:Int = 0
    var green:Int = 0
    var blue:Int = 0
    var alpha:CGFloat = 0
    
    func convert() -> UIColor {
        
        var redConverted = CGFloat(red/255)
        var greenConverted = CGFloat(green/255)
        var blueConverted = CGFloat (blue/255)
        
        return UIColor(red: redConverted, green: greenConverted, blue: blueConverted, alpha: alpha)
        
    }
    

    
    
    
}
