//
//  DadJokesUITests.swift
//  DadJokesUITests
//
//  Created by Ismail Elmaliki on 11/26/19.
//  Copyright © 2019 Ismail Elmaliki. All rights reserved.
//

import XCTest
@testable import DadJokes

class DadJokesUITests: XCTestCase {

	let app = XCUIApplication()
    override func setUp() {
        continueAfterFailure = false
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDadJokes() {
        // UI tests must launch the application that they test.
        app.launch()
		print()
		
		
		print("Nothing")
    }
}
