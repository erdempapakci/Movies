//
//  MoviesUITests.swift
//  MoviesUITests
//
//  Created by Erdem on 26.08.2023.
//

import XCTest

final class MoviesUITests: XCTestCase {

    override func setUpWithError() throws {

        continueAfterFailure = false

    }

    func testExample() throws {

        let app = XCUIApplication()
        app.launch()

    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {

            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
