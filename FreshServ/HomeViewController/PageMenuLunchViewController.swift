//
//  PageMenuLunchViewController.swift
//  FreshServ
//
//  Created by IOSUSER on 2/21/18.
//  Copyright © 2018 IOSUSER. All rights reserved.
//

import UIKit

class PageMenuLunchViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet var tableViewOutLet: UITableView!
    var lunchMenu:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lunchMenu = ["h","h"]
   
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.lunchMenu.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewOutLet.dequeueReusableCell(withIdentifier: "lunchCell", for: indexPath) as! PageMenuLunchTableViewCell
        cell.lunchImageViewOutLet.image = UIImage(named:lunchMenu[indexPath.row])
        return cell
    }
 

}
