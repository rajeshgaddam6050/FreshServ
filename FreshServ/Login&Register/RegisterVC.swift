//
//  RegisterVC.swift
//  FreshServ
//
//  Created by IOSUSER on 1/17/18.
//  Copyright © 2018 IOSUSER. All rights reserved.
//

import UIKit
import OAuthSwift
import OAuthSwiftAlamofire
import Alamofire
extension UITextField {
    func underlined()
    {
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.white.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
class RegisterVC: UIViewController,UITextFieldDelegate
    {
        @IBOutlet var registerButtonOutLet: UIButton!
        @IBOutlet var reEnterPasswordTextField: UITextField!
        @IBOutlet var passwordTextField: UITextField!
        @IBOutlet var mobileNumerOutLet: UITextField!
        @IBOutlet var emailAddressOutLet: UITextField!
        @IBOutlet var lastNameTextField: UITextField!
        @IBOutlet var firstNameTextField: UITextField!
   
      var myData: Dictionary<String,Any> = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reEnterPasswordTextField.underlined()
        passwordTextField.underlined()
        mobileNumerOutLet.underlined()
        emailAddressOutLet.underlined()
        lastNameTextField.underlined()
        firstNameTextField.underlined()
        registerButtonOutLet.layer.cornerRadius = 5
}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayAlertMessage(messageToDisplay: String)
    {
        let alertController = UIAlertController(title:AppName, message: messageToDisplay, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
        // Code in this block will trigger when OK button tapped.
        print("Ok button tapped");
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion:nil)
    }
    
    @IBAction func onClickedRegisterButtonPressed(_ sender: Any)
    {
        
        var ErrorMessage : String?
        let text = mobileNumerOutLet.text! as NSString
        let passwordText = passwordTextField.text! as NSString
        let providedEmailAddress = emailAddressOutLet.text
        let isEmailAddressValid = isValidEmailAddress(emailAddressString: providedEmailAddress!)

        if (emailAddressOutLet.text! == "" || self.passwordTextField.text == "" || self.reEnterPasswordTextField.text == "" || self.mobileNumerOutLet.text == "" || self.lastNameTextField.text == "" || self.firstNameTextField.text == "" )
        {
            displayAlertMessage(messageToDisplay:"All Fields is Requried" )
        }else if (passwordText.length < 6)
        {
            displayAlertMessage(messageToDisplay: "Please Enter Password 6 Characters minimum")
        }
        else if (passwordTextField.text != reEnterPasswordTextField.text)
        {
            print("Not Equal Password & Confirm Password ")
            displayAlertMessage(messageToDisplay: "Password & ReEnter Password doesn't matched")
        }
        else if (text.length < 10)
        {
            displayAlertMessage(messageToDisplay:"Please Enter Valid Mobile Number")
        }
        else if  isEmailAddressValid
        {
            print("Email address is Valid")
        }else
        {
            print("Email address is not Valid")
            displayAlertMessage(messageToDisplay:"Email is not Valid" )
        }
        if ErrorMessage?.range(of: ErrorMessage!) != nil  {

            let alertController = UIAlertController(title: AppName, message: ErrorMessage, preferredStyle:UIAlertControllerStyle.alert)
            let defaultAction = UIAlertAction(title: "OK", style:UIAlertActionStyle.default, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        else
        {
            callingOTPWebService()
        }
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
    func callingOTPWebService()
    {
        let parameters = [
                "mobile_no":mobileNumerOutLet.text! as AnyObject,
        ]
        print(parameters)
        
        let oauthSessionManager = SessionManager.default
        
        oauthSessionManager.adapter = OAuthSwiftRequestAdapter(ClientHelper.getInstance())
        
        oauthSessionManager.request(otp_URL, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
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
                            self.showPopUpButton()
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

    @IBAction func onClickedBackToLogin(_ sender: Any)
    {
        goBack()
    }
    func goBack()
    {
        self.navigationController?.popViewController(animated: true)
    }
    func showPopUpButton()
    {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OTPViewController") as! OTPViewController
        popOverVC.firstString = firstNameTextField.text!
        popOverVC.lastString = lastNameTextField.text!
        popOverVC.emailString = emailAddressOutLet.text!
        popOverVC.passwordString = passwordTextField.text!
        popOverVC.mobileString = mobileNumerOutLet.text!
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
        print(popOverVC)
        
        }
    }

