//
//  restaurantLogInViewController.swift
//  GrowGreen
//
//  Created by MITTAL on 3/3/16.
//  Copyright © 2016 Mitchell Sweet. All rights reserved.
//

import UIKit
import Firebase

class restaurantLogInViewController: ViewController {

//    //
    
    
    //FROM PREVIOUS VIEW CONTROLLER 
    //NSUserDefaults .standardUserDefaults() .setObject(farmItem.value, forKey: "farmChosen")
//    
//    let farmItem = NSUserDefaults .standardUserDefaults() .objectForKey("farmChosen")!
//    
//    let farmString =
//    farmItem["name"] as! String
//    print(farmString)
//    
//    //
    
    

    
    
    var rests = [FDataSnapshot]()
    var restUser = FDataSnapshot()
    
    
    let ref = Firebase(url: "https://grogreen.firebaseio.com/restaurants")
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func signInButton(sender: AnyObject) {
        
        self.ref.authUser(usernameField.text!, password: passwordField.text!) { (error, auth) -> Void in
            if(error == nil)
            {
                print("Login Successful")
                
                
                //SAVES RESTAURANT USER
                for var i=0; i<self.rests.count; i++
                {
                    var restEmail = self.rests[i].value["email"] as! String
                    
                    if (restEmail == self.usernameField.text!)
                    {
                        self.restUser = self.rests[i]
                        
                        print(self.restUser.value["name"] as! String)
                        NSUserDefaults .standardUserDefaults() .setObject(self.restUser.value, forKey: "restUser")
                        
                    }
                }
                    
                self.performSegueWithIdentifier("loginToRestaurantHome", sender: nil)
                
            }
            else
            {
                print("Login Fail")
        
            }
        }
        
    }
    
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
        
        let itemRef = Firebase(url: "https://grogreen.firebaseio.com/restaurants")
        
        ref.observeEventType(.Value, withBlock: { snapshot in
            
            var newRests = [FDataSnapshot]()
            
            var restItem = [FDataSnapshot]()
            
            
            for item in snapshot.children {
                newRests.append(item as! FDataSnapshot)
            }
            
            self.rests = newRests
        
            
        })
    }

    
}


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


