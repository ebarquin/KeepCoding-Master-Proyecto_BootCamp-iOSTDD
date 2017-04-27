//
//  Euro.swift
//  Money
//
//  Created by Eugenio Barquín on 27/4/17.
//  Copyright © 2017 Eugenio Barquín. All rights reserved.
//

import Foundation

struct Money {
    
    let _amount: Int
    
    init(amount: Int) {
        _amount = amount
    }
    
    init() {
        _amount = 0
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
