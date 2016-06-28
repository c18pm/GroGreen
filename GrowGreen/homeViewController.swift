//
//  homeViewController.swift
//  GroGreen
//
//  Created by Rachel Sterneck on 6/26/16.
//  Copyright © 2016 Priya MIttal. All rights reserved.
//

import UIKit
import Firebase

class homeViewController: UIViewController {

    let usersRef = Firebase(url: "https://grogreen.firebaseio.com/users")
    let farmersRef = Firebase(url: "https://grogreen.firebaseio.com/farmers")
    let restsRef = Firebase(url: "https://grogreen.firebaseio.com/restaurants")
    let ref = Firebase(url: "https://grogreen.firebaseio.com/")
    
    var farms = [FDataSnapshot]()
    var farmUser = FDataSnapshot()
    var rests = [FDataSnapshot]()
    var restUser = FDataSnapshot()
    var users = [FDataSnapshot]()
    var user = FDataSnapshot()
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func signIn(sender: AnyObject){
        
        
        self.ref.authUser(usernameField.text!, password: passwordField.text!) { (error, auth) -> Void in
            if(error == nil)
            {

                

       
               for i in 0 ..< self.users.count
               {
                    if (self.usernameField.text! == self.users[i].value["email"] as! String)
                 {
                        self.user = self.users[i]

                 }

                else{}

    }
              

                
                
                    //IF FARM2
                    if (self.user.value["type"] as! String == "farm")
                    {
                            for i in 0 ..< self.farms.count
                            {
                                let farmEmail = self.farms[i].value["email"] as! String
                                
                                if (farmEmail == self.usernameField.text!)
                                {
                                    self.farmUser = self.farms[i]
                                    
                                    NSUserDefaults .standardUserDefaults() .setObject(self.farmUser.value, forKey: "farmUser")
                                    
                                }
                            }
                            self.performSegueWithIdentifier("farmerLogin", sender: nil)
                            
                        }
                        //IF REST2
                        else{
                            
                            for i in 0 ..< self.rests.count
                            {
                                let restEmail = self.rests[i].value["email"] as! String
                                
                                if (restEmail == self.usernameField.text!)
                                {
                                    self.restUser = self.rests[i]
                                    
                                    NSUserDefaults .standardUserDefaults() .setObject(self.restUser.value, forKey: "restUser")
                                    
                                }
                                
                                else{}
                            }
                            
                            self.performSegueWithIdentifier("restaurantLogin", sender: nil)
                        }
                
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
        
        usersRef.observeEventType(.Value, withBlock: { snapshot in
            
            var newUsers = [FDataSnapshot]()
            
            for item in snapshot.children {
                newUsers.append(item as! FDataSnapshot)
            }
            
            self.users = newUsers
        })
        
        farmersRef.observeEventType(.Value, withBlock: { snapshot in
            
            var newFarms = [FDataSnapshot]()
            
            for item in snapshot.children {
                newFarms.append(item as! FDataSnapshot)
            }
            
            self.farms = newFarms
        })
    
        restsRef.observeEventType(.Value, withBlock: { snapshot in
            
            var newRests = [FDataSnapshot]()
            
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

    

