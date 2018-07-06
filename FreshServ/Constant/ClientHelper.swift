//
//  ClientHelper.swift
//  FreshServ
//
//  Created by IOSUSER on 1/30/18.
//  Copyright © 2018 IOSUSER. All rights reserved.
//

import Foundation
import OAuthSwift

class ClientHelper{
   
   static var client1:OAuth1Swift?

    /* Create cookie and place in cookie storage */
    static let cookieStorage = HTTPCookieStorage.shared
    static func getInstance()->OAuth1Swift{

    if(client1 == nil){
        
    client1 = OAuth1Swift(
        consumerKey:"102af6d54e9f90dc9d661f933494ca54",
        consumerSecret:"5330043049ef7da7563d60e68a32738c"
        );
        client1?.client.credential.oauthToken = "ce8d2d3a2a8e96e6270a4a88a3fcf85c"
        client1?.client.credential.oauthTokenSecret = "01d0070ebce508e2cb904746dceba4b4"
      
    }
        return client1!;
   }
}
