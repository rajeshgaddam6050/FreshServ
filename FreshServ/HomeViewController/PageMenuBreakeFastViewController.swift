//
//  PageMenuBreakeFastViewController.swift
//  FreshServ
//
//  Created by IOSUSER on 2/21/18.
//  Copyright © 2018 IOSUSER. All rights reserved.
//

import UIKit

class PageMenuBreakeFastViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  var mainMenu: [String] = []
    
    
    @IBOutlet var tableViewOutLet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

           mainMenu = ["food_for_moc","food_for_moc"]

       tableViewOutLet.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mainMenu.count
    }
    
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewOutLet.dequeueReusableCell(withIdentifier: "breakeFastCell", for: indexPath) as! PageMenuBreakeFastTableViewCell
        cell.breakeFastImageViewOutlet.image = UIImage(named:mainMenu[indexPath.row])
        return cell
    }

}
