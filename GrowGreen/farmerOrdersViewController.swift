//
//  farmerOrdersViewController.swift
//  GrowGreen
//
//  Created by Rachel Sterneck on 2/27/16.
//  Copyright © 2016 Mitchell Sweet. All rights reserved.
//

import UIKit
import Firebase

class farmerOrdersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var orderView: UITableView!
    
    
     let ref = Firebase(url: "https://grogreen.firebaseio.com/orders")
    
    var orders = [String]()
    var items = [FDataSnapshot]()
    
    
    var sortedOrders = [FDataSnapshot]()
    var orderItem = FDataSnapshot()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.orderView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    //set # of cells in table view
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.sortedOrders.count;

    }
    
    //This sets up the table view cell.
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.orderView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        
        let orderItem = sortedOrders[indexPath.row]
        
        let restaurantString = orderItem.value["restaurantName"] as! String
        
        //Type of cell.
        

        cell = UITableViewCell(style: UITableViewCellStyle.Default,
            reuseIdentifier: "cell")
        //Sets the text in the cell.
        
        cell.textLabel?.text = restaurantString

        cell.detailTextLabel?.text = ""
            
        //Sets the color of the text in the cell.
        cell.textLabel?.textColor = UIColor .greenColor()
        cell.detailTextLabel?.textColor = UIColor .grayColor()
        //Sets the font of the text in the cell.
        cell.textLabel?.font = UIFont.boldSystemFontOfSize(20)
        //Sets the background color of the cell.
        cell.backgroundColor = UIColor .clearColor()
        //Adds the little arrow on the right of the cell.
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
    }
    
    //This method is called when a cell is tapped on the table view.
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let farmUser = NSUserDefaults . standardUserDefaults() .objectForKey("farmUser")!
        
        let farmUid = farmUser["uid"] as! String
        
        
        ref.observeEventType(.Value, withBlock: {
            snapshot in
            
            var newOrders = [FDataSnapshot]()
            var sortedOrdersString = [String]()
           
            
            for item in snapshot.children{
                newOrders.append(item as! FDataSnapshot)
            }
            
            for var i=0; i<newOrders.count; i++ {
            
                if(farmUid == newOrders[i].value["farmUid"]as! String)
                {
                    self.sortedOrders.append(newOrders[i])
                }
                
            }
            
            for var i=0; i<self.sortedOrders.count; i++ {
                sortedOrdersString.append(self.sortedOrders[i].value["restaurantName"] as! String)
                
            }
            
        
            
            self.orders = sortedOrdersString
            self.orderView.reloadData()
            
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
