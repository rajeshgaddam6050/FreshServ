//
//  MoreViewController.swift
//  FreshServ
//
//  Created by IOSUSER on 2/3/18.
//  Copyright © 2018 IOSUSER. All rights reserved.
//

import UIKit
class MoreViewController: UIViewController {

    @IBOutlet var profilePicOutlet: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        profilePicOutlet.roundedImage()
        profilePicOutlet.layer.cornerRadius = profilePicOutlet.frame.size.width/2
        profilePicOutlet.clipsToBounds = true
        profilePicOutlet.layer.borderWidth = 2
        profilePicOutlet.layer.borderColor = UIColor.black.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    @IBAction func onClickedShareButtonPressed(_ sender: Any)
    {
        let text = "https://play.google.com/store/apps/details?id=com.foodsquad&hl=en"
        
        // set up activity view controller
        let textToShare = [ text ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        
        // exclude some activity types from the list (optional)
        activityViewController.excludedActivityTypes = [ UIActivityType.airDrop, UIActivityType.postToFacebook ]
        
        // present the view controller
        self.present(activityViewController, animated: true, completion: nil)
    }

    @IBAction func onClickedHomeButtonPressed(_ sender: Any)
    {
        let HomeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        self.navigationController?.pushViewController(HomeVC, animated: true)
    }
    
    
    @IBAction func onClickedAboutUsButtonPressed(_ sender: Any)
    {
        let AboutUSViewController = self.storyboard?.instantiateViewController(withIdentifier: "AboutUSViewController") as! AboutUSViewController
        self.navigationController?.pushViewController(AboutUSViewController, animated: true)
    }
    
    @IBAction func onClickedFAQButtonPressed(_ sender: Any)
    {
        let FAQViewController = self.storyboard?.instantiateViewController(withIdentifier: "FAQViewController") as! FAQViewController
        self.navigationController?.pushViewController(FAQViewController, animated: true)
    }
  
    @IBAction func onClickedLogOutButtonPressed(_ sender: Any)
    {
        
      let LogInViewController = self.storyboard?.instantiateViewController(withIdentifier: "LogInViewController") as! LogInViewController
        self.present(LogInViewController, animated: true, completion: nil)
        
    }
   
    @IBAction func onClickedEditButtonPressed(_ sender: Any)
    {
        showPopUpButton()
    }
    func showPopUpButton()
    {
        let EditPopUpViewController = self.storyboard?.instantiateViewController(withIdentifier: "EditPopUpViewController") as! EditPopUpViewController
        self.navigationController?.pushViewController(EditPopUpViewController, animated: true)
        
        self.addChildViewController(EditPopUpViewController)
         EditPopUpViewController.view.frame = self.view.frame
        self.view.addSubview(EditPopUpViewController.view)
        
        EditPopUpViewController.didMove(toParentViewController: self)
        print(EditPopUpViewController)
        
    }
}
