//
//  MenuViewController.swift
//  FreshServ
//
//  Created by IOSUSER on 2/27/18.
//  Copyright © 2018 IOSUSER. All rights reserved.
//

import UIKit
import OAuthSwiftAlamofire
import OAuthSwift
import Alamofire

class MenuViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    @IBOutlet var monthAndWeekOutLet: UICollectionView!
    @IBOutlet var monthsOutLet: UILabel!
    @IBOutlet var dinnerButtonOutLet: UIButton!
    @IBOutlet var snacksButtonOutLet: UIButton!
    @IBOutlet var lunchButtonOutLet: UIButton!
    @IBOutlet var breakeFastOutLet: UIButton!
    @IBOutlet var menuCollectionViewOutLet: UICollectionView!
    let appdelegate = UIApplication.shared.delegate as! AppDelegate

    var mainMenu:[String] = []
    var weekNamesArray:[String] = []
    var weekNamesDisplayArray:[String] = []
    var responceArray:[String] = []

    var weeksArray:[String] = []
    var apiMenuParams:[String:AnyObject] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
        //mainMenu = ["h","h", "h","h","h", "h","h","h", "h"]
        appdelegate.selectedString = ""
        
        callWebSerevicesMealCollection()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        if collectionView == self.monthAndWeekOutLet {
            return mainMenu.count
        }
        
        return mainMenu.count
    }
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        if collectionView == self.menuCollectionViewOutLet
        {
            let cellA = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! MenuCollectionViewCell
            cellA.menuImageViewOutLet.image = UIImage(named:mainMenu[indexPath.row])
            return cellA
        }
        else
        {
            let cellB = collectionView.dequeueReusableCell(withReuseIdentifier: "monthCell", for: indexPath) as! MonthAndDateCollectionViewCell
            //cellB.imageViewCell.image = UIImage(named:mainMenu[indexPath.row])
            let dateStr = mainMenu[indexPath.row]
            let weekStr = weekNamesDisplayArray[indexPath.row]
            cellB.weekNameLabel.setTitle(weekStr, for: .normal)
            cellB.dateLabel.setTitle(dateStr, for: .normal)
            
            return cellB
        }
        
        

    }

    @IBAction func onClickedBreakefastButtonPressed(_ sender: Any) {
        monthsOutLet.backgroundColor = UIColor.gray
        
    }
    
    
    @IBAction func onClickedLunchButtonPressed(_ sender: Any) {
         monthsOutLet.backgroundColor = UIColor.red
    }
    
    
    @IBAction func onClickedSnacksButtonPressed(_ sender: Any) {
         monthsOutLet.backgroundColor = UIColor.yellow
    }
    
    
    @IBAction func onClickedDinnerButtonPressed(_ sender: Any) {
         monthsOutLet.backgroundColor = UIColor.green
    }
    
    
    @IBAction func onClickedProceedButtonPressed(_ sender: Any) {
        
        let OrderSummaryViewController = self.storyboard?.instantiateViewController(withIdentifier: "OrderSummaryViewController") as! OrderSummaryViewController
        self.navigationController?.pushViewController(OrderSummaryViewController, animated: true)
    }
    
    
    @IBAction func onClickedBackButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func callWebSerevicesMealCollection()
    {
        let oauthswift = OAuth1Swift(
            consumerKey:"102af6d54e9f90dc9d661f933494ca54",
            consumerSecret:"5330043049ef7da7563d60e68a32738c"
        )
        oauthswift.client.credential.oauthToken = "ce8d2d3a2a8e96e6270a4a88a3fcf85c"
        oauthswift.client.credential.oauthTokenSecret = "01d0070ebce508e2cb904746dceba4b4"
        //********
        print(apiMenuParams)
         let dietString = (apiMenuParams as NSDictionary).value(forKey: "DIET") as? String
         let subscritionString = (apiMenuParams as NSDictionary).value(forKey: "SUBSCRIPTION") as? String
        
        let quntityString = (apiMenuParams as NSDictionary).value(forKey: "QUANTITY") as? AnyObject
         let breakFastString = (apiMenuParams as NSDictionary).value(forKey: "BREAKFAST") as? String
         let lunchString = (apiMenuParams as NSDictionary).value(forKey: "LUNCH") as? String
        let snacksString = (apiMenuParams as NSDictionary).value(forKey: "SNACKS") as? String
         let dinnerString = (apiMenuParams as NSDictionary).value(forKey: "DINNER") as? String
         //let dinnerString = (apiMenuParams as NSDictionary).value(forKey: "SUBSCRIPTION") as? String
        // apiMenuParams["QUANTITY"] as! String
        let myInt  = Int(quntityString! as! NSNumber)
        let intVal : Int = myInt
        
        var formatStringg : String = ""
        var endDate : String = ""
        
       
        if intVal > 0
        {
            var dateStr          = appdelegate.selectedDateString
            let userheader_fullNameArrray = dateStr.components(separatedBy: "-")
            var dd    = userheader_fullNameArrray[0]
            let mm = userheader_fullNameArrray[1]
            let yyyy = userheader_fullNameArrray[2]
            if dd.characters.count == 1 {
                dd  = "0"+dd
               // dateString = "\(day)-\(monthName1)-\(year) \(hour):\(min):\(seconds)"
            }
             formatStringg  =  yyyy + "-" + mm + "-" + dd
            var formatter        = DateFormatter()
            formatter.dateFormat = "dd-MM-yyyy"
            var currDate         = formatter.date(from: dateStr)
            let userheader_fullNameArr = dateStr.components(separatedBy: "-")
            let user_dateStr    = userheader_fullNameArr[0]
            let userheader_surname = userheader_fullNameArr[1]
             weekNamesArray = ["0","S", "M","T","W", "T","F","S"]
            let weekday1 = getDayOfWeek(today: formatStringg)
            let weekname1 = weekNamesArray[weekday1]
            weekNamesDisplayArray.append(weekname1)
            
            mainMenu.append(user_dateStr)
            print(userheader_surname)
            let myInt = Int(userheader_surname)
            let fmt = DateFormatter()
            fmt.dateFormat = "MM"
            let month = fmt.monthSymbols[myInt! - 1]
            print(month)
            let monthName1 = month.substring(to:3)
            self.monthsOutLet.text = monthName1
            if intVal == 1
            {
                
            }
            else
            {
            for i in 1 ... intVal-1
            {
                var interval = TimeInterval(60 * 60 * 24 * i)
                var newDate = currDate?.addingTimeInterval(interval)
                let df = DateFormatter()
                df.dateFormat = "yyyy-MM-dd hh:mm:ss +zzzz"
                df.locale = Locale.init(identifier: "GMT+0:00")
                var currDate1 = df.string(from: newDate!)
                df.dateFormat = "dd-mm-yyyy"
                print(currDate1)
                let userheader_fullNameArr = currDate1.components(separatedBy: " ")
                endDate    = userheader_fullNameArr[0]
                let weekday = getDayOfWeek(today: endDate)
               
                let weekname = weekNamesArray[weekday]
                weekNamesDisplayArray.append(weekname)
                let userheader_fullNameArr1 = endDate.components(separatedBy: "-")
                let user_dateStr1 = userheader_fullNameArr1[2]
                mainMenu.append(user_dateStr1)
            }
            print(mainMenu)
            print(weekNamesDisplayArray)
            self.monthAndWeekOutLet.reloadData()
            }
        }
        if intVal == 1
        {
            if breakFastString == "16"
            {
                oauthswift.client.get("http://beta.freshserv.com/api/rest/ennovex/meals?customer_type=0&diet_type=\(dietString!)&subscription_type=\(subscritionString!)&meal_type=\(breakFastString!)&start_date=\(formatStringg)&end_date=\(formatStringg)", success: { responce in
                print("success")
                print("language name: \(responce)")
                print(responce.request as Any)
                print(responce.response as Any)
                print(responce.data as Any)
                print("\(responce)")
                let dataString = responce.string
                print(dataString)
                let data = dataString?.data(using: .utf8)
                print(data)
                do {
                    let jsonData = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! NSArray
                    print(jsonData)
                    
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
            else if breakFastString == "17"
            {
                oauthswift.client.get("http://beta.freshserv.com/api/rest/ennovex/meals?customer_type=0&diet_type=\(dietString!)&subscription_type=\(subscritionString!)&meal_type=\(breakFastString!)&start_date=\(formatStringg)&end_date=\(formatStringg)", success: { responce in
                    print("success")
                    print("language name: \(responce)")
                    print(responce.request as Any)
                    print(responce.response as Any)
                    print(responce.data as Any)
                    print("\(responce)")
                    let dataString = responce.string
                    print(dataString)
                    let data = dataString?.data(using: .utf8)
                    print(data)
                    do {
                        let jsonData = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! NSArray
                        print(jsonData)
                        
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
            else if breakFastString == "18"
            {
                oauthswift.client.get("http://beta.freshserv.com/api/rest/ennovex/meals?customer_type=0&diet_type=\(dietString!)&subscription_type=\(subscritionString!)&meal_type=\(breakFastString!)&start_date=\(formatStringg)&end_date=\(formatStringg)", success: { responce in
                    print("success")
                    print("language name: \(responce)")
                    print(responce.request as Any)
                    print(responce.response as Any)
                    print(responce.data as Any)
                    print("\(responce)")
                    let dataString = responce.string
                    print(dataString)
                    let data = dataString?.data(using: .utf8)
                    print(data)
                    do {
                        let jsonData = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! NSArray
                        print(jsonData)
                        
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
            else if breakFastString == "19"
            {
                oauthswift.client.get("http://beta.freshserv.com/api/rest/ennovex/meals?customer_type=0&diet_type=\(dietString!)&subscription_type=\(subscritionString!)&meal_type=\(breakFastString!)&start_date=\(formatStringg)&end_date=\(formatStringg)", success: { responce in
                    print("success")
                    print("language name: \(responce)")
                    print(responce.request as Any)
                    print(responce.response as Any)
                    print(responce.data as Any)
                    print("\(responce)")
                    let dataString = responce.string
                    print(dataString)
                    let data = dataString?.data(using: .utf8)
                    print(data)
                    do {
                        let jsonData = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! NSArray
                        print(jsonData)
                        
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
        else if intVal == 10
        {
            if breakFastString == "16"
            {
                oauthswift.client.get("http://beta.freshserv.com/api/rest/ennovex/meals?customer_type=0&diet_type=\(dietString!)&subscription_type=\(subscritionString!)&meal_type=\(breakFastString!)&start_date=\(formatStringg)&end_date=\(endDate)", success: { responce in
                    print("success")
                    print("language name: \(responce)")
                    print(responce.request as Any)
                    print(responce.response as Any)
                    print(responce.data as Any)
                    print("\(responce)")
                    let dataString = responce.string
                    print(dataString)
                    let data = dataString?.data(using: .utf8)
                    print(data)
                    do {
                        let jsonData = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! Dictionary<String, Any>
                        print(jsonData)
                        if  let myData = jsonData["status"] as! AnyObject?
                        {
                            print(myData)
                            if myData as! String == "success"
                            {
                            self.responceArray = jsonData["data"] as! [String]
                            }
                            
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
        
        
       

    }
   
    func getDayOfWeek(today:String)->Int {
        
        let formatter  = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let todayDate = formatter.date(from: today)!
        let myCalendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
        let myComponents = myCalendar.components(.weekday, from: todayDate)
        let weekDay = myComponents.weekday
        return weekDay!
    }
    
    @IBAction func onClickedWeeksButtonPressed(_ sender: Any) {
    }
    
    
    @IBAction func onClickedMonthButtonPressed(_ sender: Any) {
    }
    
}
extension String {
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }
    func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return substring(with: startIndex..<endIndex)
    }
    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return substring(to: toIndex)
    }
}

