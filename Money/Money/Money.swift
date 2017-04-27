//
//  Currency.swift
//  Money
//
//  Created by Eugenio Barquín on 27/4/17.
//  Copyright © 2017 Eugenio Barquín. All rights reserved.
//

import Foundation
typealias Currency = String

struct Money {
    
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
    
    public func times(_ n:Int) -> Money {
        return Money(amount: _amount * n)
    }
    
    public func plus(_ added: Money) -> Money {
        return Money(amount: _amount + added._amount)
    }
}

extension Money: Equatable {
    public static func ==(lhs: Money, rhs: Money) -> Bool {
        return lhs._amount == rhs._amount
    }
    
}

extension Money: Hashable {
    public var hashValue: Int {
        get{
            return _amount.hashValue
        }
    }
}

extension Money{
    
    func reduced(to: Currency, broker: Broker) throws ->Money{
        let rate = try! broker.rate(from: _currency, to: to)
        return Money(amount: _amount * rate , currency: to)
    }
}
