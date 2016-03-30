
import UIKit

class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var numberInput: UITextField!
    
    
    @IBOutlet weak var displayLabel: UILabel!
    
    
    var sum:Int = 0

    
    @IBAction func addButtonClicked(sender: AnyObject) {
        
        let numstring:String = numberInput.text!
        
        if let numInt = Int(numstring){
            
            sum = sum + numInt
            
            displayLabel.text = String(sum)
            
        }
        
        
    }
    
    
  
  //TODO five: Display the cumulative sum of all numbers added every time the ‘add’ button is pressed. Hook up the label, text box and button to make this work.
}
