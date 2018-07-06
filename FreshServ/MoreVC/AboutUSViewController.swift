//
//  AboutUSViewController.swift
//  FreshServ
//
//  Created by IOSUSER on 2/8/18.
//  Copyright © 2018 IOSUSER. All rights reserved.
//

import UIKit
import WebKit
class AboutUSViewController: UIViewController {

    @IBOutlet var webViewKitOutLet: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL (string: "http://www.apple.com");
        let request = URLRequest(url: url! as URL);
        webViewKitOutLet.load(request);
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    



}
