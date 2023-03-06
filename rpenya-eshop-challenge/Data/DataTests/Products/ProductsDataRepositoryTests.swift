//
//  ProductsDataRepositoryTests.swift
//  DataTests
//
//  Created by raulbot on 5/3/23.
//

import XCTest
@testable import Data
import Domain

final class ProductsDataRepositoryTests: XCTestCase {

    let dataSource = MockProductsDataSource()
    var response: DataSourceResponse?
    var errorResponse: Error?
    var productsResponse: [Product] = []
    
    override func setUpWithError() throws {
        response = nil
        errorResponse = nil
        productsResponse = []
        dataSource.called = false
    }
    
    func test_getAllProducts_success() {
        //Given
        dataSource.response = .success
        let dataRepository = ProductsDataRepository(dataSource: dataSource)
        let expectation = expectation(description: "test_getAllProducts_success")
        //When
        dataRepository.getAllProducts().sink { [weak self] completion in
            switch completion {
            case .failure(let error):
                self?.response = .error
                self?.errorResponse = error
            case .finished:
                self?.response = .success
            }
            expectation.fulfill()
        } receiveValue: { [weak self] products in
            self?.productsResponse = products
        }.cancel()
        waitForExpectations(timeout: 5, handler: nil)
        //Then
        XCTAssertEqual(response, .success)
        XCTAssertNil(errorResponse)
        XCTAssertTrue(dataSource.called)
        XCTAssertFalse(productsResponse.isEmpty)
        XCTAssertEqual(productsResponse.count, 1)
    }
    
    func test_getAllProducts_error() {
        //Given
        dataSource.response = .error
        let dataRepository = ProductsDataRepository(dataSource: dataSource)
        let expectation = expectation(description: "test_getAllProducts_success")
        //When
        dataRepository.getAllProducts().sink { [weak self] completion in
            switch completion {
            case .failure(let error):
                self?.response = .error
                self?.errorResponse = error
            case .finished:
                self?.response = .success
            }
            expectation.fulfill()
        } receiveValue: { [weak self] products in
            self?.productsResponse = products
        }.cancel()
        waitForExpectations(timeout: 5, handler: nil)
        //Then
        XCTAssertEqual(response, .error)
        XCTAssertNotNil(errorResponse)
        XCTAssertTrue(dataSource.called)
        XCTAssertTrue(productsResponse.isEmpty)
    }
}
