//
//  PageMenuDinnerViewController.swift
//  FreshServ
//
//  Created by IOSUSER on 2/21/18.
//  Copyright © 2018 IOSUSER. All rights reserved.
//

import UIKit

class PageMenuDinnerViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet var tableViewOutLet: UITableView!
    var dinnerMenu:[String] = []
    override func viewDidLoad() {
        super.viewDidLoad()

         dinnerMenu = ["h","h"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dinnerMenu.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewOutLet.dequeueReusableCell(withIdentifier: "dinnerCell", for: indexPath) as! PageMenuDinnerTableViewCell
        cell.dinnerImageOutLet.image = UIImage(named:dinnerMenu[indexPath.row])
        return cell
    }


}
