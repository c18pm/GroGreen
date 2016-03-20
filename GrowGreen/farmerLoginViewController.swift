//
//  farmerLoginViewController.swift
//  GrowGreen
//
//  Created by Rachel Sterneck on 2/27/16.
//  Copyright © 2016 Mitchell Sweet. All rights reserved.
//

import UIKit
import Firebase

class farmerLoginViewController: UIViewController {

    let ref = Firebase(url: "https://grogreen.firebaseio.com")
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func farmSignIn(sender: AnyObject) {
   
    self.ref.authUser(usernameField.text!, password: passwordField.text!) { (error, auth) -> Void in
            if(error == nil)
            {
                print("Login Successful")
                
                self.performSegueWithIdentifier("farmerLogin", sender: nil)
                
            }
            else
            {
                print("Login Fail")
                
    }
        }}
    
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
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}