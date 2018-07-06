//
//  CalenderViewController.swift
//  FreshServ
//
//  Created by IOSUSER on 2/22/18.
//  Copyright © 2018 IOSUSER. All rights reserved.
//

//import UIKit
//enum MyTheme1 {
//    case light
//    case dark
//}
//class CalenderViewController: UIViewController {
//    
//    @IBOutlet var selectedButtonOutLet: UIButton!
//    @IBOutlet var cancelButtonOutLet: UIButton!
//    @IBOutlet var calenderViewOutLet: UIView!
//    var theme = MyTheme1.dark
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        self.view.backgroundColor = UIColor.clear.withAlphaComponent(0.8)
//        self.showAnimate()
//        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
//        calenderViewOutLet.layer.cornerRadius = 5
//        cancelButtonOutLet.layer.cornerRadius = 5
//        selectedButtonOutLet.layer.cornerRadius = 5
//       
//    }
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//        calenderView.myCollectionView.collectionViewLayout.invalidateLayout()
//    }
//    @objc func rightBarBtnAction(sender: UIBarButtonItem) {
//        if theme == .dark {
//            sender.title = "Dark"
//            theme = .light
//            Style.themeLight()
//        } else {
//            sender.title = "Light"
//            theme = .dark
//            Style.themeDark()
//        }
//        self.view.backgroundColor=Style.bgColor
//        calenderView.changeTheme()
//    }
//    let calenderView: CalenderView = {
//        let v=CalenderView(theme: MyTheme1.dark)
//        v.translatesAutoresizingMaskIntoConstraints=false
//        return v
//    }()
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//       
//    }
//    func showAnimate()
//    {
//     
//        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
//        self.view.alpha = 0.0;
//        UIView.animate(withDuration: 0.25, animations: {
//            self.view.alpha = 1.0
//            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
//            
//        });
//     
//        self.title = AppName
//        self.navigationController?.navigationBar.isTranslucent=false
//        self.view.backgroundColor=Style.bgColor
//        
//        view.addSubview(calenderView)
//        calenderView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive=true
//        calenderView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive=true
//        calenderView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive=true
//        calenderView.heightAnchor.constraint(equalToConstant: 365).isActive=true
//   
//    }
//    func removeAnimate()
//    {
//        UIView.animate(withDuration: 0.25, animations: {
//            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
//            self.view.alpha = 0.0;
//        }, completion:{(finished : Bool)  in
//            if (finished)
//            {
//                self.view.removeFromSuperview()
//            }
//        });
//    }
//
//    @IBAction func onClickedCancelButtonPressed(_ sender: Any) {
//        self.removeAnimate()
//        self.view.removeFromSuperview()
//        
//    }
//    
//
//    @IBAction func onClickedSelectedButtonPressed(_ sender: Any) {
// 
////       let PageMenuViewController = self.storyboard?.instantiateViewController(withIdentifier: "PageMenuViewController") as! PageMenuViewController
////       self.navigationController?.pushViewController(PageMenuViewController, animated: true)
//         DispatchQueue.main.async {
//             let MenuViewController: MenuViewController? = self.storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController?
//            self.present(MenuViewController!, animated: true, completion: nil)
//
//       // let MenuViewController = self.storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
//                  //self.navigationController?.pushViewController(MenuViewController, animated: true)
//        }
//    }
//}

