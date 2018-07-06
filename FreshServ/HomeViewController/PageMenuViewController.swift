//
//  PageMenuViewController.swift
//  FreshServ
//
//  Created by IOSUSER on 2/21/18.
//  Copyright © 2018 IOSUSER. All rights reserved.
//

import UIKit
import Parchment
import OAuthSwift
import OAuthSwiftAlamofire
import Alamofire
import AlamofireImage

class PageMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let PageMenuBreakeFastViewController = storyboard.instantiateViewController(withIdentifier: "PageMenuBreakeFastViewController")
        let PageMenuLunchViewController = storyboard.instantiateViewController(withIdentifier: "PageMenuLunchViewController")
        let PageMenuSnacksViewController = storyboard.instantiateViewController(withIdentifier: "PageMenuSnacksViewController")
        let PageMenuDinnerViewController = storyboard.instantiateViewController(withIdentifier: "PageMenuDinnerViewController")
     
        
        let pagingViewController = FixedPagingViewController(viewControllers: [
            PageMenuBreakeFastViewController,
            PageMenuLunchViewController,
            PageMenuSnacksViewController,
            PageMenuDinnerViewController,
            ])
        
        addChildViewController(pagingViewController)
        view.addSubview(pagingViewController.view)
        view.constrainToEdges(pagingViewController.view)
        pagingViewController.didMove(toParentViewController: self)
        
        callWebSerevicesMealCollection()
        
    }
    func callWebSerevicesMealCollection()
    {
        
//       let spiningAcitivity = MBProgressHUD.showAdded(to: view, animated: true)
//           spiningAcitivity.labelText = "Loading...!"
        
        let oauthswift = OAuth1Swift(
            consumerKey:"102af6d54e9f90dc9d661f933494ca54",
            consumerSecret:"5330043049ef7da7563d60e68a32738c"
        )
        oauthswift.client.credential.oauthToken = "ce8d2d3a2a8e96e6270a4a88a3fcf85c"
        oauthswift.client.credential.oauthTokenSecret = "01d0070ebce508e2cb904746dceba4b4"
        oauthswift.client.get("http://192.168.1.50/freshserv/api/rest/ennovex/meals?customer_type=0&diet_type=13&subscription_type=14&meal_type=16&date=2018-02-28&end_date=2018-03-28", success: { responce in
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
               // var temp:NSArray = jsonData["data"] as! NSArray
                //print(temp)
        

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
