//
//  PaymentViewController.swift
//  FreshServ
//
//  Created by IOSUSER on 2/21/18.
//  Copyright © 2018 IOSUSER. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    

    @IBAction func onClickedBackButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
