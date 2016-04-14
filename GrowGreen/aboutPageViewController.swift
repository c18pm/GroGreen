//
//  aboutPageViewController.swift
//  GroGreen
//
//  Created by MITTAL on 4/4/16.
//  Copyright © 2016 Priya MIttal. All rights reserved.
//

import UIKit

class aboutPageViewController: ViewController {
    
    @IBAction func priyaButton(sender: AnyObject) {
        let alertController = UIAlertController(title: "Hi! My name is Priya Mittal", message: "I am 16 years old, live in NYC and go to The Dalton School!", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler:nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    
    @IBAction func rachelButton(sender: AnyObject) {
            let alertController = UIAlertController(title: "Hi! My name is Rachel Sterneck", message: "I am 17 years old, live on Long Island and go Roslyn High School!", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler:nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    
    @IBAction func alexButton(sender: AnyObject) {
        
        let alertController = UIAlertController(title: "Hi! My name is Alexandra Qin!", message: "I am a software engineer at Skillshare! I love to write and teach code!", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler:nil))
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
