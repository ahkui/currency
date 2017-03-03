//
//  ViewController.swift
//  currency
//
//  Created by Liew JoonKui on 03/03/2017.
//  Copyright © 2017 fcu. All rights reserved.
//

import UIKit
import Alamofire
import Kanna

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("https://www.entiebank.com.tw/rate/page_host.asp").responseString(completionHandler: { response in
            print("\(response.result.isSuccess)")
            if let html = response.result.value {
                                print(html)
                
                
                
                if let doc = HTML(html: html, encoding: .utf8) {
                    print(doc.title)
                    
                    // Search for nodes by CSS
                    for link in doc.css("a, link") {
                        print(link.text)
                        print(link["href"])
                    }
                    
                    // Search for nodes by XPath
                    for link in doc.xpath("//a | //link") {
                        print(link.text)
                        print(link["href"])
                    }
                }
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

