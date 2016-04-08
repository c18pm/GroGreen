//
//  signUpViewController.swift
//  GroGreen
//
//  Created by MITTAL on 4/7/16.
//  Copyright © 2016 Priya MIttal. All rights reserved.
//

import UIKit

class signUpViewController: ViewController {

    
    @IBAction func signUpSubmit(sender: AnyObject) {
        
        let alertController = UIAlertController(title: "Sign Up", message: "Request Complete!", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler:nil))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
