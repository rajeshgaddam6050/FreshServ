//
//  OTPViewController.swift
//  FreshServ
//
//  Created by IOSUSER on 1/22/18.
//  Copyright © 2018 IOSUSER. All rights reserved.
//

import UIKit
import OAuthSwift
import OAuthSwiftAlamofire
import Alamofire

class OTPViewController: UIViewController,UITextFieldDelegate{

    @IBOutlet var tapOutSideOutLet: UIView!
    @IBOutlet var enterYourOtp: UITextField!
    
    var firstString = String()
    var lastString = String()
    var emailString = String()
    var passwordString = String()
    var mobileString = String()
    var setCookies = String()
    var paramDict:Dictionary<String, String> = [:]
    
    override func viewDidLoad() {
    super.viewDidLoad()
 
    enterYourOtp.underlined()
    self.view.backgroundColor = UIColor.clear.withAlphaComponent(0.8)
    self.showAnimate()

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func onClickedClosedButtonPressed(_ sender: Any)
    {
        self.removeAnimate()
        self.view.removeFromSuperview()
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

    func callingRegisterWebService()
    {
        let parameters = [
            "email" : emailString,
            "firstname" : firstString,
            "lastname" : lastString,
            "website_id" : "1",
            "group_id" : "1",
            "password" : passwordString,
            "mobile_no" : mobileString,
            "customer_type" : "3",
            "platform_type" : "9",
            "social_type" : "5",
            "otp_code" : enterYourOtp.text!
            
        ]
        print(parameters)
        
        let oauthSessionManager = SessionManager.default
        
        oauthSessionManager.adapter = OAuthSwiftRequestAdapter(ClientHelper.getInstance())
        
        oauthSessionManager.request(register_URL, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            print(response)
            switch response.result {
            case .success:
                print("Sucess")
                
                if response.result.error == nil{
                    
                    if let json = response.result.value as? Dictionary<String,Any>{
                        let strMessage = json["message"]
                        print(strMessage)
                        let str =  strMessage as? String ?? ""
                        print(str)
                        print("go to viewcontrollers")
                        print(json)
                        if str == "Register Successful"{
                            //print("GO to NextVieController")
                            let myalert = UIAlertController(title:AppName, message: "Register Successful", preferredStyle: UIAlertControllerStyle.alert)
                            myalert.addAction(UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                                
                            })
                            self.present(myalert, animated: true)
                        }
                        else
                        {
                            self.displayAlertMessage(messageToDisplay:"email & phone number already register")
                            print("already register")
                        }
                        
                    }
                    
                }
                
            case .failure(let error):
                print("ERROR")
            }
            
        }
        
    }
    func displayAlertMessage(messageToDisplay: String)
    {
        let alertController = UIAlertController(title:AppName, message: messageToDisplay, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
        print("Ok button tapped");
    }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion:nil)
    }
    @IBAction func onClickedReSendOTP(_ sender: Any)
    {
        callingRegisterWebService()
    }
    
    @IBAction func onClickedVerifyOTP(_ sender: Any)
    {
       callingRegisterWebService()
    }
    
  
}
