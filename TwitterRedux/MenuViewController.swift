//
//  MenuViewController.swift
//  TwitterRedux
//
//  Created by Deeksha Prabhakar on 11/4/16.
//  Copyright © 2016 Deeksha Prabhakar. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    private var profileNavController:UIViewController!
    private var homeTimeLineNavController:UIViewController!
    private var mentionsNavController:UIViewController!
    
    var viewControllers:[UIViewController] = []
    var hamburgerViewController: HamburgerViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        profileNavController = storyboard.instantiateViewController(withIdentifier: "ProfileNavigationController")
        homeTimeLineNavController = storyboard.instantiateViewController(withIdentifier: "HomeTimelineNavigationController")
        mentionsNavController = storyboard.instantiateViewController(withIdentifier: "MentionsNavigationController")
        
        viewControllers.append(profileNavController)
        viewControllers.append(homeTimeLineNavController)
        viewControllers.append(mentionsNavController)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        hamburgerViewController.contentViewController = homeTimeLineNavController
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewControllers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        let titles = ["Profile", "Home Timeline", "Mentions"]
        cell.menuLabel.text = titles[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        hamburgerViewController.contentViewController = viewControllers[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let rowHeight = Int.init(self.view.frame.height)/viewControllers.count
        return CGFloat.init(rowHeight)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
