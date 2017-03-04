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
            if response.result.isSuccess {
                
                if let html = response.result.value {
                    if let doc = HTML(html: html, encoding: .utf8) {
                        if let table = doc.at_css("table caption")?.parent {
                            print(table.css("tr").count)
//                            for row in table.css("tr") {
//                                print(row.innerHTML)
//                            }
                        }
//                        print(doc.css("table caption,tbody").count)
//                        for a in (?.parent?.css("tbody tr"))! {
//                            print(a)
//                        }
                            //print(table.innerHTML)
                        
                        // Search for nodes by CSS
//                        for link in doc.css("a, link") {
//                            print(link.text)
//                            print(link["href"])
//                        }
                    }
                }
            }else{
                print("fail load")
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

