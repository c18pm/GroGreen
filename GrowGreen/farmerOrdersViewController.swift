//
//  farmerOrdersViewController.swift
//  GrowGreen
//
//  Created by Rachel Sterneck on 2/27/16.
//  Copyright © 2016 Mitchell Sweet. All rights reserved.
//

import UIKit

class farmerOrdersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var orderView: UITableView!
    
    var orderArray = ["Order 1", "Order 2", "Order 3"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.orderView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    //set # of cells in table view
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("hello")
        return self.orderArray.count;
        
    }
    
    //This sets up the table view cell.
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.orderView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        //Type of cell.
        cell = UITableViewCell(style: UITableViewCellStyle.Default,
            reuseIdentifier: "cell")
        //Sets the text in the cell.
        cell.textLabel?.text = self.orderArray[indexPath.row]
        //Sets the color of the text in the cell.
        cell.textLabel?.textColor = UIColor .greenColor()
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
        print("You selected \(self.orderArray[indexPath.row])")
        
        //This finds the text of what cell was tapped and sets it to an nsuserdefualt to be used in the next view.
        NSUserDefaults .standardUserDefaults() .setObject(self.orderArray[indexPath.row], forKey: "produceType")
        
        //Activates the segue to transition to the next view.
        self.performSegueWithIdentifier("toFarmResults", sender: self)
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
