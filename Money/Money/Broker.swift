//
//  Broker.swift
//  Money
//
//  Created by Eugenio Barquín on 27/4/17.
//  Copyright © 2017 Eugenio Barquín. All rights reserved.
//

import Foundation
// Errors
enum BrokerErrors : Error{
    case unknownRate
}

//TypeAliases
typealias RatesDictionary = [String:Rate]
typealias Rate = Int    // en el futuro, lo cambiaré a Double

//Protocols
protocol Rater{
    func rate(from: Currency, to: Currency) throws -> Rate
}

//Default implementations
extension Rater{
    func rate(from: Currency, to: Currency) throws -> Rate {
        return 1
    }
}

//Types
struct UnityBroker : Rater {}

struct Broker: Rater {
    
    var _rates = RatesDictionary()
    
    private func _makeKeyForRate(from: Currency, to: Currency)-> String{
        return "\(from)->\(to)"
    }
    
    
    mutating func addRate(from: Currency, to:Currency, rate: Rate)  {
        
        _rates[_makeKeyForRate(from: from, to: to)] = rate       // directo
        _rates[_makeKeyForRate(from: to, to: from)] = 1 / rate // inverso
        _rates[_makeKeyForRate(from: from, to: from)] = 1	// trivial
        _rates[_makeKeyForRate(from: to, to: to)] = 1	// trivial
        
    }
    
    func rate(from: Currency, to: Currency) throws -> Rate{
        guard let rate = _rates[_makeKeyForRate(from: from, to: to)] else{
            throw BrokerErrors.unknownRate
        }
        return rate
        
    }
    
}
