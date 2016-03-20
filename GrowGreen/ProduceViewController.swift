//
//  ProduceViewController.swift
//  GrowGreen
//
//  Created by Rachel Sterneck & Priya Mittal on 2/24/16.
//  Copyright © 2016 Rachel Sterneck & Priya Mittal. All rights reserved.
//

import UIKit
import Firebase

class ProduceViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let ref = Firebase(url: "https://grogreen.firebaseio.com/farmers")
    
    var produce = [FDataSnapshot]()
    
    var items = [FDataSnapshot]()

    //This is the outlet for the table view.
    @IBOutlet var tableView: UITableView!
    
    //This is the array which has all of the different types of produce.

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Activates the table view and table view cells.
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    //This sets the amount of cells in the table view. This is equal to the amount of produceArray in the array.
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.produce.count;
    }
    
    //This sets up the table view cell.
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        let produceItem = produce[indexPath.row]
        print(produceItem.value["produce"] as! String)
        
        //Type of cell.
        cell = UITableViewCell(style: UITableViewCellStyle.Default,
            reuseIdentifier: "cell")
            
        //Sets the text in the cell.
        cell.textLabel?.text = produceItem.value["produce"] as! String
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
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath:
        NSIndexPath) {
            
        var produceName = self.produce[indexPath.row].value["produce"] as! String
            
        print("You selected \(produceName)")
        
        //This finds the text of what cell was tapped and sets it to an nsuserdefualt to be used in the next view.
        
         NSUserDefaults .standardUserDefaults() .setObject(produceName, forKey: "produceType")
        
        
        //Activates the segue to transition to the next view. 
        self.performSegueWithIdentifier("toFarmResults", sender: self)
        
    }
    
    override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
        
        let itemRef = Firebase(url: "https://grogreen.firebaseio.com/farmers")
        
        //1
        ref.observeEventType(.Value, withBlock: { snapshot in
            //2
            var newProduce = [FDataSnapshot]()
            
            var farmItem = [FDataSnapshot]()
        
            
            for item in snapshot.children {
                newProduce.append(item as! FDataSnapshot)
            }
            
            
                self.produce = newProduce
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
