//
//  PaymentViewController.swift
//  GroGreen
//
//  Created by Rachel Sterneck on 6/20/16.
//  Copyright © 2016 Priya MIttal. All rights reserved.
//

import UIKit
import Stripe
import Firebase

class PaymentViewController: UIViewController, STPPaymentCardTextFieldDelegate {
    
    let ref = Firebase(url: "https://grogreen.firebaseio.com")
    
    var quantity = Int()
    var produceType = String()
    
    let paymentTextField = STPPaymentCardTextField()

    @IBOutlet weak var saveButton: UIButton!
    @IBAction func submitOrder(sender: AnyObject) {
        let alertController = UIAlertController(title: "GroGreen", message: "Order complete!", preferredStyle: UIAlertControllerStyle.Alert)
        
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler:        { action in self.performSegueWithIdentifier("submitOrder", sender: nil)}
            ))
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
        let farmItem = NSUserDefaults .standardUserDefaults() .objectForKey("farmChosen")!
        
        
        let restUser = NSUserDefaults . standardUserDefaults() .objectForKey("restUser")!
        
        let producePrice = farmItem["price"] as! Double
        
        let restaurantUid = restUser["uid"] as! String
        
        let restaurantName = restUser["name"] as! String
        
        let farmUid = farmItem["uid"] as! String
        
        let farmString =
            farmItem["name"] as! String
        print(farmString)
        
        let orderRef = ref.childByAppendingPath("orders")
        
        let order = ["produce": produceType, "quantity": quantity, "price": producePrice, "restaurantUid": restaurantUid, "farmUid": farmUid, "restaurantName":restaurantName, "isDone": false]
        
        let order1Ref = orderRef.childByAutoId()
        
        order1Ref.setValue(order)

    }
    
    
    
    
    func paymentCardTextFieldDidChange(textField: STPPaymentCardTextField) {
        // Toggle navigation, for example
        saveButton.enabled = textField.valid
    
        
    }

    override func viewDidLoad() {
        super.viewDidLoad();
        paymentTextField.frame = CGRectMake(15, 15, CGRectGetWidth(self.view.frame) - 30, 44)
        paymentTextField.delegate = self
        view.addSubview(paymentTextField)
        
        quantity = NSUserDefaults .standardUserDefaults() .integerForKey("stepperQuantity")
    
        produceType = NSUserDefaults .standardUserDefaults() .stringForKey("produceType")!
        
        
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
