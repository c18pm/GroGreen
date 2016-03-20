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
    
    var orders = [FDataSnapshot]()
    var items = [FDataSnapshot]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.orderView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    //set # of cells in table view
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.orders.count;
        
    }
    
    //This sets up the table view cell.
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.orderView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        let orderItem = orders[indexPath.row]
        
        let restaurantString = orderItem.value["restaurantUid"] as! String
        let produceString = orderItem.value["produce"] as! String
        
        let quantityInt = orderItem.value["quantity"] as! Int
        var quantityString = "\(quantityInt)"
        
        let priceDouble = orderItem.value["price"] as! Double
        var priceString = "\(priceDouble)"
        
        
        //Type of cell.
        cell = UITableViewCell(style: UITableViewCellStyle.Default,
            reuseIdentifier: "cell")
        //Sets the text in the cell.
        
        cell.textLabel?.text = restaurantString
        
        cell.detailTextLabel?.text = (produceString + ", " + quantityString + ", " + priceString + ", ")
            
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
        
        let itemRef = Firebase(url: "https://grogreen.firebaseio.com/orders")
        
        ref.observeEventType(.Value, withBlock: {
            snapshot in
            
            var newOrder = [FDataSnapshot]()
            
            var orderItem = [FDataSnapshot] ()
            
            for item in snapshot.children{
                newOrder.append(item as! FDataSnapshot)
            }
            
            self.orders = newOrder
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
