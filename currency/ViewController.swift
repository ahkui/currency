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
//        var test =
        super.viewDidLoad()
        Alamofire.request("https://www.entiebank.com.tw/rate/page_host.asp").responseString(completionHandler: { response in
            if response.result.isSuccess {
                if let html = response.result.value {
                    if let doc = HTML(html: html, encoding: .utf8) {
                        if let table = doc.at_css("table caption")?.parent {
                            for (row) in table.css("tr") {
                                for tdvalue in row.css("td") {
//                                    let a = try Double(tdvalue.text)
                                    print("\(tdvalue.text?.substring(from: (tdvalue.text?.index((tdvalue.text?.startIndex)!, offsetBy: (tdvalue.text?.characters.count)!-4))!)) - \(tdvalue.text!) -")
//                                    let start = str.index(str.startIndex, offsetBy: 7)
//                                    let end = str.index(str.endIndex, offsetBy: -6)
//                                    let range = start..<end
//                                    
//                                    str.substring(with: range)
                                }
                            }
                        }
                    }
                }
            }else{
                print("fail load")
            }
        })
//        print("台灣銀行")
//        Alamofire.request("http://rate.bot.com.tw/xrt").responseString(completionHandler: { response in
//            if response.result.isSuccess {
//                if let html = response.result.value {
//                    if let doc = HTML(html: html, encoding: .utf8) {
//                        if let table = doc.at_css(".table.table-striped.table-bordered.table-condensed.table-hover")?.at_css("tbody") {
//                            for (row) in table.css("tr td.display_none_print_show,td div div.print_show") {
//                                print("\(row.text!)")
//                            }
//                        }
//                    }
//                }
//            }else{
//                print("fail load")
//            }
//        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//http://rate.bot.com.tw/xrdisplay_none_print_show t
