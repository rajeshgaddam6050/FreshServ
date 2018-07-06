//
//  ForgotVC.swift
//  FreshServ
//
//  Created by IOSUSER on 1/17/18.
//  Copyright © 2018 IOSUSER. All rights reserved.
//

import UIKit
import OAuthSwift
import OAuthSwiftAlamofire
import Alamofire
class ForgotVC: UIViewController {

    @IBOutlet var sendButtonOutlet: UIButton!
    @IBOutlet var mobileNumberOurtlet: UITextField!

    @IBOutlet var backButtonOutLet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mobileNumberOurtlet.underlined()
        sendButtonOutlet.layer.cornerRadius = 5
        backButtonOutLet.layer.cornerRadius = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    func callingOnWebServiceForgotPassword()
    {
        let parameters: [String: AnyObject] = [
            "email" : mobileNumberOurtlet.text! as AnyObject
        ]
        
        print(parameters)
        
        let oauthSessionManager = SessionManager.default
        
        oauthSessionManager.adapter = OAuthSwiftRequestAdapter(ClientHelper.getInstance())
        
        oauthSessionManager.request(forgot_URL, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
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
                        if str == "Otp Send Successfully"{
                            //print("GO to NextVieController")
                            let myalert = UIAlertController(title:AppName, message: "Otp Send Successfully", preferredStyle: UIAlertControllerStyle.alert)
                            myalert.addAction(UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                             
                            })
                            self.present(myalert, animated: true)
                        }
                        else
                        {
                            self.displayAlertMessage(messageToDisplay:"Moblie Number Invalid")
                            print("already register")
                        }
                        
                    }
                    
                }
                
            case .failure(let error):
                print("ERROR")
            }
            
        }
        
    }

    @IBAction func onClickedSendButtonPressed(_ sender: Any)
    {
        var ErrorMessage : String?
        
        let providedEmailAddress = mobileNumberOurtlet.text
        let isEmailAddressValid = isValidEmailAddress(emailAddressString: providedEmailAddress!)
        
        if  isEmailAddressValid
        {
        print("Email address is Valid")
        }
        else
        {
        print("Email address is not Valid")
        displayAlertMessage(messageToDisplay:"Email is not Valid" )
        }
        if ErrorMessage?.range(of: ErrorMessage!) != nil
        {
        let alertController = UIAlertController(title: AppName, message: ErrorMessage, preferredStyle:UIAlertControllerStyle.alert)
        let defaultAction = UIAlertAction(title: "OK", style:UIAlertActionStyle.default, handler: nil)
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
            
        }
        else
        {
           callingOnWebServiceForgotPassword()
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

    func isValidEmailAddress(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
                }
            } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
    @IBAction func onClickedBackButtonPressed(_ sender: Any)
    {
       goBack()
    }
    func goBack()
    {
         self.navigationController?.popViewController(animated: true)
    }
}
