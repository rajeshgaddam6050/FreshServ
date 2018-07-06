//
//  SubscribeViewController.swift
//  FreshServ
//
//  Created by IOSUSER on 2/3/18.
//  Copyright © 2018 IOSUSER. All rights reserved.
//

import UIKit
import OAuthSwift
import OAuthSwiftAlamofire
import Alamofire
enum MyTheme {
    case light
    case dark
}
class SubscribeViewController: UIViewController {

    @IBOutlet var breakeFastOutLet: UIButton!
    @IBOutlet var launchOutLet: UIButton!
    @IBOutlet var snackOutLet: UIButton!
    @IBOutlet var dinnerOutLet: UIButton!
    @IBOutlet var regularOutLet: DLRadioButton!
    @IBOutlet var vegBtnOutLet: DLRadioButton!
    
    
    @IBOutlet var priceLabelOutLet: UILabel!
    @IBOutlet var oneNumberButtonOutLet: UIButton!
    @IBOutlet var fiveNumberButtonOutLet: UIButton!
    @IBOutlet var tenNumberButtonOutLet: UIButton!
    @IBOutlet var fifteenNumberButtonOutLet: UIButton!
    @IBOutlet var twentyNumberButtonOutLet: UIButton!
    
    
    var checkBox1 = UIImage(named:"CheckBox")
    var unCheckBox1 = UIImage(named:"UnCheckBox")
    
    @IBOutlet weak var onClickSelectForCalender: UIButton!
    @IBOutlet weak var subCalenderView: UIView!
    
    @IBOutlet weak var mainCalender: UIView!
    var iconCheckSubscription1 = UIImage(named:"iconsubscription01_large")
    @IBAction func onClickCancelForCalender(_ sender: UIButton)
    {
       // self.removeAnimate()
       // self.view.removeFromSuperview()
        self.mainCalender.isHidden = true
         self.calenderView.isHidden = true
        
    }
   
    
    @IBAction func onClickSelectForClaender(_ sender: UIButton)
    {
       if appdelegate.selectedString == "SELECTED"
       {
        let menuParams:[String:AnyObject] = ["DIET"   : self.dietString as AnyObject,
                                         "SUBSCRIPTION"  : self.subscribeString as AnyObject,
                                         "QUANTITY" : self.quantityCheckValiue as AnyObject,
                                         "BREAKFAST" : self.apiBreakFastString as AnyObject,
                                         "LUNCH" : self.apiLunchString as AnyObject,
                                         "DINNER" : self.apiDinnerString as AnyObject,
                                         "TOTALPRICE" : "\(selectedBreakFastPrice)" as AnyObject,
                                         "SNACKS" : self.apiSnacksString as AnyObject ]
        
        
        
        
        
        
        
        let MenuViewController = self.storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        MenuViewController.apiMenuParams = menuParams
        self.navigationController?.pushViewController(MenuViewController, animated: true)
        }
        else
       {
        self.displayAlertMessage(messageToDisplay: "Please Select Date")
        }
    }
    var iconUncheckSubscription1 = UIImage(named:"iconsubscription01_small")
    
    var iconCheckSubscription5 = UIImage(named:"iconsubscription05_large")
    var iconUncheckSubscription5 = UIImage(named:"iconsubscription05_small")
    
        var iconCheckSubscription10 = UIImage(named:"iconsubscription10_large")
    var iconUncheckSubscription10 = UIImage(named:"iconsubscription10_small")
    
    var iconCheckSubscription15 = UIImage(named:"iconsubscription15_large")
    var iconUncheckSubscription15 = UIImage(named:"iconsubscription15_small")
    
    var iconCheckSubscription20 = UIImage(named:"iconsubscription20_large")
    var iconUncheckSubscription20 = UIImage(named:"iconsubscription20_small")
    
    var oneNumber = UIImage(named:"1")
    var unCheckoneNumber = UIImage(named:"un1")
    var fiveNumber = UIImage(named:"5")
    var unCheckFiveNumber = UIImage(named:"un5")
    var tenNumber = UIImage(named:"10")
    var unCheckTenNumber = UIImage(named:"un10")
    var fiftenNumber = UIImage(named:"15")
    var unCheckFiftenNumber = UIImage(named:"un15")
    var twentyNumber = UIImage(named:"20")
    var unChechtwentyNumber = UIImage(named:"un20")
    var jsonArray:NSMutableArray?
    var newArray: Array<String> = []
    var priceCount : Int = 0
    var finalAmount : Int = 0
    var quantityCheckValiue : Int = 0
    var vegString:String = "12"
    var nonVegString:String = "13"
    var breakefastString:String = "16"
    var launchString:String = "17"
    var snacksString:String = "18"
    var dinnerString:String = "19"
    var regularString:String = "14"
    var premiumString:String = "15"
    var subscribeString:String = ""
    var mealString:String = ""
    
