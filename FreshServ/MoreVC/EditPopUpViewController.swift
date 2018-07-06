//
//  EditPopUpViewController.swift
//  FreshServ
//
//  Created by IOSUSER on 2/27/18.
//  Copyright © 2018 IOSUSER. All rights reserved.
//

import UIKit

class EditPopUpViewController: UIViewController {

    @IBOutlet var mobileNumberTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var firstNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mobileNumberTextField.underlined()
        emailTextField.underlined()
        lastNameTextField.underlined()
        firstNameTextField.underlined()

        self.view.backgroundColor = UIColor.clear.withAlphaComponent(0.8)
        self.showAnimate()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        
      
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }

 
    @IBAction func onClickedCancelButtonPressed(_ sender: Any) {
        self.removeAnimate()
        self.view.removeFromSuperview()
        
    }
    
    
    @IBAction func onClickedSubmitButtonPressed(_ sender: Any) {
        
    }
}
