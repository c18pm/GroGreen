//
//  signUpViewController.swift
//  GroGreen
//
//  Created by MITTAL on 4/7/16.
//  Copyright © 2016 Priya MIttal. All rights reserved.
//

import UIKit

class signUpViewController: ViewController {


    

    @IBAction func submitForm(sender: AnyObject) {
        
        let alertController = UIAlertController(title: "GroGreen", message: "Sign up request sent!", preferredStyle: UIAlertControllerStyle.Alert)
        
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler:        { action in self.performSegueWithIdentifier("signUp", sender: nil)}
))
        
        self.presentViewController(alertController, animated: true, completion: nil)

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
