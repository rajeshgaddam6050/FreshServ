//
//  TimeSlotViewController.swift
//  FreshServ
//
//  Created by IOSUSER on 1/31/18.
//  Copyright © 2018 IOSUSER. All rights reserved.
//

import UIKit
import OAuthSwift
import OAuthSwiftAlamofire
import Alamofire

class TimeSlotViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
   
       // callingOauthSwift1WebServiceTimeSlot()
   
       
        
       // }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
 
    }

  
    
//    func callingTimeSlotUrl()
//    {
//
//    let oauthSessionManager = SessionManager.default
//
//    oauthSessionManager.adapter = OAuthSwiftRequestAdapter(ClientHelper.getInstance())
//
//    oauthSessionManager.request(meal_URL, method: .get,  encoding: JSONEncoding.default).responseJSON { response in
//    print(response)
//
//                if let status = response.response?.statusCode {
//                    switch(status){
//                    case 201:
//                        print("example success")
//                    default:
//                        print("error with response status: \(status)")
//                    }
//                }
//
//                if let result = response.result.value {
//                    let JSON = result as! NSDictionary
//                    print(JSON)
//                }
//
//            }
//        }
    
    func callingOauthSwift1WebServiceTimeSlot()
    {
        let oauthswift = OAuth1Swift(
            consumerKey:"102af6d54e9f90dc9d661f933494ca54",
            consumerSecret:"5330043049ef7da7563d60e68a32738c"
        )
        oauthswift.client.credential.oauthToken = "ce8d2d3a2a8e96e6270a4a88a3fcf85c"
        oauthswift.client.credential.oauthTokenSecret = "01d0070ebce508e2cb904746dceba4b4"
        oauthswift.client.get(meal_URL, success: { responce in
            print("success")
            print("language name: \(responce)")
            print(responce.request as Any)  // original URL request
            print(responce.response as Any) // HTTP URL response
            print(responce.data as Any)     // server data
            // print(response.result)
            // print(response.string)
            print("\(responce)")
            let dataString = responce.string
            print(dataString)
            print("responsestr :\(dataString)")
            let data = dataString?.data(using: .utf8)
            do {
                //Parsing data & get the Array
                let jsonData = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! Dictionary<String, Any>
                print(jsonData)
                //Print the whole array object
                print(jsonData)
                
            }
            catch let error as NSError
            {
                //Print the error
                print(error)
            }
        },  failure: { error in
            print(error)
            
        }
            
        )
    }

}
