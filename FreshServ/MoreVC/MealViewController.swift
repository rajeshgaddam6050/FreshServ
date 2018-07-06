//
//  MealViewController.swift
//  FreshServ
//
//  Created by IOSUSER on 2/13/18.
//  Copyright © 2018 IOSUSER. All rights reserved.
//

import UIKit
import OAuthSwiftAlamofire
import OAuthSwift
import Alamofire
import AlamofireImage
class MealViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    var dataDict: [String] = []
    var jsonData: [String] = []
    var imageUrlArray:[Any] = []
    var stringData: [String] = []
    var urlString: [String] = []
    
 
    @IBOutlet var collectionViewCellOuLet: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       // callingForAllMealsAPI()
        callingWebServicesAllMealsURL()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageUrlArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewCellOuLet.dequeueReusableCell(withReuseIdentifier:"mealCell", for: indexPath as IndexPath) as! MealCollectionViewCell
        urlString = imageUrlArray[indexPath.row] as! [String]
        print(urlString)
        let string1 = urlString
        print(string1)
        let urlString1 = string1[indexPath.row]
        print(urlString1)
        let pathURL = URL(string: urlString1)!
        print(pathURL)
        cell.mealImageViewOutLet.af_setImage(withURL: pathURL)
        return cell
    }
    
    func callingWebServicesAllMealsURL()
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
                    
                if let meals = myData["meal_image"] as! NSArray? {
                self.imageUrlArray.append(meals )
                print(self.imageUrlArray)
                self.stringData = [String(describing: self.imageUrlArray)]
                print(self.stringData)
            
                }
                self.collectionViewCellOuLet.reloadData()
                    
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
