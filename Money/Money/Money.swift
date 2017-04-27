//
//  Money.swift
//  Money
//
//  Created by Eugenio Barquín on 27/4/17.
//  Copyright © 2017 Eugenio Barquín. All rights reserved.
//

import Foundation

protocol Money {
    
    init(amount: Int, currency: Currency)
    
    func times(_ n:Int)-> Self
    
    func plus(_ addend: Self)-> Self
    
    func reduced(to: Currency, broker: Rater) throws -> Bill
    
}
