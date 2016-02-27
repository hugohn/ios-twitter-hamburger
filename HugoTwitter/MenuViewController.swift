//
//  MenuViewController.swift
//  HugoTwitter
//
//  Created by Hieu Nguyen on 2/26/16.
//  Copyright © 2016 Hugo Nguyen. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewControllers: [UIViewController] = []
    
    var hamburgerViewController: HamburgerViewController!
    
    convenience init(withHamburger hamburgerViewController: HamburgerViewController?)
    {
        self.init(nibName: nil, bundle: nil)
        self.hamburgerViewController = hamburgerViewController!
        hamburgerViewController!.menuViewController = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerNib(UINib(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: "MenuCell")
        
        let storyboard = UIStoryboard(name: "TweetsViewController", bundle: nil)
        
        let homeTimeline = storyboard.instantiateViewControllerWithIdentifier("TweetsViewController")
        let homeTimelineNav = UINavigationController(rootViewController: homeTimeline)
        
        let profile = storyboard.instantiateViewControllerWithIdentifier("ProfileViewController")
        let profileNav = UINavigationController(rootViewController: profile)
        
        viewControllers.append(homeTimelineNav)
        viewControllers.append(profileNav)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewControllers.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        hamburgerViewController.contentViewController = viewControllers[indexPath.row]
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MenuCell", forIndexPath: indexPath) as! MenuCell
        
        cell.menuItemLabel.text = "Test Item"
        
        return cell
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