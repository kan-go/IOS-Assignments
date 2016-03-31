
import UIKit

class ThirdViewController: UIViewController {
    
    
    @IBOutlet weak var numberInput: UITextField!
    
    
    @IBOutlet weak var displayLabel: UILabel!
    
    
    
    @IBAction func buttonClicked(sender: AnyObject) {
        
        let numberString:String = numberInput.text!
        
        if let number = Int(numberString){
            
            if (number%2==0){
                
                displayLabel.textColor = UIColor.blackColor()
                displayLabel.text = "even"
            }
            
            else{
                
                displayLabel.textColor = UIColor.blackColor()
                displayLabel.text = "is not even"
            }
            
            
        }
        
        
    }
  
    
  /*
  TODO six: Hook up the number input text field, button and text label to this class. When the button is pressed, a message should be shown on the label indicating whether the number is even.
  
  */
}
