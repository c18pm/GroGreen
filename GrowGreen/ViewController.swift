//
//  ViewController.swift
//  GrowGreen
//
//  Created by Rachel Sterneck & Priya Mittal on 2/24/16.
//  Copyright © 2016 Rachel Sterneck & Priya Mittal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func signin(sender:AnyObject) {
        var alertController:UIAlertController?
        alertController = UIAlertController(title: "Sign in",
            message: "Enter your account information below.",
            preferredStyle: .Alert)
        
        alertController!.addTextFieldWithConfigurationHandler(
            {(textField: UITextField!) in
                textField.placeholder = "Username"
                textField.keyboardType = UIKeyboardType.Default
        })
        
        alertController!.addTextFieldWithConfigurationHandler(
            {(textField2: UITextField!) in
                textField2.placeholder = "Password"
                textField2.keyboardType = UIKeyboardType.Default
                textField2.secureTextEntry = true
        })
        
        
        
        let action = UIAlertAction(title: "Login",
            style: UIAlertActionStyle.Default,
            //Ignore this warning for now. This warning will disappear when something is done with the entered text.
            handler: {[weak self]
                (paramAction:UIAlertAction!) in
                if let textFields = alertController?.textFields{
                    let theTextFields = textFields as [UITextField]
                    let usernametext = theTextFields[0].text
                    let passwordtext = theTextFields[1].text
                    
                    // Here is where to do something with the data in the text fields. The two lines below simply print the values. 
                    
                    print("Username entered: \(usernametext!)")
                    print("Password entered: \(passwordtext!)")
                    
                }
            })
        
        alertController?.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
        
        alertController?.addAction(action)
        self.presentViewController(alertController!,
            animated: true,
            completion: nil)
        
    }
    
    @IBAction func signup(sender:AnyObject) {
        var alertController:UIAlertController?
        alertController = UIAlertController(title: "Sign up",
            message: "Welcome! To sign up for GroGreen, please fill out all of the fields below.",
            preferredStyle: .Alert)
        
        alertController!.addTextFieldWithConfigurationHandler(
            {(textField: UITextField!) in
                textField.placeholder = "Name"
                textField.keyboardType = UIKeyboardType.Default
        })
        
        alertController!.addTextFieldWithConfigurationHandler(
            {(textField2: UITextField!) in
                textField2.placeholder = "Company Name"
                textField2.keyboardType = UIKeyboardType.Default
        })
        alertController!.addTextFieldWithConfigurationHandler(
            {(textField2: UITextField!) in
                textField2.placeholder = "E-Mail address"
                textField2.keyboardType = UIKeyboardType.Default
        })
        alertController!.addTextFieldWithConfigurationHandler(
            {(textField2: UITextField!) in
                textField2.placeholder = "Address"
                textField2.keyboardType = UIKeyboardType.Default
        })
        alertController!.addTextFieldWithConfigurationHandler(
            {(textField2: UITextField!) in
                textField2.placeholder = "City/State/Zip"
                textField2.keyboardType = UIKeyboardType.Default
        })
        alertController!.addTextFieldWithConfigurationHandler(
            {(textField2: UITextField!) in
                textField2.placeholder = "Username"
                textField2.keyboardType = UIKeyboardType.Default
        })
        alertController!.addTextFieldWithConfigurationHandler(
            {(textField2: UITextField!) in
                textField2.placeholder = "Password (8 characters or more)"
                textField2.keyboardType = UIKeyboardType.Default
                textField2.secureTextEntry = true
        })
        
        
        
        
        let action = UIAlertAction(title: "Sign up",
            style: UIAlertActionStyle.Default,
            //Ignore this warning for now. This warning will disappear when something is done with the entered text.
            handler: {[weak self]
                (paramAction:UIAlertAction!) in
                if let textFields = alertController?.textFields{
                    let theTextFields = textFields as [UITextField]
                    let nametext = theTextFields[0].text
                    let companynametext = theTextFields[1].text
                    let emailaddresstext = theTextFields[2].text
                    let addresstext = theTextFields[3].text
                    let addressconttext = theTextFields[4].text
                    let usernametext = theTextFields[5].text
                    let passwordtext = theTextFields[6].text
                    
                    
                    // Here is where to do something with the data in the text fields. The two lines below simply print the values.
                    
                    print("Name entered: \(nametext!)")
                    print("Company name entered:\(companynametext!)")
                    print("Email entered: \(emailaddresstext!)")
                    print("Address entered: \(addresstext!)")
                    print("Info entered: \(addressconttext!)")
                    print("Username entered: \(usernametext!)")
                    print("Password entered: \(passwordtext!)")
                    
                }
            })
        
        alertController?.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
        
        alertController?.addAction(action)
        self.presentViewController(alertController!,
            animated: true,
            completion: nil)

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

