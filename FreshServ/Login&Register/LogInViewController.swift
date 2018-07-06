//
//  LogInViewController.swift
//  FreshServ
//
//  Created by IOSUSER on 1/20/18.
//  Copyright © 2018 IOSUSER. All rights reserved.
//

import UIKit
import OAuthSwift
import OAuthSwiftAlamofire
import Alamofire


extension UITextField {
    func underlined1()
    {
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.black.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
    class LogInViewController: UIViewController,UITextFieldDelegate,UICollectionViewDataSource,UICollectionViewDelegate {

        @IBOutlet var loginButtonOutLet: UIButton!
        @IBOutlet var collectionViewCell: UICollectionView!
        @IBOutlet var passwordTextField: UITextField!
        @IBOutlet var mobileNumberTextField: UITextField!
        
        var mainMenu: [String] = []
       // var json: [String] = []
        var myData: Dictionary<String,Any> = [:]
        var scrollingTimer = Timer()
        var dataString: [String] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainMenu = ["a","b","c","d","e","f","g","h"]
        passwordTextField.underlined1()
        mobileNumberTextField.underlined1()
        collectionViewCell.delegate = self
        collectionViewCell.dataSource = self
        loginButtonOutLet.layer.cornerRadius = 5
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
        public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
        {
            return mainMenu.count
        }
        public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"customCell", for: indexPath) as! CustomCollectionViewCell
            cell.imgCell.image = UIImage(named:mainMenu[indexPath.row])
            var rowindex = indexPath.row
            let numberofRecords:Int = self.mainMenu.count - 1
            if (rowindex < numberofRecords)
            {
                rowindex = (rowindex + 1)
            }
            else
            {
                rowindex = 0
            }
            scrollingTimer = Timer.scheduledTimer(timeInterval: 7.0, target: self, selector: #selector(LogInViewController.startTimer(theTimer:)), userInfo: rowindex, repeats: true)
            return cell
        }
        @objc func startTimer(theTimer:Timer){
            UIView.animate(withDuration: 1.0, animations:{
                self.collectionViewCell.scrollToItem(at: IndexPath(row: theTimer.userInfo! as! Int, section: 0), at: .centeredHorizontally, animated: false)
            }, completion:nil)
        }
        func callingWebServiceForLogin()
        {
        
            let spiningAcitivity = MBProgressHUD.showAdded(to: view, animated: true)
          
            spiningAcitivity.label.text = "Loading..."
            
  
            let parameters: [String: AnyObject] = [
                "email" : mobileNumberTextField.text! as AnyObject,
                "password" : passwordTextField.text! as AnyObject
            ]
            
            print(parameters)
            
            let oauthSessionManager = SessionManager.default
            
            oauthSessionManager.adapter = OAuthSwiftRequestAdapter(ClientHelper.getInstance())
            
            oauthSessionManager.request(login_URL, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
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
                        if str == "Login Successful"{
                        let tabbar: UITabBarController? = (self.storyboard?.instantiateViewController(withIdentifier: "tabbar") as? UITabBarController)
                        self.navigationController?.pushViewController(tabbar!, animated: true)
                            
                            }
                            else
                            {
                                self.displayAlertMessage(messageToDisplay:"Invalid login or password")
                                print("already register")
                            }
                        }
                     MBProgressHUD.hide(for: self.view, animated: false)
                    }
                    
                case .failure(let error):
                    print("ERROR")
                }
      
                }
                
            }
 
    func displayAlertMessage(messageToDisplay: String)
    {
        let alertController = UIAlertController(title: AppName, message: messageToDisplay, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
        // Code in this block will trigger when OK button tapped.
        print("Ok button tapped");
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion:nil)
    }
    
    @IBAction func onClickedSignUpButtonPressed(_ sender: Any)
    {
        let RegisterVC = self.storyboard?.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterVC
        self.navigationController?.pushViewController(RegisterVC, animated: true)
    }
        
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        mobileNumberTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true;
    }
        
    @IBAction func onClickedForgotPasswordButtonPressed(_ sender: Any)
    {
        let ForgotVC = self.storyboard?.instantiateViewController(withIdentifier: "ForgotVC") as! ForgotVC
        self.navigationController?.pushViewController(ForgotVC, animated: true)
    }
        
        @IBAction func onClickedLogin(_ sender: Any)
        {
        if (mobileNumberTextField.text! == "" || self.passwordTextField.text == "" )
        {
        displayAlertMessage(messageToDisplay:"All Fields is Requried" )
        }
        else
        {
        callingWebServiceForLogin()
        }

    }
     
}
