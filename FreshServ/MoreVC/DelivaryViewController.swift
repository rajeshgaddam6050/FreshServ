//
//  DelivaryViewController.swift
//  FreshServ
//
//  Created by IOSUSER on 2/26/18.
//  Copyright © 2018 IOSUSER. All rights reserved.
//

import UIKit

class DelivaryViewController: UIViewController {

    @IBOutlet var eMailLabelOutLet: UILabel!
    @IBOutlet var mobileNumberOutLet: UILabel!
    @IBOutlet var nameLabelOutLet: UILabel!
    @IBOutlet var dinnerButtonOutLet: UIButton!
    @IBOutlet var snacksButtonOutLet: UIButton!
    @IBOutlet var lunchButtonOutLet: UIButton!
    @IBOutlet var breakeFastButtonOutLet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        breakeFastButtonOutLet.layer.cornerRadius = 5
        lunchButtonOutLet.layer.cornerRadius = 5
        snacksButtonOutLet.layer.cornerRadius = 5
        dinnerButtonOutLet.layer.cornerRadius = 5

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    @IBAction func onClickedBreakeFastButtonPressed(_ sender: Any) {
        let AddAddressViewController = self.storyboard?.instantiateViewController(withIdentifier: "AddAddressViewController") as! AddAddressViewController
        self.navigationController?.pushViewController(AddAddressViewController, animated: true)
        
    }
    
    
    @IBAction func onClickedLunchButtonPressed(_ sender: Any) {
        let AddAddressViewController = self.storyboard?.instantiateViewController(withIdentifier: "AddAddressViewController") as! AddAddressViewController
        self.navigationController?.pushViewController(AddAddressViewController, animated: true)
        
    }
    
    
    
    @IBAction func onClickedSnacksButtonPressed(_ sender: Any) {
        
        let AddAddressViewController = self.storyboard?.instantiateViewController(withIdentifier: "AddAddressViewController") as! AddAddressViewController
        self.navigationController?.pushViewController(AddAddressViewController, animated: true)
    }
    
    
    @IBAction func onClickedDinnerButtonPressed(_ sender: Any) {
        
        let AddAddressViewController = self.storyboard?.instantiateViewController(withIdentifier: "AddAddressViewController") as! AddAddressViewController
        self.navigationController?.pushViewController(AddAddressViewController, animated: true)
    }
    
    
    @IBAction func onClickedBackButtonPressed(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func onClickedProceedButtonPressed(_ sender: Any) {
        let PaymentViewController = self.storyboard?.instantiateViewController(withIdentifier: "PaymentViewController") as! PaymentViewController
        self.navigationController?.pushViewController(PaymentViewController, animated: true)
        
    }
    
}
