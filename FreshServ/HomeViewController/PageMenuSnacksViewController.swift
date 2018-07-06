//
//  PageMenuSnacksViewController.swift
//  FreshServ
//
//  Created by IOSUSER on 2/21/18.
//  Copyright © 2018 IOSUSER. All rights reserved.
//

import UIKit

class PageMenuSnacksViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    
    @IBOutlet var tableViewOutLet: UITableView!
    var snacksMenu:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        snacksMenu = ["food_for_moc","food_for_moc"]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.snacksMenu.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewOutLet.dequeueReusableCell(withIdentifier: "snacksCell", for: indexPath) as! PageMenuSnacksTableViewCell
        cell.snacksImageViewOutLet.image = UIImage(named:snacksMenu[indexPath.row])
        return cell
    }

}
