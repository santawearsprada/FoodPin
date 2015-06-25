//
//  DetailViewController.swift
//  FoodPin
//
//  Created by SANTIPONG TANCHATCHAWAL on 3/20/15.
//  Copyright (c) 2015 SANTIPONG TANCHATCHAWAL. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var restaurantImageView: UIImageView!

    @IBOutlet weak var tableView: UITableView!
    
    
    var restaurantImage:String!
    var restaurantName:String!
    var restaurantLocation:String!
    
    var restaurant:Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = self.restaurant.name
        
        
        restaurantImageView.image = UIImage(named: restaurant.image)
        //restaurantImageView.layer.cornerRadius = restaurantImageView.frame.size.width/2
        //restaurantImageView.clipsToBounds = true
        
        self.tableView.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue:240.0/255.0, alpha: 0.2)
        self.tableView.tableFooterView = UIView(frame: CGRectZero)
        self.tableView.separatorColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue:240.0/255.0, alpha: 0.8)

        tableView.estimatedRowHeight = 36.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
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
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! DetailTableViewCell
        
        cell.mapButton.hidden = true
        
        switch indexPath.row {
        case 0:
            cell.fieldLabel.text = "Name"
            cell.valueLabel.text = restaurant.name
        case 1:
            cell.fieldLabel.text = "Type"
            cell.valueLabel.text = restaurant.type
        case 2:
            cell.fieldLabel.text = "Location"
            cell.valueLabel.text = restaurant.location
            cell.mapButton.hidden = false
            
        case 3:
            cell.fieldLabel.text = "Been Here"
            cell.valueLabel.text = (restaurant.isVisited) ? "Yes, I've been here." : "No. One day.. I will"

        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        }
        
        return cell
    }
    
    
    override func prefersStatusBarHidden() -> Bool {
       return true
    }

    @IBAction func close(segue: UIStoryboardSegue){
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showMap" {
            let destinationController = segue.destinationViewController as! MapViewController
            destinationController.restaurant = restaurant
        }
    }

}
