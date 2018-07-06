//
//  AddAddressViewController.swift
//  FreshServ
//
//  Created by IOSUSER on 2/21/18.
//  Copyright © 2018 IOSUSER. All rights reserved.
//

import UIKit
import OAuthSwiftAlamofire
import OAuthSwift
import Alamofire
extension UITextField {
    func underlined3()
    {
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
class AddAddressViewController: UIViewController {
    
    
    @IBOutlet var saveAddressbuttonOutLet: UIButton!
    @IBOutlet var addressTitleTextFieldOutLet: UITextField!
    @IBOutlet var CountrySelectedTextFieldOutLet: UITextField!
    @IBOutlet var cityTextFieldOutLet: UITextField!
    @IBOutlet var areaTextFieldOutLet: UITextField!
    @IBOutlet var blockTextFieldOutLet: UITextField!
    @IBOutlet var companyTextFieldOutLet: UITextField!
    @IBOutlet var addressLine1TextFieldOutLet: UITextField!
    @IBOutlet var addressTextFieldLine2OutLet: UITextField!
    @IBOutlet var mobileNumberTextFieldOutLet: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        addressTitleTextFieldOutLet.underlined3()
        CountrySelectedTextFieldOutLet.underlined3()
        cityTextFieldOutLet.underlined3()
        areaTextFieldOutLet.underlined3()
        blockTextFieldOutLet.underlined3()
        companyTextFieldOutLet.underlined3()
        addressLine1TextFieldOutLet.underlined3()
        addressTextFieldLine2OutLet.underlined3()
        mobileNumberTextFieldOutLet.underlined3()
        
        //mobile number keyboard number style
        mobileNumberTextFieldOutLet.keyboardType = UIKeyboardType.numberPad
        saveAddressbuttonOutLet.layer.cornerRadius = 5

       callingAddAddressWebService()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    @IBAction func onClickedSaveAddressButtonPressed(_ sender: Any) {
        
    }
    
  
  
    @IBAction func onClickedBackButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    func callingAddAddressWebService()
    {
        let oauthswift = OAuth1Swift(
            consumerKey:"102af6d54e9f90dc9d661f933494ca54",
            consumerSecret:"5330043049ef7da7563d60e68a32738c"
        )
        oauthswift.client.credential.oauthToken = "ce8d2d3a2a8e96e6270a4a88a3fcf85c"
        oauthswift.client.credential.oauthTokenSecret = "01d0070ebce508e2cb904746dceba4b4"
        oauthswift.client.get(add_Address_URL, success: { responce in
            print("success")
            print("language name: \(responce)")
            print(responce.request as Any)  // original URL request
            print(responce.response as Any) // HTTP URL response
            print(responce.data as Any)     // server data
            print("\(responce)")
            
            let dataString = responce.string
            print(dataString)
            print("responsestr :\(dataString)")
            let data = dataString?.data(using: .utf8)
            print(data)
            do {
                let jsonData = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! Dictionary<String, Any>
                print(jsonData)
                
                if  let myData = jsonData["data"] as AnyObject? {
                    print(myData)
                    
                    
                    
                }
            }
            catch let error as NSError
            {
                print(error)
            }
        },  failure: { error in
            print(error)
            
        }
            
        )
    }
}
    

