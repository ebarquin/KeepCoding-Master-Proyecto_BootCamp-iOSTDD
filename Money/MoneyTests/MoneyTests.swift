//
//  MoneyTests.swift
//  MoneyTests
//
//  Created by Eugenio Barquín on 26/4/17.
//  Copyright © 2017 Eugenio Barquín. All rights reserved.
//

import XCTest
@testable import Money

class MoneyTests: XCTestCase {
    
    let five = Euro(amount: 5)
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCanCreateEuro() {
        
        XCTAssertNotNil(Euro())
    }
    
    func testSimpleMultiplication() {
        let ten = five.times(2)
        XCTAssertEqual(ten._amount, 10)
    }
    
}
