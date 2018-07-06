//
//  SearchBarViewController.swift
//  FreshServ
//
//  Created by IOSUSER on 2/28/18.
//  Copyright © 2018 IOSUSER. All rights reserved.
//

import UIKit
import OAuthSwift
import OAuthSwiftAlamofire
import Alamofire

class SearchBarViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate {

    @IBOutlet var searchBarOutLet: UISearchBar!
    @IBOutlet var tableViewOutLet: UITableView!
    
    var areaData: [String] = []
    var filterData = String()
    var isSearching = false
   
    var nameData:[String] = []
    var cityData:[String] = []
    var parserArray = [String]()
    var emptyDictionary = [String:String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        callingWebServicesSearchBar()
        searchBarOutLet.returnKeyType = UIReturnKeyType.done
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    
    func callingWebServicesSearchBar()
    {
        //let spiningAcitivity = MBProgressHUD.showAdded(to: view, animated: true)
       // spiningAcitivity.label.text = "Loading...!"
        let oauthswift = OAuth1Swift(
            consumerKey:"102af6d54e9f90dc9d661f933494ca54",
            consumerSecret:"5330043049ef7da7563d60e68a32738c"
        )
        oauthswift.client.credential.oauthToken = "ce8d2d3a2a8e96e6270a4a88a3fcf85c"
        oauthswift.client.credential.oauthTokenSecret = "01d0070ebce508e2cb904746dceba4b4"
        oauthswift.client.get(search_URL, success: { responce in
            print("success")
            print("language name: \(responce)")
            print(responce.request as Any)
            print(responce.response as Any)
            print(responce.data as Any)
            print("\(responce)")
            
            let dataString = responce.string
            print(dataString)
            print("responsestr :\(dataString)")
            let data = dataString?.data(using: .utf8)
            print(data)
            do {
                let jsonData = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! Dictionary<String, Any>
                print(jsonData)
                
                if  let myData = jsonData["data"] as! AnyObject? {
                    print(myData)
                 
                    self.nameData = myData.value(forKey: "city_name") as! [String]
                    print(self.nameData)
                    self.cityData = myData.value(forKey: "name") as! [String]
                    print(self.cityData)
                    self.areaData = myData.value(forKey: "area_name") as! [String]
                    self.tableViewOutLet.reloadData()
        
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
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return filterData.count
        }
        return self.nameData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableViewOutLet.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as!  SearchTableViewCell
        
        cell.cityNameLabel?.text = areaData[indexPath.row] as! String
        
        cell.addressLabel.text = cityData[indexPath.row] as! String
        cell.countryLabel.text = nameData[indexPath.row] as! String
        
        return cell
    }

}

