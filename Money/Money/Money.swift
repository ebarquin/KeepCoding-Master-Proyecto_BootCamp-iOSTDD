//
//  Bill.swift
//  Money
//
//  Created by Eugenio Barquín on 27/4/17.
//  Copyright © 2017 Eugenio Barquín. All rights reserved.
//

import Foundation
typealias Currency = String

struct Bill {
    
    let _amount: Int
    let _currency: Currency
    
    init(amount: Int, currency: Currency = "EUR") {
        _amount = amount
        _currency = currency
    }
    
    init() {
        _amount = 0
        _currency = "EUR"
    }
    
    public func times(_ n:Int) -> Bill {
        return Bill(amount: _amount * n)
    }
    
    public func plus(_ added: Bill) -> Bill {
        return Bill(amount: _amount + added._amount)
    }
}

extension Bill: Equatable {
    public static func ==(lhs: Bill, rhs: Bill) -> Bool {
        return lhs._amount == rhs._amount
    }
    
}

extension Bill: Hashable {
    public var hashValue: Int {
        get{
            return _amount.hashValue
        }
    }
}

extension Bill: CustomStringConvertible {
    public var description: String {
        get {
            return "\(_currency) \(_amount)"
        }
    }
}

extension Bill{
    
    func reduced(to: Currency, broker: Broker) throws ->Bill{
        let rate = try! broker.rate(from: _currency, to: to)
        return Bill(amount: _amount * rate , currency: to)
    }
}
