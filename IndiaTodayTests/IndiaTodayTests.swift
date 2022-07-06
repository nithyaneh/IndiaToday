//
//  IndiaTodayTests.swift
//  IndiaTodayTests
//
//  Created by Nithya Nehru on 7/6/22.
//

import XCTest
@testable import IndiaToday

class IndiaTodayTests: XCTestCase {

    private var articleListViewModelTest: ArticleDataViewModel!
    private var storyboard: UIStoryboard!
    private var sourceData: NewsSourcesResponse?
    var data: Data?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test
    }
    
    override func setUp() {
        articleListViewModelTest = ArticleDataViewModel(articleViewProtocol: Webservice())
    }
    
    func testForSportsCategorySuccess() {
        let expect = expectation(description: "API success")
        Task {
            await articleListViewModelTest.getData(category:Constants.Category.Sports)
            expect.fulfill()
        }
        waitForExpectations(timeout: 20)
        guard let artitlceCount = articleListViewModelTest.articles?.count else {return}
        XCTAssertTrue(artitlceCount > 0, "Data is loaded properly")
        for article in articleListViewModelTest.articles! {
            XCTAssertNotNil(article.title, "article data is not nil")
            XCTAssertNotNil(article.sourceName, "source name is not nil")
        }
    }
    
    func testForBusinessCategorySuccess() {
        let expect = expectation(description: "API success")
        
        Task {
            await articleListViewModelTest.getData(category:Constants.Category.Business)
            expect.fulfill()
        }
        waitForExpectations(timeout: 20)
        guard let artitlceCount = articleListViewModelTest.articles?.count else {return}
        XCTAssertTrue(artitlceCount > 0, "Data is loaded properly")
        for article in articleListViewModelTest.articles! {
            XCTAssertNotNil(article.title, "article data is not nil")
            XCTAssertNotNil(article.sourceName, "source name is not nil")
        }
    }
    
    func testForEntertainmentCategorySuccess() {
        let expect = expectation(description: "API success")
        
        Task {
            await articleListViewModelTest.getData(category:Constants.Category.Entertainment)
            expect.fulfill()
        }
        waitForExpectations(timeout: 20)
        guard let artitlceCount = articleListViewModelTest.articles?.count else {return}
        XCTAssertTrue(artitlceCount > 0, "Data is loaded properly")
        for article in articleListViewModelTest.articles! {
            XCTAssertNotNil(article.title, "article data is not nil")
            XCTAssertNotNil(article.sourceName, "source name is not nil")
        }
    }
    
    func testForGeneralCategorySuccess() {
        let expect = expectation(description: "API success")
        
        Task {
            await articleListViewModelTest.getData(category:Constants.Category.General)
            expect.fulfill()
        }
        waitForExpectations(timeout: 20)
        guard let artitlceCount = articleListViewModelTest.articles?.count else {return}
        XCTAssertTrue(artitlceCount > 0, "Data is loaded properly")
        for article in articleListViewModelTest.articles! {
            XCTAssertNotNil(article.title, "article data is not nil")
            XCTAssertNotNil(article.sourceName, "source name is not nil")
        }
    }
    
    func testForAPIWithEmptyCategoryFailure() {
        let expect = expectation(description: "API Empty Result")
        Task {
            await articleListViewModelTest.getData(category:"")
            expect.fulfill()
        }
        waitForExpectations(timeout: 20)
        guard let artitlceCount = articleListViewModelTest.articles?.count else {return}
        XCTAssertFalse(artitlceCount > 0, "Invalid country Data error")
    }
    
    func testForMockDataBusinessSuccess() throws {
        let expectation = expectation(description: "Success")
        sourceData = try getData(fromJSON: "Business_in")
        guard let artitlceCount = sourceData?.articles.count else {return}
        XCTAssertTrue(artitlceCount > 0, "Mock Data working")
        if let articles = sourceData?.articles {
            for article in articles {
                XCTAssertNotNil(article.title, "article data is not nil")
                XCTAssertNotNil(article.sourceName, "source name is not nil")
            }
        }
        expectation.fulfill()
        waitForExpectations(timeout: 20)
    }
    func testForMockDataSportsSuccess() throws {
        let expectation = expectation(description: "Success")
        sourceData = try getData(fromJSON: "Sports_in")
        guard let artitlceCount = sourceData?.articles.count else {return}
        XCTAssertTrue(artitlceCount > 0, "Mock Data working")
        if let articles = sourceData?.articles {
            for article in articles {
                XCTAssertNotNil(article.title, "article data is not nil")
                XCTAssertNotNil(article.sourceName, "source name is not nil")
            }
        }
        expectation.fulfill()
        waitForExpectations(timeout: 20)
    }
    func testForMockDataEntertainmentSuccess() throws {
        let expectation = expectation(description: "Success")
        sourceData = try getData(fromJSON: "Entertainment_in")
        guard let artitlceCount = sourceData?.articles.count else {return}
        XCTAssertTrue(artitlceCount > 0, "Mock Data working")
        if let articles = sourceData?.articles {
            for article in articles {
                XCTAssertNotNil(article.title, "article data is not nil")
                XCTAssertNotNil(article.sourceName, "source name is not nil")
            }
        }
        expectation.fulfill()
        waitForExpectations(timeout: 20)
    }
    func testForMockDataGeneralSuccess() throws {
        let expectation = expectation(description: "Success")
        sourceData = try getData(fromJSON: "General_in")
        guard let artitlceCount = sourceData?.articles.count else {return}
        XCTAssertTrue(artitlceCount > 0, "Mock Data working")
        if let articles = sourceData?.articles {
            for article in articles {
                XCTAssertNotNil(article.title, "article data is not nil")
                XCTAssertNotNil(article.sourceName, "source name is not nil")
            }
        }
        expectation.fulfill()
        waitForExpectations(timeout: 20)
    }
    func testForMockDataHealthSuccess() throws {
        let expectation = expectation(description: "Success")
        sourceData = try getData(fromJSON: "Health_in")
        guard let artitlceCount = sourceData?.articles.count else {return}
        XCTAssertTrue(artitlceCount > 0, "Mock Data working")
        if let articles = sourceData?.articles {
            for article in articles {
                XCTAssertNotNil(article.title, "article data is not nil")
                XCTAssertNotNil(article.sourceName, "source name is not nil")
            }
        }
        expectation.fulfill()
        waitForExpectations(timeout: 20)
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    override func tearDown() {
        articleListViewModelTest = nil
        storyboard = nil
    }
    
    
}
extension XCTestCase {
    enum TestError: Error {
        case fileNotFound
        case dataNotFound
    }
    
    func getData(fromJSON fileName: String) throws -> NewsSourcesResponse? {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: fileName, withExtension: "json") else {
            XCTFail("Missing File: \(fileName).json")
            throw TestError.fileNotFound
        }
        do {
            let data = try Data(contentsOf: url)
            let sourceData: NewsSourcesResponse = try JSONDecoder().decode(NewsSourcesResponse.self, from: data)
            return sourceData
        } catch {
            throw TestError.dataNotFound
        }
    }
}

