//
//  ViewController.swift
//  GrowGreen
//
//  Created by Rachel Sterneck & Priya Mittal on 2/24/16.
//  Copyright © 2016 Rachel Sterneck & Priya Mittal. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    
    let segueRef = Firebase(url: "https://grogreen.firebaseio.com")
  

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func restaurantLogout(sender: AnyObject) {
        
        segueRef.unauth();
        print("Logout successful")
        self.performSegueWithIdentifier("restaurantLogout", sender: nil)
    }
    

    

}
