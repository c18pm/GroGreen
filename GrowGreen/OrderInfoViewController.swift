//
//  OrderInfoViewController.swift
//  GrowGreen
//
//  Created by MITTAL on 4/2/16.
//  Copyright © 2016 Priya MIttal. All rights reserved.
//

import UIKit
import Firebase

class OrderInfoViewController: ViewController {
    
    let ref = Firebase(url: "https://grogreen.firebaseio.com/orders")
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var produce: UILabel!
    
    @IBOutlet weak var quantity: UILabel!
    
    @IBOutlet weak var profit: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let orderItem = NSUserDefaults .standardUserDefaults() .objectForKey("orderChosen")!
        
        let nameText = orderItem["restaurantName"] as! String
        let produceText = orderItem["produce"] as! String
        let quantityVal = orderItem["quantity"] as! Double
        let quantityText = orderItem["quantity"] as! Int
        let price = orderItem["price"] as! Double
        
        let profitVal = 0.94*(quantityVal*price)
        
        let profitText = Double(round(100*profitVal)/100)
        
        name.text = "Restaurant name: \(nameText)"
        produce.text = "Item: \(produceText)"
        quantity.text = "Quantity: \(quantityText)"
        profit.text = "Profit: $\(profitText)"

        
    }
    
    @IBAction func archiveOrder(sender: AnyObject) {
        
        //let orderItem = NSUserDefaults .standardUserDefaults() .objectForKey("orderChosen")!
        
        let orderItemKey = NSUserDefaults .standardUserDefaults() .objectForKey("orderChosenKey")!
        
        let ref = Firebase(url: "https://grogreen.firebaseio.com/orders/" + ((orderItemKey) as! String) + "/isDone")
        
        ref.setValue(true)
        
        self.performSegueWithIdentifier("archive", sender: nil)
        
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
