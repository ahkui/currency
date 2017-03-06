//
//  currency.swift
//  currency
//
//  Created by RTC13 on 2017/3/6.
//  Copyright © 2017年 fcu. All rights reserved.
//

import Foundation


class CurrencyRate {
    var Country:String?
    var CashSell:Double?
    var CashBuy:Double?
    var SpotSell:Double?
    var SpotBuy:Double?
    init(_ country:String,cashSell:Double,cashBuy:Double,spotSell:Double,spotBuy:Double) {
        self.Country = country
        self.CashBuy = cashBuy
        self.CashSell = cashSell
        self.SpotBuy = spotBuy
        self.SpotSell = spotSell
    }
}
class Bank {
    var name:String?
    var updateTime:Int?
    var rate:[String:CurrencyRate]?
    init(_ name:String) {
        self.name = name
    }
    func updateRate(_ rate:CurrencyRate) -> Void {
        self.updateTime = Int(NSDate().timeIntervalSince1970)
        self.rate?[rate.Country!] = rate
    }
    func getRate(_ country :String ) -> CurrencyRate {
        return self.rate![country]!
    }
    func getAllRate() -> [String:CurrencyRate] {
        return rate!
    }
}
class Data {
    var bank:[Bank]?
    func addBank(_ bank:Bank) -> Void {
        
    }
}

