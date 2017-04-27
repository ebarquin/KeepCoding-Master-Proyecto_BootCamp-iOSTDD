//
//  Wad.swift
//  Money
//
//  Created by Eugenio Barquín on 27/4/17.
//  Copyright © 2017 Eugenio Barquín. All rights reserved.
//

import Foundation

typealias Bills = [Bill]

struct Wad{
    var _bills = Bills()
    
    var billCount : Int {
        get{
            return _bills.count
        }
    }
}

extension Wad : Money{
    
    init(amount: Int, currency: Currency){
        _bills.append(Bill(amount: amount, currency: currency))
    }
    
    func times(_ n:Int)->Wad{
        return self
    }
    
    func plus(_ addend: Wad)-> Wad{
        return self
    }
    
    func reduced(to: Currency, broker: Broker) throws -> Wad{
        return self
    }
}
