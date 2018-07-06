//
//  HomeVC.swift
//  FreshServ
//
//  Created by IOSUSER on 1/11/18.
//  Copyright © 2018 IOSUSER. All rights reserved.
//

import UIKit
extension UIImageView
{
    func roundedImage() {
    self.layer.cornerRadius = self.frame.size.width / 2
    self.clipsToBounds = true
    }
}
class HomeVC: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    @IBOutlet var subscribeButtonOutlet: UIButton!
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var collectionViewB: UICollectionView!
    @IBOutlet var collectionViewA: UICollectionView!
    
        var mainMenu: [String] = []
        var myOrder: [String] = []
        override func viewDidLoad() {
        super.viewDidLoad()

        profileImageView.roundedImage()
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width/2
        profileImageView.clipsToBounds = true
        subscribeButtonOutlet.layer.cornerRadius = 5
            
        profileImageView.layer.borderWidth = 2
        profileImageView.layer.borderColor = UIColor.black.cgColor
        mainMenu = ["a","b","c","d","e","f","g","h"]
         myOrder = ["food_for_moc","food_for_moc","food_for_moc"]
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        if collectionView == self.collectionViewA {
            return myOrder.count
        }
            return mainMenu.count
    }
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        if collectionView == self.collectionViewA
        {
        let cellA = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! MyOrderCollectionViewCell
            cellA.myOrderImageCell.image = UIImage(named:myOrder[indexPath.row])
            return cellA
        }
        else
        {
        let cellB = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCustomCell", for: indexPath) as! ImageCollectionViewCell
            cellB.imageViewCell.image = UIImage(named:mainMenu[indexPath.row])
            return cellB
    }
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onClickedSubscribeButtonPressed(_ sender: Any)
    {
        let SubscribeViewController = self.storyboard?.instantiateViewController(withIdentifier: "SubscribeViewController") as! SubscribeViewController
        self.navigationController?.pushViewController(SubscribeViewController, animated: true)
    }
    
}
