//
//  IndiaTodayUITests.swift
//  IndiaTodayUITests
//
//  Created by Nithya Nehru on 7/6/22.
//

import XCTest

class IndiaTodayUITests: XCTestCase {

    private var app: XCUIApplication!
    var timer: Timer!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    override func tearDown() {
        super.tearDown()
        timer = nil
    }
    
    override func setUp() {
        app = XCUIApplication()
        continueAfterFailure = false
        timer = Timer()
        app.launch()
    }
    
    func testArticleListNotLoaded() {
        let waitExpectation = expectation(description: "Waiting")
        let searchButton = app.staticTexts["searchBtn"]
        XCTAssertTrue(searchButton.isHittable, "Search Button is Hittable")
        searchButton.tap()
        waitExpectation.fulfill()
        waitForExpectations(timeout: 5.0)
        let tableCell = app.tables.children(matching: .cell).element(boundBy: 0).staticTexts["TitleName"]
        XCTAssertFalse(tableCell.exists, "Table list not loaded")
    }
    
    func testArticleListisLoadedForBusinessCategory() {
        let waitExpectation = expectation(description: "Waiting")
        app.textFields["categoryTextField"].tap()
        app.textFields["categoryTextField"].typeText("Business")
        let searchButton = app.staticTexts["searchBtn"]
        searchButton.tap()
        waitExpectation.fulfill()
        waitForExpectations(timeout: 5)
        XCTAssert(app.navigationBars["INDIA TODAY"].exists)
        let tableCell = app.tables.children(matching: .cell).element(boundBy: 0).staticTexts["TitleName"]
        WaitExpectation().waitForElement(element: tableCell, toShow: true, needToTap: false, assertMessage: nil)
        XCTAssertTrue(tableCell.exists, "Table list loaded")
        XCTAssert(app.tables.staticTexts.count > 0)
        if (app.tables.element(boundBy: 0).cells.count > 0) {
            app.tables.element(boundBy: 0).cells.element(boundBy: 0).tap()
        }
    }
    func testArticleListisLoadedForSportsCategory() {
        let waitExpectation = expectation(description: "Waiting")
        app.textFields["categoryTextField"].tap()
        app.textFields["categoryTextField"].typeText("Sports")
        let searchButton = app.staticTexts["searchBtn"]
        searchButton.tap()
        waitExpectation.fulfill()
        waitForExpectations(timeout: 5)
        XCTAssert(app.navigationBars["INDIA TODAY"].exists)
        let tableCell = app.tables.children(matching: .cell).element(boundBy: 0).staticTexts["TitleName"]
        WaitExpectation().waitForElement(element: tableCell, toShow: true, needToTap: false, assertMessage: nil)
        XCTAssertTrue(tableCell.exists, "Table list loaded")
        XCTAssert(app.tables.staticTexts.count > 0)
        if (app.tables.element(boundBy: 0).cells.count > 0) {
            app.tables.element(boundBy: 0).cells.element(boundBy: 0).tap()
        }
    }
    func testArticleListisLoadedForSEntertainmentCategory() {
        let waitExpectation = expectation(description: "Waiting")
        app.textFields["categoryTextField"].tap()
        app.textFields["categoryTextField"].typeText("Entertainment")
        let searchButton = app.staticTexts["searchBtn"]
        searchButton.tap()
        waitExpectation.fulfill()
        waitForExpectations(timeout: 5)
        XCTAssert(app.navigationBars["INDIA TODAY"].exists)
        let tableCell = app.tables.children(matching: .cell).element(boundBy: 0).staticTexts["TitleName"]
        WaitExpectation().waitForElement(element: tableCell, toShow: true, needToTap: false, assertMessage: nil)
        XCTAssertTrue(tableCell.exists, "Table list loaded")
        XCTAssert(app.tables.staticTexts.count > 0)
        if (app.tables.element(boundBy: 0).cells.count > 0) {
            app.tables.element(boundBy: 0).cells.element(boundBy: 0).tap()
        }
    }
    
    func testArticleListisLoadedForHealthCategory() {
        let waitExpectation = expectation(description: "Waiting")
        app.textFields["categoryTextField"].tap()
        app.textFields["categoryTextField"].typeText("Health")
        let searchButton = app.staticTexts["searchBtn"]
        searchButton.tap()
        waitExpectation.fulfill()
        waitForExpectations(timeout: 5)
        XCTAssert(app.navigationBars["INDIA TODAY"].exists)
        let tableCell = app.tables.children(matching: .cell).element(boundBy: 0).staticTexts["TitleName"]
        WaitExpectation().waitForElement(element: tableCell, toShow: true, needToTap: false, assertMessage: nil)
        XCTAssertTrue(tableCell.exists, "Table list loaded")
        XCTAssert(app.tables.staticTexts.count > 0)
        if (app.tables.element(boundBy: 0).cells.count > 0) {
            app.tables.element(boundBy: 0).cells.element(boundBy: 0).tap()
        }
    }
    
    func testArticleListisLoadedForGeneralCategory() {
        let waitExpectation = expectation(description: "Waiting")
        app.textFields["categoryTextField"].tap()
        app.textFields["categoryTextField"].typeText("General")
        let searchButton = app.staticTexts["searchBtn"]
        searchButton.tap()
        waitExpectation.fulfill()
        waitForExpectations(timeout: 5)
        XCTAssert(app.navigationBars["INDIA TODAY"].exists)
        let tableCell = app.tables.children(matching: .cell).element(boundBy: 0).staticTexts["TitleName"]
        WaitExpectation().waitForElement(element: tableCell, toShow: true, needToTap: false, assertMessage: nil)
        XCTAssertTrue(tableCell.exists, "Table list loaded")
        XCTAssert(app.tables.staticTexts.count > 0)
        if (app.tables.element(boundBy: 0).cells.count > 0) {
            app.tables.element(boundBy: 0).cells.element(boundBy: 0).tap()
        }
    }
    
    func testSearchHittable() {
        let waitExpectation = expectation(description: "Waiting")
        let searchButton = app.staticTexts["searchBtn"]
        XCTAssert(app.staticTexts["searchBtn"].exists)
        searchButton.tap()
        waitExpectation.fulfill()
        waitForExpectations(timeout: 5.0)
        let alert = app.alerts["Alert!"].scrollViews.otherElements
        let alertTitle = alert.staticTexts["Please type your category and search"]
        WaitExpectation().waitForElement(element: alertTitle, toShow: true, needToTap: false)
        XCTAssertTrue(alertTitle.exists, "no data alert shown")
        alert.buttons["OK"].tap()
    }
    
    func testSearchNavigation() {
        let waitExpectation = expectation(description: "Waiting")
        app.textFields["categoryTextField"].tap()
        app.textFields["categoryTextField"].typeText("Business")
        let searchButton = app.staticTexts["searchBtn"]
        searchButton.tap()
        waitExpectation.fulfill()
        waitForExpectations(timeout: 5)
        XCTAssert(app.navigationBars["INDIA TODAY"].exists)
    }
    
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
