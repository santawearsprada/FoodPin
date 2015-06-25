//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by SANTIPONG TANCHATCHAWAL on 3/16/15.
//  Copyright (c) 2015 SANTIPONG TANCHATCHAWAL. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    /*
    
    var restaurantsNames = ["Cafe Deadend", "Homei", "Po's Atelier", "Bourke Street Bakery", "Chef Thai", "Confessional", "Cafelore", "Five leaves", "Petite Oyster", "Royal Oak", "UpState"]
    var restaurantsImgs = ["cafedeadend.jpg", "homei.jpg", "posatelier.jpb", "bourkestreetbakery.jpg", "thaicafe.jpg", "confessional.jpg", "cafelore.jpg", "fiveleaves.jpg", "petiteoyster.jpg", "royaloak.jpg", "upstate.jpg"]
    var restaurantLocations = ["Hong Kong", "Hong Kong", "New York", "New York", "London", "New York", "New Delhi", "San Jose", "Baton Rouge", "Seattle", "New York"]
    var restaurantTypes  = ["Coffee & Tea shop", "Tea House", "American", "Bakery", "Thai", "American", "Indian", "American", "Cajun", "Traditional American", "Bakery"]
    var restaurantIsVisited = [false, false, false, false, false, false, false, false, false, false, false]
    
    */

    var restaurants:[Restaurant] = [Restaurant(name: "Cafe Deadend", type: "Coffee & Tea shop", location: "G/F, 72 Po Hing Fong, Sheung Wan, Hong Kong", image: "cafedeadend.jpg", isVisited: false),
        Restaurant(name: "Homei", type: "Cafe", location: "Hong Kong", image: "homei.jpg", isVisited: false),
        Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", image: "teakha.jpg", isVisited: false),
        Restaurant(name: "Petite Oyster", type: "French", location: "Hong Kong", image: "petiteoyster.jpg", isVisited: false),
        Restaurant(name: "Bourke Street Bakery", type: "Chocolate", location: "Sydney", image: "bourkestreetbakery.jpb", isVisited: false),
        Restaurant(name: "Traif", type: "American", location: "New York", image: "traif.jpg", isVisited: false),
        Restaurant(name: "Thai Cafe", type: "Thai", location: "London", image: "thaicafe.jpg", isVisited: false),
        Restaurant(name: "Royal Oak", type: "British", location: "London", image: "royaloak.jpg", isVisited: false),
        Restaurant(name: "Upstate", type: "American", location: "New York", image: "upstate.jpg", isVisited: false)
    ]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return self.restaurants.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomTableViewCell

        // Configure the cell...
        
        let restaurant = restaurants[indexPath.row]
        
        cell.nameLabel?.text = restaurant.name
        cell.thumbnailImageView?.image = UIImage(named: restaurant.image)
        cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.size.width/2
        cell.thumbnailImageView.clipsToBounds = true
        cell.locationLabel?.text = restaurant.location
        cell.typeLabel?.text = restaurant.type
        
        
        if restaurant.isVisited == true {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }

        return cell
    }
    
    /*
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: UIAlertControllerStyle.ActionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        optionMenu.addAction(cancelAction)

        
        let callActionHandler = { (action:UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "Service Unavaiable", message: "Sorry, the call feature is not avaiable yet. Please try again later.", preferredStyle: .Alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alertMessage, animated: true, completion: nil)
        }
        let callAction = UIAlertAction(title: "Call" + "123-000-\(indexPath.row)", style: UIAlertActionStyle.Default, handler: callActionHandler)
        optionMenu.addAction(callAction)
        
        var isVisitedAction:UIAlertAction
        
        if restaurantIsVisited[indexPath.row] == false {
            isVisitedAction = UIAlertAction(title: "I've been here", style: .Default, handler: {
                (action:UIAlertAction!) -> Void in
                let cell = tableView.cellForRowAtIndexPath(indexPath)
                cell?.accessoryType = .Checkmark
                self.restaurantIsVisited[indexPath.row] = true
            })
        } else {
            isVisitedAction = UIAlertAction(title: "Umm. I've never been here actually", style: .Default, handler: {
                (action:UIAlertAction!) -> Void in
                let cell = tableView.cellForRowAtIndexPath(indexPath)
                cell?.accessoryType = .None
                self.restaurantIsVisited[indexPath.row] = false
            })
                
                
        }
        
        optionMenu.addAction(isVisitedAction)
        
        self.presentViewController(optionMenu, animated: true, completion: nil)
        
        
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
    
    */
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]? {
        var shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Share", handler: {
            (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
            let shareMenu = UIAlertController(title: nil, message: "Share using", preferredStyle: .ActionSheet)
            let twitterAction = UIAlertAction(title: "Twitter", style: .Default, handler: nil)
            let facebookAction = UIAlertAction(title: "Facebook", style: .Default, handler: nil)
            let emailAction = UIAlertAction(title: "Email", style: .Default, handler: nil)
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            
            shareMenu.addAction(twitterAction)
            shareMenu.addAction(facebookAction)
            shareMenu.addAction(emailAction)
            shareMenu.addAction(cancelAction)
            
            self.presentViewController(shareMenu, animated: true, completion: nil)
            
        })
        
        var deleteAction = UITableViewRowAction(style: .Default, title: "Delete", handler: {
            (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
            
            /*
            self.restaurantsNames.removeAtIndex(indexPath.row)
            self.restaurantLocations.removeAtIndex(indexPath.row)
            self.restaurantsImgs.removeAtIndex(indexPath.row)
            self.restaurantIsVisited.removeAtIndex(indexPath.row)
            self.restaurantTypes.removeAtIndex(indexPath.row)
            */
            
            self.restaurants.removeAtIndex(indexPath.row)
            
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
            
            
        })
        
        shareAction.backgroundColor = UIColor(red: 255.0/255.0, green: 166.0/255.0, blue: 51.0/255.0, alpha: 1.0)
        
        return [shareAction, deleteAction]
        
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

  
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
      }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if(segue.identifier == "showRestaurantDetail"){
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let destinationController = segue.destinationViewController as!DetailViewController
                //let restaurant = restaurants[indexPath.row]
                /*
                destinationController.restaurantImage = restaurant.image
                destinationController.restaurantLocation = restaurant.location
                destinationController.restaurantName = restaurant.name
                */
                destinationController.restaurant  = restaurants[indexPath.row]
            }
        }
        
    }
    
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}
