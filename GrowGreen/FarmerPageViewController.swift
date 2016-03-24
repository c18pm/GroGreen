//
//  FarmerPageViewController.swift
//  GrowGreen
//
//  Created by Rachel Sterneck & Priya Mittal on 2/25/16.
//  Copyright © 2016 Rachel Sterneck & Priya Mittal. All rights reserved.
//

import UIKit
import Firebase

class FarmerPageViewController: UIViewController {
    
    var produceType = String()
    
    var quantity = Int()
    
    let ref = Firebase(url: "https://grogreen.firebaseio.com")

    @IBOutlet weak var numLabel: UILabel!
    
    @IBOutlet weak var quantityStepper: UIStepper!
    
    @IBOutlet weak var namelabel:UILabel!
    
    var farmstring = String()
    
    @IBAction func quantityChangeStepper(sender: UIStepper) {
        
        quantity = Int(sender.value)
        
        numLabel.text = quantity.description
    }
    
    @IBOutlet weak var farmEmail: UILabel!
    
    
    @IBAction func submitOrder(sender: AnyObject) {
        
        let alertController = UIAlertController(title: "GroGreen", message: "Order complete!", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler:nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)

        let farmItem = NSUserDefaults .standardUserDefaults() .objectForKey("farmChosen")!
        
        let producePrice = farmItem["price"] as! Double
        
        let restaurantUid = "abc"
        
        let farmUid = farmItem["uid"] as! String
        
        let farmString =
        farmItem["name"] as! String
        print(farmString)
    
        let orderRef = ref.childByAppendingPath("orders")
    
        let order = ["produce": produceType, "quantity": quantity, "price": producePrice, "restaurantUid": restaurantUid, "farmUid": farmUid]
        
        let order1Ref = orderRef.childByAutoId()
        
        order1Ref.setValue(order)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quantityStepper.value = 0
        
        // Do any additional setup after loading the view.
        
        quantityStepper.wraps = true
        quantityStepper.autorepeat = true
        quantityStepper.maximumValue = 10
        
       
        let farmItem = NSUserDefaults .standardUserDefaults() .objectForKey("farmChosen")!
        
        let farmString =
        farmItem["name"] as! String
        print(farmString)
        

        
        //NSUserDefaults to get produce name
        //var produceType defined at top of  class
        
        produceType = NSUserDefaults .standardUserDefaults() .stringForKey("produceType")!
        
        
        namelabel.text = farmString
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
