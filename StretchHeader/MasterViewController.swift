//
//  MasterViewController.swift
//  StretchHeader
//
//  Created by Monica Mollica on 2016-04-12.
//  Copyright © 2016 Sergio Mollica. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    
    // MARK: Properties

    var detailViewController: DetailViewController? = nil
    var objects = [News]()
    
    let kTableHeaderHeight:CGFloat = 200
    
    // MARK: Outlets


    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var headerDateLabel: UILabel!
    
    // MARK: ViewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController!.navigationBarHidden = true
        
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.MediumStyle
        
        let dateString = formatter.stringFromDate(NSDate())
        headerDateLabel.text = dateString
        
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
        tableView.contentInset.top = kTableHeaderHeight
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50
        
        headerView.frame.origin.y = -kTableHeaderHeight
        headerView.center.x = view.center.x

    
        self.createNews("World", headline: "Climate change protests, divestments meet fossil fuels realities", details: "No Details")
        self.createNews("Europe", headline: "Scotland's 'Yes' leader says independence vote is 'once in a lifetime", details: "No Details")
        self.createNews("Middle East", headline: "Airstrikes boost Islamic State, FBI director warns more hostages possible", details: "No Details")
        self.createNews("Africa", headline: "Nigeria says 70 dead in building collapse; questions S. Africa victim claim", details: "No Details")
        self.createNews("Asia Pacific", headline: "Despite UN ruling, Japan seeks backing for whale hunting", details: "No Details")
        self.createNews("Americas", headline: "Officials: FBI is tracking 100 Americans who fought alongside IS in Syria", details: "No Details")
        self.createNews("World", headline: "South Africa in $40 billion deal for Russian nuclear reactors", details: "No Details")
        self.createNews("Europe", headline: "One million babies' created by EU student exchanges", details: "No Details")
        
    }

    override func viewWillAppear(animated: Bool) {
        //
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    // MARK: Helper Functions
    
    func createNews(category: String, headline: String, details: String) {
        let news = News(category: category, headline: headline, details:details)
        objects.append(news)
    }
    
    // MARK: UIScrollViewDelegate
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        updateHeaderView()
    }
    
    func updateHeaderView() {
        if -tableView.contentOffset.y > kTableHeaderHeight {
            headerView.frame.origin.y = tableView.contentOffset.y
            headerView.frame.size.height = -tableView.contentOffset.y
        }
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row]
                let controller = segue.destinationViewController as! DetailViewController
                controller.detailItem = object
            }
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("newsCell", forIndexPath: indexPath) as! NewsCell

        let object = objects[indexPath.row]
        cell.categoryLabel.text = object.category
        cell.headlineLabel.text = object.headline
        cell.categoryLabel.textColor = cell.setCategoryColour(object.category)
        
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            objects.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
}