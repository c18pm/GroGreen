//
//  farmerHomeViewController.swift
//  GrowGreen
//
//  Created by Rachel Sterneck on 2/27/16.
//  Copyright © 2016 Mitchell Sweet. All rights reserved.
//

import UIKit

class farmerHomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let farmUser = NSUserDefaults . standardUserDefaults() .objectForKey("farmUser")!
        
        let farmName = farmUser["name"] as! String
        
        print(farmName)
        
        // App crashes without if-statement
        if let label = welcomeLabel{
            label.text = "Welcome \(farmName)"
        }
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
