//
//  FarmersViewController.swift
//  GrowGreen
//
//  Created by Rachel Sterneck & Priya Mittal on 2/24/16.
//  Copyright © 2016 Rachel Sterneck & Priya Mittal. All rights reserved.
//

import UIKit

class FarmersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //These are all different arrays which show which farms supply which types of produce. There is also a main array and once the view is loaded, that array will be set to the array that has the farms of the selected produce.
    @IBOutlet var tableView: UITableView!
    let dairyFarm = ["farm 1", "farm 2"]
    let vegetableFarm = ["farm 3", "farm 4"]
    let fruitFarm = ["farm 5", "farm 6"]
    let jamFarm = ["farm 7", "farm 8"]
    let poultryFarm = ["farm 9", "farm 10"]
    var mainFarm = [String]()
    var produceType = String()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Recieves the type of produce selected on the previous table view from NSUserDefaults.
        produceType = NSUserDefaults .standardUserDefaults() .stringForKey("produceType")!
        
        //Sends data to FarmerPageViewController
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        //let key = "myTableViewWithRowOf\(indexPath.row)"
        //defaults.setFloat(selectedCell.contentView.alpha, forKey: key)
        
        
        //Activates the segue to transition to the next view.
//        self.performSegueWithIdentifier("toFarmResults", sender: self)
        
        
        
        
        //This if statement sets the main array to the correct array for the produce choosen.
        if produceType == "Dairy" {
            mainFarm = dairyFarm
        }
        else if produceType == "Vegetable" {
            mainFarm = vegetableFarm
        }
        else if produceType == "Fruit" {
            mainFarm = fruitFarm
        }
        else if produceType == "Jam" {
            mainFarm = jamFarm
        }
        else if produceType == "Poultry" {
            mainFarm = poultryFarm
        }
        
        
        //The rest of the code is the same as the table view in the previous class. 
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mainFarm.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        cell = UITableViewCell(style: UITableViewCellStyle.Default,
            reuseIdentifier: "cell")
        cell.textLabel?.text = self.mainFarm[indexPath.row]
        cell.textLabel?.textColor = UIColor .greenColor()
        cell.textLabel?.font = UIFont.boldSystemFontOfSize(20)
        cell.backgroundColor = UIColor .clearColor()
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You selected \(self.mainFarm[indexPath.row])")
        
        NSUserDefaults .standardUserDefaults() .setObject(self.mainFarm[indexPath.row], forKey: "farmChosen")
        
        self.performSegueWithIdentifier("tofarmerpage", sender: self)
        
        //method called when tapped cell
        
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
