//
//  WebServiceHelper.swift
//  FreshServ
//
//  Created by IOSUSER on 1/30/18.
//  Copyright © 2018 IOSUSER. All rights reserved.
//

import UIKit
import OAuthSwift

class WebServiceHelper: NSObject {
    
//    static let sharedInstance : WebServiceHelper = {
//        let instance = WebServiceHelper()
//        return instance
//    }()
//    func callWithPostMethod(MethodName: String, requestDict:Dictionary<String, Any>, isHud:Bool, hudView: UIView, successBlock:@escaping (_ response:Any, _ responseStr: Dictionary<String, Any> )->Void, errorBlock:@escaping (_ error:Any)->Void) -> Void {
//            DispatchQueue.main.async {
//                if isHud{
//                    let spinnerActivity = MBProgressHUD.showAdded(to: hudView, animated: true);
//                    spinnerActivity.label.text = "Loading";
//                    spinnerActivity.detailsLabel.text = "Please Wait!!";
//                    spinnerActivity.isUserInteractionEnabled = false;
//                }
//            }
//                 let oauthswift = OAuth1Swift(
//                consumerKey:"102af6d54e9f90dc9d661f933494ca54",
//                consumerSecret:"5330043049ef7da7563d60e68a32738c"
//             )
//
//        //}
//        //else {
//
//       // }
//
//      // return true
//   // }
//        /* Create cookie and place in cookie storage */
//            oauthswift.client.credential.oauthToken = "ce8d2d3a2a8e96e6270a4a88a3fcf85c"
//            oauthswift.client.credential.oauthTokenSecret = "01d0070ebce508e2cb904746dceba4b4"
//            //oauthswift.client.sessionFactory.configuration.httpCookieStorage = newCookie
//           // oauthswift.client.sessionFactory.configuration.httpShouldSetCookies = true
//            // let oauthswift = ClientHelper.getInstance()
//       // updateSession()
//
//
//
////        oauthswift.client.post(kBaseUrl , parameters:requestDict, headers: ["Accept": "application/json", "Content-Type":"application/json"],success: { response in
//
////                var newCookie = HTTPCookieStorage.shared
////                let cookies = HTTPCookie.cookiesWithResponseHeaderFields(httpResponse.allHeaderFields, forURL: response.URL!) as! [NSHTTPCookie]
////                HTTPCookieStorage.sharedHTTPCookieStorage().setCookies(cookies, forURL: response.URL!, mainDocumentURL: nil)
////                for cookie in cookies {
////                    var cookieProperties = [String: AnyObject]()
////                    cookieProperties[HTTPCookieName] = cookie.name
////                    cookieProperties[HTTPCookieValue] = cookie.value()
////                    cookieProperties[HTTPCookieDomain] = cookie.domain
////                    cookieProperties[HTTPCookiePath] = cookie.path
////                    cookieProperties[HTTPCookieVersion] = NSNumber(integer: cookie.version)
////                    cookieProperties[HTTPCookieExpires] = NSDate().dateByAddingTimeInterval(31536000)
////
////                    newCookie = HTTPCookie(properties: cookieProperties)
////                    HTTPCookieStorage.sharedHTTPCookieStorage().setCookie(newCookie!)
////
////                    println("name: \(cookie.name) value: \(cookie.value())")
////                }
//
//                let dataString = response.string
//
//                let data = dataString?.data(using: .utf8)
//                   do {
//                    //Parsing data & get the Array
//                    let responseStr = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! Dictionary<String, Any>
//                    print(responseStr)
//                    //Print the whole array object
//                    print(responseStr)
//                    DispatchQueue.main.async {
//                        successBlock(response,responseStr)
//                    }
//
//                } catch let error as NSError {
//                    print("Failed to load: \(error.localizedDescription)")
//                    DispatchQueue.main.async {
//                        errorBlock(error.localizedDescription)
//                    }
//                }
//
//            },
//                    failure: { error in
//                    print(error)
//            })
//        }
    }





//}
