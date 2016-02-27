//
//  FarmerPageViewController.swift
//  GrowGreen
//
//  Created by Rachel Sterneck & Priya Mittal on 2/25/16.
//  Copyright © 2016 Rachel Sterneck & Priya Mittal. All rights reserved.
//

import UIKit

class FarmerPageViewController: UIViewController {

    @IBOutlet weak var numLabel: UILabel!
    
    @IBOutlet weak var quantityStepper: UIStepper!
    
    @IBOutlet weak var namelabel:UILabel!
    
    var farmstring = String()
    
    @IBAction func quantityChangeStepper(sender: UIStepper) {
        
        numLabel.text = Int(sender.value).description
    }
    
    @IBAction func submitOrder(sender: AnyObject) {
        
        let alertController = UIAlertController(title: "GroGreen", message: "Order complete!", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler:nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quantityStepper.value = 0
        
        // Do any additional setup after loading the view.
        
        quantityStepper.wraps = true
        quantityStepper.autorepeat = true
        quantityStepper.maximumValue = 10
        
        farmstring = NSUserDefaults .standardUserDefaults() .stringForKey("farmChosen")!
        print(farmstring)
        
        namelabel.text = farmstring
        
        
        
        
        
//        NSUserDefaults .standardUserDefaults() .setObject(namelabel.text, forKey: "someonesname")
//        
//        namelabel.text = NSUserDefaults .standardUserDefaults() .stringForKey("someonesname")
        

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
