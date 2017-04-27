//
//  Euro.swift
//  Money
//
//  Created by Eugenio Barquín on 27/4/17.
//  Copyright © 2017 Eugenio Barquín. All rights reserved.
//

import Foundation

struct Euro {
    
    let _amount: Int
    
    init(amount: Int) {
        _amount = amount
    }
    
    init() {
        _amount = 0
    }
    
    public func times(_ n:Int) -> Euro {
        return Euro(amount: _amount * n)
    }
    
    public func plus(_ added: Euro) -> Euro {
        return Euro(amount: _amount + added._amount)
    }
}

extension Euro: Equatable {
    public static func ==(lhs: Euro, rhs: Euro) -> Bool {
        return lhs._amount == rhs._amount
    }
    
}

extension Euro: Hashable {
    public var hashValue: Int {
        get{
            return _amount.hashValue
        }
    }
}
