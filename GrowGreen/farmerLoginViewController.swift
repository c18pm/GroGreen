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

    var farms = [FDataSnapshot]()
    var farmUser = FDataSnapshot()

    
    let ref = Firebase(url: "https://grogreen.firebaseio.com/farmers")
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func farmSignIn(sender: AnyObject) {
   
    self.ref.authUser(usernameField.text!, password: passwordField.text!) { (error, auth) -> Void in
            if(error == nil)
            {
                print("Login Successful")
                
                
                //SAVES FARMER USER
                for var i=0; i<self.farms.count; i++
                {
                    let farmEmail = self.farms[i].value["email"] as! String
                    
                    if (farmEmail == self.usernameField.text!)
                    {
                        self.farmUser = self.farms[i]
                        
                        print(self.farmUser.value["name"] as! String)
                        NSUserDefaults .standardUserDefaults() .setObject(self.farmUser.value, forKey: "farmUser")
                        
                    }
                }
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
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        ref.observeEventType(.Value, withBlock: { snapshot in
            
            var newFarms = [FDataSnapshot]()
            
            
            for item in snapshot.children {
                newFarms.append(item as! FDataSnapshot)
            }
            
            self.farms = newFarms
            
            
        })
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