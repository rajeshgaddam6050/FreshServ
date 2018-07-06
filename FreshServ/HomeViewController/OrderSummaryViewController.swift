//
//  OrderSummaryViewController.swift
//  FreshServ
//
//  Created by IOSUSER on 2/27/18.
//  Copyright © 2018 IOSUSER. All rights reserved.
//

import UIKit

class OrderSummaryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    

  

    @IBAction func onClickedCheckOutButtonPressed(_ sender: Any) {
        
        let DelivaryViewController = self.storyboard?.instantiateViewController(withIdentifier: "DelivaryViewController") as! DelivaryViewController
        self.navigationController?.pushViewController(DelivaryViewController, animated: true)
        
    }
    
    
    @IBAction func onClickedBackButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
