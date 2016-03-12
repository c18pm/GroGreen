//
//  FarmersViewController.swift
//  GrowGreen
//
//  Created by Rachel Sterneck & Priya Mittal on 2/24/16.
//  Copyright © 2016 Rachel Sterneck & Priya Mittal. All rights reserved.
//

import UIKit
import Firebase

class FarmersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    //firebase reference
    let ref = Firebase(url: "https://grogreen.firebaseio.com/farmers")

    var farms = [FDataSnapshot]()
    
    // your firebase reference as a property
    
    // your data source, you can replace this with your own model if you wish
    var items = [FDataSnapshot]()


    //These are all different arrays which show which farms supply which types of produce. There is also a main array and once the view is loaded, that array will be set to the array that has the farms of the selected produce.
    @IBOutlet var tableView: UITableView!
  
    var produceType = String()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Recieves the type of produce selected on the previous table view from NSUserDefaults.
        
        // produceType = NSUserDefaults .standardUserDefaults() .stringForKey("produceType")!
        
        //Sends data to FarmerPageViewController
        
        //let defaults = NSUserDefaults.standardUserDefaults()
        
        //let key = "myTableViewWithRowOf\(indexPath.row)"
        //defaults.setFloat(selectedCell.contentView.alpha, forKey: key)
        
        
        //Activates the segue to transition to the next view.
        //self.performSegueWithIdentifier("toFarmResults", sender: self)
        
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")

        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return farms.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
//        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell!
        let farmItem = farms[indexPath.row]
        print(farmItem.value["name"] as! String)
        
        cell = UITableViewCell(style: UITableViewCellStyle.Default,
            reuseIdentifier: "cell")
   
        cell.textLabel?.text = farmItem.value["name"] as! String
        cell.textLabel?.textColor = UIColor .greenColor()
        cell.textLabel?.font = UIFont.boldSystemFontOfSize(20)
        cell.backgroundColor = UIColor .clearColor()
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let farmItem = farms[indexPath.row]
        
        var name = farmItem.value["name"] as! String

        print("You selected \(name)")
        
        NSUserDefaults .standardUserDefaults() .setObject(farmItem.value, forKey: "farmChosen")
        
        self.performSegueWithIdentifier("tofarmerpage", sender: self)
        
        //method called when tapped cell
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // 1
        ref.observeEventType(.Value, withBlock: { snapshot in
            
            // 2
            var newfarms = [FDataSnapshot]()
            
            // 3
            for item in snapshot.children {
                newfarms.append(item as! FDataSnapshot)
            }
            
            // 5
            self.farms = newfarms
            self.tableView.reloadData()
        })
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