    var dietString:String = ""
    var checkBreakFastString :String = ""
    var checkLunchString :String = ""
    var checkSnackString :String = ""
    var checkDinnerString :String = ""
    var selectedBreakFastPrice : Int = 0
    var selectedLunchFastPrice : Int = 0
    var selectedSnacksFastPrice : Int = 0
    var selectedDinnerFastPrice : Int = 0
    var selectedTotalPrice : Int = 0
    var premiumTotalPrice : Int = 0
    var premiumBreakFastlPrice : Int = 0
    var premiumLunchPrice : Int = 0
    var premiumSnacksPrice : Int = 0
    var premiumDinnerPrice : Int = 0
    var unselectedBreakFastPrice : Int = 0
    var unselectedLunchFastPrice : Int = 0
    var unselectedSnacksFastPrice : Int = 0
    var unselectedDinnerFastPrice : Int = 0
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    var quntityString:String = ""
     var totalArray = [[String:Any]]()
    
  var apiBreakFastString : String = ""
    var apiLunchString : String = ""
    var apiSnacksString : String = ""
    var apiDinnerString : String = ""
    
    
   
    var theme = MyTheme.dark
    override func viewDidLoad() {
        super.viewDidLoad()
        

       // callingForAllProductsAPI()
        callingWebServicesAllProductURL()
       // self.mainCalender.backgroundColor = .clear
        self.mainCalender.isHidden = true
       // self.removeAnimate()
       // self.view.removeFromSuperview()
//        oneNumberButtonOutLet.isSelected = true
//        oneNumberButtonOutLet.setImage(iconUncheckSubscription1,for:UIControlState.normal)
//        fifteenNumberButtonOutLet.setImage(iconUncheckSubscription5,for:UIControlState.normal)
//        tenNumberButtonOutLet.setImage(iconUncheckSubscription10,for:UIControlState.normal)
//        fiveNumberButtonOutLet.setImage(iconUncheckSubscription15,for:UIControlState.normal)
//        twentyNumberButtonOutLet.setImage(iconUncheckSubscription20,for:UIControlState.normal)
//        fiveNumberButtonOutLet.isSelected = false
//        fifteenNumberButtonOutLet.isSelected = false
//        tenNumberButtonOutLet.isSelected = false
//        twentyNumberButtonOutLet.isSelected = false
         self.quantityCheckValiue = 1

    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        calenderView.myCollectionView.collectionViewLayout.invalidateLayout()
    }
    @objc func rightBarBtnAction(sender: UIBarButtonItem) {
        if theme == .dark {
            sender.title = "Dark"
            theme = .light
            Style.themeLight()
        } else {
            sender.title = "Light"
            theme = .dark
            Style.themeDark()
        }
        self.view.backgroundColor=Style.bgColor
        calenderView.changeTheme()
    }
    let calenderView: CalenderView = {
        let v=CalenderView(theme: MyTheme.dark)
        v.translatesAutoresizingMaskIntoConstraints=false
        return v
    }()
    func showAnimate()
    {
        
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            
        });
        
        self.title = AppName
        self.navigationController?.navigationBar.isTranslucent=false
        self.view.backgroundColor=Style.bgColor
        
        view.addSubview(calenderView)
        calenderView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive=true
        calenderView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive=true
        calenderView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive=true
        calenderView.heightAnchor.constraint(equalToConstant: 365).isActive=true
        
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
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

    func callingWebServicesAllProductURL()
    {
        
        let spiningAcitivity = MBProgressHUD.showAdded(to: view, animated: true)
        spiningAcitivity.label.text = "Loading...!"
        
        let oauthswift = OAuth1Swift(
            consumerKey:"102af6d54e9f90dc9d661f933494ca54",
            consumerSecret:"5330043049ef7da7563d60e68a32738c"
        )
        oauthswift.client.credential.oauthToken = "ce8d2d3a2a8e96e6270a4a88a3fcf85c"
        oauthswift.client.credential.oauthTokenSecret = "01d0070ebce508e2cb904746dceba4b4"
        oauthswift.client.get(allProducts_URL, success: { responce in
            print("success")
            print("language name: \(responce)")
            print(responce.request as Any)
            print(responce.response as Any)
            print(responce.data as Any)
            print("\(responce)")
            let dataString = responce.string
            print(dataString)
            let dict = self.convertToDictionary(text: dataString!)
            let d = dict![0]
            let arr = d["data"] as! Dictionary<String,Any>
            self.totalArray =  [d["data"] as![String:Any]]
            print(self.totalArray)
            print(arr.count)
            for var dict1 in arr{
     
              MBProgressHUD.hideAllHUDs(for:self.view, animated: true)
            }
      
        }, failure: { error in
            print(error)
            
        })
        
    }
            
        func convertToDictionary(text: String) -> [Dictionary<String,Any>]? {
            if let data = text.data(using: .utf8) {
                do {
                    return try JSONSerialization.jsonObject(with: data, options: []) as? [Dictionary<String,Any>]
                } catch {
                    print(error.localizedDescription)
                }
            }
            return nil
        }

    @IBAction func onClickedBreakeFastButtonClicked(_ sender: Any)
    {
    }
    
    @IBAction func onClickedLaunchButtonClicked(_ sender: Any)
    {
       // myLaunchButtonTapped()
    }
    
    @IBAction func onClickedSnacksButtonClicked(_ sender: Any)
    {
      //  mySnacksButtonTapped()
    }
       @IBAction func onClickedDinnerButtonClicked(_ sender: Any)
    {
        //myDinnerButtonTapped()
    }
    
    func myBreakfastButtonTapped(){
        
    }
    func myLaunchButtonTapped(){
        if  launchOutLet.isSelected == true {
            launchOutLet.isSelected = false
            launchOutLet.setImage(unCheckBox1,for:UIControlState.normal)
            
        }else {
            launchOutLet.isSelected = true
            launchOutLet.setImage(checkBox1,for:UIControlState.normal)
        }
    }
    func mySnacksButtonTapped(){

    }
    func myDinnerButtonTapped(){
        if  dinnerOutLet.isSelected == true {
            dinnerOutLet.isSelected = false
            dinnerOutLet.setImage(unCheckBox1,for:UIControlState.normal)
            
        }else {
            dinnerOutLet.isSelected = true
            dinnerOutLet.setImage(checkBox1,for:UIControlState.normal)
        }
    }
    @IBAction func onClickedBackButtonPressed(_ sender: Any)
    {
        goBack()
    }
    func goBack()
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickedBreakeFastButtonPressed(_ sender: Any) {
        print("BreakFast")
        if self.dietString == ""
        {
            self.displayAlertMessage(messageToDisplay: "Please select Meal Category")
        }
        else if self.subscribeString  == ""
        {
            self.displayAlertMessage(messageToDisplay: "Please Choose Subscription Type")

        }
        else
        {
                if  breakeFastOutLet.isSelected == true {
                breakeFastOutLet.isSelected = false
                breakeFastOutLet.setImage(unCheckBox1,for:UIControlState.normal)
                self.unselectedBreakFastPrice = 1
                self.checkBreakFastString = "16"
                    self.apiBreakFastString = ""
        for (index,var dict) in self.totalArray.enumerated()
        {
            for var dictionary in dict{
                let dictkey = dictionary.key
                let dictValue = dictionary.value
                let subscriptionTypeString = (dictValue as! NSDictionary).value(forKey: "subscription_type") as? String
                            let dietTypeString = (dictValue as! NSDictionary).value(forKey: "diet_type") as? String
                            let mealTypeString = (dictValue as! NSDictionary).value(forKey: "meal_type") as? String
                
               
                    if self.dietString == dietTypeString
                    {
                        if self.subscribeString == subscriptionTypeString
                        {
                            if checkBreakFastString == mealTypeString
                            {
                                
                                let priceString =  (dictValue as! NSDictionary).value(forKey: "price") as? String
                                let dummystr = "\(priceString!)"
                                print(dummystr)
                                var myInt2 = (dummystr as NSString).integerValue
                                print(myInt2)
                                selectedBreakFastPrice = 0
                                if selectedTotalPrice > 0
                                {
                                    self.totalValue( value : self.quantityCheckValiue)
                                    
                                }
                                   else if self.quantityCheckValiue > 0
                                    {
                                         self.totalValue( value : self.quantityCheckValiue)
//                                        myInt2 = myInt2 * self.quantityCheckValiue
//                                        finalAmount = finalAmount - myInt2
//                                        print(finalAmount)
//                                        priceCount = finalAmount
//                                        self.priceLabelOutLet.text = "\(finalAmount)"
                                    }

                            }
                        }
                    }
                    
                 }
                }
            }
                else {
                breakeFastOutLet.isSelected = true
                breakeFastOutLet.setImage(checkBox1,for:UIControlState.normal)
                self.unselectedBreakFastPrice = 16

                self.checkBreakFastString = "16"
                    self.apiBreakFastString = "16"
                for (index,var dict) in self.totalArray.enumerated()
                {
                    for var dictionary in dict{
                        let dictkey = dictionary.key
                        let dictValue = dictionary.value
                        let subscriptionTypeString = (dictValue as! NSDictionary).value(forKey: "subscription_type") as? String
                        let dietTypeString = (dictValue as! NSDictionary).value(forKey: "diet_type") as? String
                        let mealTypeString = (dictValue as! NSDictionary).value(forKey: "meal_type") as? String

                   
                    if self.dietString == dietTypeString
                    {
                        if self.subscribeString == subscriptionTypeString
                        {
                            if checkBreakFastString == mealTypeString
                            {
                                let priceString =  (dictValue as! NSDictionary).value(forKey: "price") as? String
                                let dummystr = "\(priceString!)"
                                print(dummystr)
                                var myInt2 = (dummystr as NSString).integerValue
                                print(myInt2)
                                selectedBreakFastPrice = myInt2
                                if selectedTotalPrice > 0
                                {
                                    self.totalValue( value : self.quantityCheckValiue)
                                    
                                }
                                    else if self.quantityCheckValiue > 0
                                    {
                                        self.totalValue( value : self.quantityCheckValiue)
//                                        myInt2 = myInt2 * self.quantityCheckValiue
//                                        finalAmount = finalAmount + myInt2
//                                        priceCount = finalAmount
//                                        self.priceLabelOutLet.text = "\(finalAmount)"
                                    }
                            }
                        }
                    }
                }
                
            }
            }
            print(index)

        }
    }


    @IBAction func onClickedLaunchButtonPressed(_ sender: Any) {
        print("Launch")
        
        
        if self.dietString == ""
        {
            self.displayAlertMessage(messageToDisplay: "Please select Meal Category")
        }
        else if self.subscribeString  == ""
        {
            self.displayAlertMessage(messageToDisplay: "Please Choose Subscription Type")
            
        }
        else
        {
            
            if  launchOutLet.isSelected == true {
                launchOutLet.isSelected = false
                launchOutLet.setImage(unCheckBox1,for:UIControlState.normal)
                self.unselectedLunchFastPrice = 1

                self.checkLunchString = "17"
                self.apiLunchString = ""
            
            for (index,var dict) in self.totalArray.enumerated()
            {
                print(dict)
                for var dictionary in dict{
                    print(dictionary)
                    let dictkey = dictionary.key
                    let dictValue = dictionary.value
                    print(dictValue)
                    
                    let subscriptionTypeString = (dictValue as! NSDictionary).value(forKey: "subscription_type") as? String
                    let dietTypeString = (dictValue as! NSDictionary).value(forKey: "diet_type") as? String
                    let mealTypeString = (dictValue as! NSDictionary).value(forKey: "meal_type") as? String
                    if self.dietString == dietTypeString
                    {
                        if self.subscribeString == subscriptionTypeString
                        {
                            if checkLunchString == mealTypeString
                            {
                                let priceString =  (dictValue as! NSDictionary).value(forKey: "price") as? String
                                let dummystr = "\(priceString!)"
                                print(dummystr)
                                var myInt2 = (dummystr as NSString).integerValue
                                print(myInt2)
                               selectedLunchFastPrice = 0
                                if selectedTotalPrice > 0
                                {
                                    self.totalValue( value : self.quantityCheckValiue)

                                }
                                   else if self.quantityCheckValiue > 0
                                    {
                                        self.totalValue( value : self.quantityCheckValiue)
//                                        myInt2 = myInt2 * self.quantityCheckValiue
//                                        finalAmount = finalAmount - myInt2
//                                        print(finalAmount)
//                                        priceCount = finalAmount
//                                        self.priceLabelOutLet.text = "\(finalAmount)"
                                    }
                    
                            }
                        }
                    }
                }
                print(index)
                
            }
          }
            else
            {
                
                launchOutLet.isSelected = true
                launchOutLet.setImage(checkBox1,for:UIControlState.normal)
                self.unselectedLunchFastPrice = 17

                self.checkLunchString = "17"
                self.apiLunchString = "17"
                    
                    for (index,var dict) in self.totalArray.enumerated()
                    {
                        print(dict)
                        for var dictionary in dict{
                            print(dictionary)
                            let dictkey = dictionary.key
                            let dictValue = dictionary.value
                            print(dictValue)
                            
                            let subscriptionTypeString = (dictValue as! NSDictionary).value(forKey: "subscription_type") as? String
                            let dietTypeString = (dictValue as! NSDictionary).value(forKey: "diet_type") as? String
                            let mealTypeString = (dictValue as! NSDictionary).value(forKey: "meal_type") as? String
                            if self.dietString == dietTypeString
                            {
                                if self.subscribeString == subscriptionTypeString
                                {
                                    if checkLunchString == mealTypeString
                                    {
                                        let priceString =  (dictValue as! NSDictionary).value(forKey: "price") as? String
                                        let dummystr = "\(priceString!)"
                                        print(dummystr)
                                        var myInt2 = (dummystr as NSString).integerValue
                                        print(myInt2)
                                        selectedLunchFastPrice = myInt2
                                       // if selectedTotalPrice > 0
                                        //{
                                            self.totalValue( value : self.quantityCheckValiue)
                                            
                                        //}

//                                           else if self.quantityCheckValiue > 0
//                                            {
//                                                myInt2 = myInt2 * self.quantityCheckValiue
//                                                finalAmount = finalAmount + myInt2
//                                                priceCount = finalAmount
//                                                self.priceLabelOutLet.text = "\(finalAmount)"
//                                            }
//
                                    }
                                }
                            }
                        }
                        print(index)
                        
                    }
                }
                
            }
        
   
    }

    @IBAction func onClickedSnacksButtonPressed(_ sender: Any) {
        print("Snacks")
        
        if self.dietString == ""
        {
            self.displayAlertMessage(messageToDisplay: "Please select meal Category")
        }
        else if self.subscribeString  == ""
        {
            self.displayAlertMessage(messageToDisplay: "Please Choose Subscription Type")
            
        }
        else
        {
            //mySnacksButtonTapped()
            
            if  snackOutLet.isSelected == true {
                snackOutLet.isSelected = false
                snackOutLet.setImage(unCheckBox1,for:UIControlState.normal)
                self.unselectedSnacksFastPrice = 1
                self.checkSnackString = "18"
                self.apiSnacksString = ""
                for (index,var dict) in self.totalArray.enumerated()
                {
                    print(dict)
                    for var dictionary in dict{
                        print(dictionary)
                        let dictkey = dictionary.key
                        let dictValue = dictionary.value
                        print(dictValue)
                        
                        let subscriptionTypeString = (dictValue as! NSDictionary).value(forKey: "subscription_type") as? String
                        let dietTypeString = (dictValue as! NSDictionary).value(forKey: "diet_type") as? String
                        let mealTypeString = (dictValue as! NSDictionary).value(forKey: "meal_type") as? String
                        if self.dietString == dietTypeString
                        {
                            if self.subscribeString == subscriptionTypeString
                            {
                                if checkSnackString == mealTypeString
                                {
                                    let priceString =  (dictValue as! NSDictionary).value(forKey: "price") as? String
                                    let dummystr = "\(priceString!)"
                                    print(dummystr)
                                    
                                    var myInt2 = (dummystr as NSString).integerValue
                                    print(myInt2)
                                  selectedSnacksFastPrice = 0
                                     self.totalValue( value : self.quantityCheckValiue)
//                                    if selectedTotalPrice > 0
//                                    {
//                                        self.totalValue( value : self.quantityCheckValiue)
//
//                                    }
//
//                                      else  if self.quantityCheckValiue > 0
//                                        {
//
//                                            myInt2 = myInt2 * self.quantityCheckValiue
//                                            finalAmount = finalAmount - myInt2
//                                            print(finalAmount)
//                                            priceCount = finalAmount
//                                            self.priceLabelOutLet.text = "\(finalAmount)"
//                                        }
                                    
                                        
                                    
                                    
                                }
                            }
                        }
                    }
                    print(index)
                    
                }
                
            }else {
                snackOutLet.isSelected = true
                snackOutLet.setImage(checkBox1,for:UIControlState.normal)
                self.checkSnackString = "18"
                self.unselectedSnacksFastPrice = 18
                self.apiSnacksString = "18"

                for (index,var dict) in self.totalArray.enumerated()
                {
                    print(dict)
                    for var dictionary in dict{
                        print(dictionary)
                        let dictkey = dictionary.key
                        let dictValue = dictionary.value
                        print(dictValue)
                        
                        let subscriptionTypeString = (dictValue as! NSDictionary).value(forKey: "subscription_type") as? String
                        let dietTypeString = (dictValue as! NSDictionary).value(forKey: "diet_type") as? String
                        let mealTypeString = (dictValue as! NSDictionary).value(forKey: "meal_type") as? String
                        if self.dietString == dietTypeString
                        {
                            if self.subscribeString == subscriptionTypeString
                            {
                                if checkSnackString == mealTypeString
                                {
                                    let priceString =  (dictValue as! NSDictionary).value(forKey: "price") as? String
                                    let dummystr = "\(priceString!)"
                                    print(dummystr)
                                    
                                    var myInt2 = (dummystr as NSString).integerValue
                                    print(myInt2)
                                  selectedSnacksFastPrice = myInt2
                                     self.totalValue( value : self.quantityCheckValiue)

                                
                                }
                            }
                        }
                    }
                    print(index)
                    
                }
            }
            
        }
        
    }
    
    
    @IBAction func onClickedDinnerButtonPressed(_ sender: Any) {
        print("Dinner")
    
        if self.dietString == ""
        {
            self.displayAlertMessage(messageToDisplay: "Please select Meal Category")
        }
        else if self.subscribeString  == ""
        {
            self.displayAlertMessage(messageToDisplay: "Please Choose Subscription Type")
            
        }
        else
        {
           // myDinnerButtonTapped()
            
            //let checkDinnerString :String = "18"
            self.checkDinnerString = "19"
            if  dinnerOutLet.isSelected == true {
                dinnerOutLet.isSelected = false
                dinnerOutLet.setImage(unCheckBox1,for:UIControlState.normal)
                self.apiDinnerString = ""
                for (index,var dict) in self.totalArray.enumerated()
                {
                    print(dict)
                    for var dictionary in dict{
                        print(dictionary)
                        let dictkey = dictionary.key
                        let dictValue = dictionary.value
                        print(dictValue)
                    self.unselectedDinnerFastPrice = 1

                        let subscriptionTypeString = (dictValue as! NSDictionary).value(forKey: "subscription_type") as? String
                        let dietTypeString = (dictValue as! NSDictionary).value(forKey: "diet_type") as? String
                        let mealTypeString = (dictValue as! NSDictionary).value(forKey: "meal_type") as? String
                        if self.dietString == dietTypeString
                        {
                            if self.subscribeString == subscriptionTypeString
                            {
                                if checkDinnerString == mealTypeString
                                {
                                    let priceString =  (dictValue as! NSDictionary).value(forKey: "price") as? String
                                    let dummystr = "\(priceString!)"
                                    print(dummystr)
                                   
                                    var myInt2 = (dummystr as NSString).integerValue
                                    print(myInt2)
                                 selectedDinnerFastPrice = 0
                                     self.totalValue( value : self.quantityCheckValiue)

                                    print(priceCount)
                                }
                            }
                        }
                    }
                    print(index)
                    
                }
                
            }else {
                dinnerOutLet.isSelected = true
                dinnerOutLet.setImage(checkBox1,for:UIControlState.normal)
                for (index,var dict) in self.totalArray.enumerated()
                {
                    print(dict)
                    for var dictionary in dict{
                        print(dictionary)
                        let dictkey = dictionary.key
                        let dictValue = dictionary.value
                        print(dictValue)
                        self.unselectedDinnerFastPrice = 19
                        self.apiDinnerString = "19"
                        
                        let subscriptionTypeString = (dictValue as! NSDictionary).value(forKey: "subscription_type") as? String
                        let dietTypeString = (dictValue as! NSDictionary).value(forKey: "diet_type") as? String
                        let mealTypeString = (dictValue as! NSDictionary).value(forKey: "meal_type") as? String
                        if self.dietString == dietTypeString
                        {
                            if self.subscribeString == subscriptionTypeString
                            {
                                if checkDinnerString == mealTypeString
                                {
                                    let priceString =  (dictValue as! NSDictionary).value(forKey: "price") as? String
                                    let dummystr = "\(priceString!)"
                                    print(dummystr)
                                  
                                    var myInt2 = (dummystr as NSString).integerValue
                                    print(myInt2)
                                    selectedDinnerFastPrice = myInt2
                                     self.totalValue( value : self.quantityCheckValiue)
//                                    if selectedTotalPrice > 0
//                                    {
//                                        self.totalValue( value : self.quantityCheckValiue)
//
//                                    }
//
//                                      else  if self.quantityCheckValiue > 0
//                                        {
//                                            myInt2 = myInt2 * self.quantityCheckValiue
//                                            finalAmount = finalAmount + myInt2
//                                            priceCount = finalAmount
//                                            self.priceLabelOutLet.text = "\(finalAmount)"
//                                        }
                            
                                }
                            }
                        }
                    }
                    print(index)
                    
                }
            }
  
        }
     
    }
    

    
    
    
    func totalValue( value : Int)
    {
        if self.subscribeString == "14"
        {
            self.checkiingPremium()
        }
//        {
//        print(value)
//        selectedTotalPrice = 0
//        if selectedBreakFastPrice > 0
//        {
//            selectedTotalPrice = selectedTotalPrice + selectedBreakFastPrice
//
//        }
//        if selectedLunchFastPrice > 0
//        {
//            selectedTotalPrice = selectedTotalPrice + selectedLunchFastPrice
//
//        }
//        if selectedSnacksFastPrice > 0
//        {
//            selectedTotalPrice = selectedTotalPrice + selectedSnacksFastPrice
//
//        }
//        if selectedDinnerFastPrice > 0
//        {
//            selectedTotalPrice = selectedTotalPrice + selectedDinnerFastPrice
//
//        }
//        priceCount = 0
//        priceCount = selectedTotalPrice * value
//
//
//        self.priceLabelOutLet.text = "\(priceCount)"
//        print(finalAmount)
//        }
        else if self.subscribeString == "15"
        {
            
            self.checkiingPremium()
        }
    }
    func checkiingPremium()
    {
       // print(value)
        selectedTotalPrice = 0
        premiumTotalPrice = 0
        for (index,var dict) in self.totalArray.enumerated()
        {
            print(dict)
            for var dictionary in dict{
                print(dictionary)
                let dictkey = dictionary.key
                let dictValue = dictionary.value
                print(dictValue)
                
                let subscriptionTypeString = (dictValue as! NSDictionary).value(forKey: "subscription_type") as? String
                let dietTypeString = (dictValue as! NSDictionary).value(forKey: "diet_type") as? String
                let mealTypeString = (dictValue as! NSDictionary).value(forKey: "meal_type") as? String
                if self.dietString == dietTypeString
                {
                    if self.subscribeString == subscriptionTypeString
                    {
                        print("premium")
                        if mealTypeString == "16"
                        {
                            let  premiumTotalPrice1 =  (dictValue as! NSDictionary).value(forKey: "price") as? String
                            premiumBreakFastlPrice = (premiumTotalPrice1 as! NSString).integerValue
                            print(premiumBreakFastlPrice)
                            
                        }
                        else if mealTypeString == "17"
                        {
                            let  premiumTotalPrice1 =  (dictValue as! NSDictionary).value(forKey: "price") as? String
                            premiumLunchPrice = (premiumTotalPrice1 as! NSString).integerValue
                            print(premiumLunchPrice)
                        }
                        else if mealTypeString == "18"
                        {
                            let  premiumTotalPrice1 =  (dictValue as! NSDictionary).value(forKey: "price") as? String
                            premiumSnacksPrice = (premiumTotalPrice1 as! NSString).integerValue
                            print(premiumSnacksPrice)
                        }
                        else if mealTypeString == "19"
                        {
                            let  premiumTotalPrice1 =  (dictValue as! NSDictionary).value(forKey: "price") as? String
                            premiumDinnerPrice = (premiumTotalPrice1 as! NSString).integerValue
                            print(premiumDinnerPrice)
                        }
                 
                    }
                }
                
            }
        }
         if unselectedSnacksFastPrice == 18
         {
        if  snackOutLet.isSelected == true
        {
            premiumTotalPrice = premiumTotalPrice + premiumSnacksPrice
        }
        }

        if unselectedBreakFastPrice == 16
        {
        if  breakeFastOutLet.isSelected == true
        {
            premiumTotalPrice = premiumTotalPrice + premiumBreakFastlPrice
        }
        }

        if unselectedLunchFastPrice == 17
        {
         if  launchOutLet.isSelected == true
        {
            premiumTotalPrice = premiumTotalPrice + premiumLunchPrice
        }
        }

        if unselectedDinnerFastPrice == 19
        {
         if  dinnerOutLet.isSelected == true
        {
            premiumTotalPrice = premiumTotalPrice + premiumDinnerPrice
        }
        }

        selectedBreakFastPrice = premiumTotalPrice * self.quantityCheckValiue
        self.priceLabelOutLet.text = "\(selectedBreakFastPrice)"
    }
 
    @IBAction func onClickedQty1ButtonPressed(_ sender: Any) {
        print("Qtr 1 Pressed")
       
            self.quntityString = "1"
            oneNumberButtonOutLet.isSelected = true
            oneNumberButtonOutLet.setImage(iconCheckSubscription1,for:UIControlState.normal)
            fifteenNumberButtonOutLet.setImage(iconUncheckSubscription15,for:UIControlState.normal)
            tenNumberButtonOutLet.setImage(iconUncheckSubscription10,for:UIControlState.normal)
            fiveNumberButtonOutLet.setImage(iconUncheckSubscription5,for:UIControlState.normal)
            twentyNumberButtonOutLet.setImage(iconUncheckSubscription20,for:UIControlState.normal)
            fiveNumberButtonOutLet.isSelected = false
            fifteenNumberButtonOutLet.isSelected = false
            tenNumberButtonOutLet.isSelected = false
            twentyNumberButtonOutLet.isSelected = false
            self.quntityString = "1"
            self.quantityCheckValiue = 1
            self.totalValue( value : self.quantityCheckValiue)
        
    }
    
    @IBAction func onClickedQty5ButtonPressed(_ sender: Any) {
        print("Qtr 5 Pressed")
        fiveNumberButtonOutLet.isSelected = true
        fiveNumberButtonOutLet.setImage(iconCheckSubscription5,for:UIControlState.normal)
        fifteenNumberButtonOutLet.setImage(iconUncheckSubscription15,for:UIControlState.normal)
        tenNumberButtonOutLet.setImage(iconUncheckSubscription10,for:UIControlState.normal)
        oneNumberButtonOutLet.setImage(iconUncheckSubscription1,for:UIControlState.normal)
        twentyNumberButtonOutLet.setImage(iconUncheckSubscription20,for:UIControlState.normal)
        oneNumberButtonOutLet.isSelected = false
        fifteenNumberButtonOutLet.isSelected = false
        tenNumberButtonOutLet.isSelected = false
        twentyNumberButtonOutLet.isSelected = false
        self.quntityString = "5"
        self.quantityCheckValiue = 5
        self.totalValue( value : self.quantityCheckValiue)
 
    }
    
    
    @IBAction func onClickedQty10ButtonPressed(_ sender: Any) {
        print("Qtr 10 Pressed")
       
        self.quntityString = "10"
       
        print(finalAmount)
      
        tenNumberButtonOutLet.isSelected = true
        tenNumberButtonOutLet.setImage(iconCheckSubscription10,for:UIControlState.normal)
        fifteenNumberButtonOutLet.setImage(iconUncheckSubscription15,for:UIControlState.normal)
        oneNumberButtonOutLet.setImage(iconUncheckSubscription1,for:UIControlState.normal)
        fiveNumberButtonOutLet.setImage(iconUncheckSubscription5,for:UIControlState.normal)
        twentyNumberButtonOutLet.setImage(iconUncheckSubscription20,for:UIControlState.normal)
        fiveNumberButtonOutLet.isSelected = false
        fifteenNumberButtonOutLet.isSelected = false
        oneNumberButtonOutLet.isSelected = false
        twentyNumberButtonOutLet.isSelected = false
        finalAmount = priceCount
        self.quntityString = "10"
        self.quantityCheckValiue = 10
        self.totalValue( value : self.quantityCheckValiue)
  
    }
 
    @IBAction func onClickedQty15ButtonPressed(_ sender: Any) {
        print("Qtr 15 Pressed")
        self.quntityString = "15"
        
        fifteenNumberButtonOutLet.isSelected = true
        fifteenNumberButtonOutLet.setImage(iconCheckSubscription15,for:UIControlState.normal)
        oneNumberButtonOutLet.setImage(iconUncheckSubscription1,for:UIControlState.normal)
        tenNumberButtonOutLet.setImage(iconUncheckSubscription10,for:UIControlState.normal)
        fiveNumberButtonOutLet.setImage(iconUncheckSubscription5,for:UIControlState.normal)
        twentyNumberButtonOutLet.setImage(iconUncheckSubscription20,for:UIControlState.normal)
        fiveNumberButtonOutLet.isSelected = false
        oneNumberButtonOutLet.isSelected = false
        tenNumberButtonOutLet.isSelected = false
        twentyNumberButtonOutLet.isSelected = false
        finalAmount = priceCount
        self.quntityString = "15"
        self.quantityCheckValiue = 15
        self.totalValue( value : self.quantityCheckValiue)
 
    }
 
    @IBAction func onClickedQty20ButtonPressed(_ sender: Any) {
        print("Qtr 20 Pressed")
            self.quntityString = "20"
        
            twentyNumberButtonOutLet.isSelected = true
            twentyNumberButtonOutLet.setImage(iconCheckSubscription20,for:UIControlState.normal)
            fifteenNumberButtonOutLet.setImage(iconUncheckSubscription15,for:UIControlState.normal)
            tenNumberButtonOutLet.setImage(iconUncheckSubscription10,for:UIControlState.normal)
            fiveNumberButtonOutLet.setImage(iconUncheckSubscription5,for:UIControlState.normal)
            oneNumberButtonOutLet.setImage(iconUncheckSubscription1,for:UIControlState.normal)
            fiveNumberButtonOutLet.isSelected = false
            fifteenNumberButtonOutLet.isSelected = false
            tenNumberButtonOutLet.isSelected = false
            oneNumberButtonOutLet.isSelected = false
            self.quntityString = "20"
            self.quantityCheckValiue = 20
            self.totalValue( value : self.quantityCheckValiue)
        
    }
    @IBAction func onClickedVegAndNonVegButtonPressed(_ sender: DLRadioButton) {
        
        if sender.tag == 1
        {
            print("Veg")
            self.dietString = "13"
            self.totalValue( value : self.quantityCheckValiue)
            
        }
        else
        {
            self.dietString = "12"
            self.totalValue( value : self.quantityCheckValiue)
            print("Non-Veg")
        }
        
    }
    
    @IBAction func onClickedRegularButtonPressed(_ sender: DLRadioButton) {
        
        if sender.tag == 3
        {
            self.subscribeString = "14"
            
            self.totalValue( value : self.quantityCheckValiue)
            print("Regular")
        }else{
            self.subscribeString = "15"
           
            self.totalValue( value : self.quantityCheckValiue)
            print("Premium")
        }
    }
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated) // No need for semicolon
        self.mainCalender.isHidden = true
        self.calenderView.isHidden = true
        
    }
    @IBAction func onClickedProceedButtonPressed(_ sender: Any) {
      
        if self.priceLabelOutLet.text == "0"
        {
           self.displayAlertMessage(messageToDisplay: "please select Meal types")
            
        }
        else{
            //self.showPopUpButton()
            self.popUpForCalenderView()
            self.mainCalender.isHidden = false
             self.calenderView.isHidden = false
//            let MenuViewController = self.storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
//            self.navigationController?.pushViewController(MenuViewController, animated: true)
        }
}
    func displayAlertMessage(messageToDisplay: String)
    {
        let alertController = UIAlertController(title: AppName, message: messageToDisplay, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
        print("Ok button tapped");
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion:nil)
    }
    
    func showPopUpButton()
    {
//        let CalenderViewController = self.storyboard?.instantiateViewController(withIdentifier: "CalenderViewController") as! CalenderViewController
//        self.navigationController?.pushViewController(CalenderViewController, animated: true)
//
//        self.addChildViewController(CalenderViewController)
//        // CalenderViewController.view.frame = self.view.frame
//        self.view.addSubview(CalenderViewController.view)
//
//        CalenderViewController.didMove(toParentViewController: self)
//        print(CalenderViewController)
        
    }
    func popUpForCalenderView()
    {
        self.mainCalender.backgroundColor = UIColor.clear.withAlphaComponent(0.8)
        self.showAnimate()
        self.mainCalender.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        subCalenderView.layer.cornerRadius = 5
       // cancelButtonOutLet.layer.cornerRadius = 5
        //selectedButtonOutLet.layer.cornerRadius = 5
    }
 
}
