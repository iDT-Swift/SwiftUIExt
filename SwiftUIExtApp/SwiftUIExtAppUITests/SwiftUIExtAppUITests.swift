//
//  SwiftUIExtAppUITests.swift
//  SwiftUIExtAppUITests
//
//  Created by Gustavo Halperin on 5/18/23.
//

import XCTest

final class SwiftUIExtAppUITests: XCTestCase {

    var app : XCUIApplication!

    override func setUp() {
        super.setUp()
        app = XCUIApplication()
        app.launch()
    }
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testUIFlow() throws {
        
        app.staticTexts["CLEAR"].tap()
        app.staticTexts["YELLOW"].tap()
        app.staticTexts["GREEN"].tap()
        
    }
    
}
