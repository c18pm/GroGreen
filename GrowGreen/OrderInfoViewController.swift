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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let orderItem = NSUserDefaults .standardUserDefaults() .objectForKey("orderChosen")!
        
        
    }
    
    @IBAction func archiveOrder(sender: AnyObject) {
        
        let orderItem = NSUserDefaults .standardUserDefaults() .objectForKey("orderChosen")!
        
        let orderItemKey = NSUserDefaults .standardUserDefaults() .objectForKey("orderChosenKey")!
        
        let ref = Firebase(url: "https://grogreen.firebaseio.com/orders/" + ((orderItemKey) as! String) + "/isDone")
        
        ref.setValue(true)
        
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
