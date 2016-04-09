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
    
    
    let segueRef = Firebase(url: "https://grogreen.firebaseio.com/restaurants")
  
    
   
    @IBOutlet weak var welcomeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
         let restUser = NSUserDefaults . standardUserDefaults() .objectForKey("restUser")!
        
        let restName = restUser["name"] as! String
        
        print(restName)
        
        // App crashes without if-statement
        if let label = welcomeLabel{
            label.text = "Welcome \(restName)"
        }
        
        
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
