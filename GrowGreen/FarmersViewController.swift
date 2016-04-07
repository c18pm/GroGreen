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

    var farms = [String]()
    var sortedFarms = [FDataSnapshot]()
    
    var farmItem = FDataSnapshot()
    
    
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
        
         produceType = NSUserDefaults .standardUserDefaults() .stringForKey("produceType")!
        
        //Sends data to FarmerPageViewController
        
        //let defaults = NSUserDefaults.standardUserDefaults()
        
        //let key = "myTableViewWithRowOf\(indexPath.row)"
        //defaults.setFloat(selectedCell.contentView.alpha, forKey: key)
        
        
        //Activates the segue to transition to the next view.
        //self.performSegueWithIdentifier("toFarmResults", sender: self)
        
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")

        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedFarms.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
//        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell!
        
        //farmItem is FDataSnapshot
        farmItem = sortedFarms[indexPath.row]
        
        //farmItemName is String
        let farmItemName = farms[indexPath.row]
        
        print(farmItemName)
        
        cell = UITableViewCell(style: UITableViewCellStyle.Default,
            reuseIdentifier: "cell")
   
        cell.textLabel?.text = farmItemName
        cell.textLabel?.textColor = UIColor .greenColor()
         cell.textLabel?.font = UIFont(name: "Iowan Old Style", size: 20)
        cell.backgroundColor = UIColor .clearColor()
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //farmItem is FDataSnapshot
        farmItem = sortedFarms[indexPath.row]
        
        //farmItemName is String
        let farmItemName = farms[indexPath.row]
        
        print("You selected \(farmItemName)")
        
        NSUserDefaults .standardUserDefaults() .setObject(farmItem.value, forKey: "farmChosen")
        
        self.performSegueWithIdentifier("toFarmerPage", sender: self)
        
        //method called when tapped cell
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        ref.observeEventType(.Value, withBlock: { snapshot in
            
            var sortedFarmsString = [String]()
            var newFarms = [FDataSnapshot]()
            
            for item in snapshot.children {
                newFarms.append(item as! FDataSnapshot)
            }
            
            for var i=0; i<newFarms.count; i++ {
                
                //each farm has one produce type
                let produceName = newFarms[i].value["produce"] as! String
                
                // produceType is name selected by NSUserDefaults
                if (produceName == self.produceType)
                {
                    self.sortedFarms.append(newFarms[i])
                }
            
            }
            
            for var i=0; i<self.sortedFarms.count; i++ {
                sortedFarmsString.append(self.sortedFarms[i].value["name"] as! String)
            }
            
            
            self.farms = sortedFarmsString
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
