//
//  ProductsListViewModelGetProductsTests.swift
//  rpenya-eshop-challengeTests
//
//  Created by raulbot on 10/3/23.
//

import XCTest
import Domain
@testable import rpenya_eshop_challenge

final class ProductsListViewModelFlowTests: XCTestCase {
    func test_loadData_flow() {
        //Given
        let mockModel = MockProductsListViewModel.model
        //When
        mockModel.loadData()
        //Then
        XCTAssertTrue(mockModel.getProductsWithPromotionsCalled)
    }
    
    func test_refreshData_flow() {
        //Given
        let mockModel = MockProductsListViewModel.model
        //When
        mockModel.refreshData()
        //Then
        XCTAssertTrue(mockModel.getProductsWithPromotionsCalled)
    }
    
    func test_receiveResult_flow() {
        //Given
        let mockModel = MockProductsListViewModel.model
        let products = MockProducts.givenProducts(duplicates: false)
        //When
        mockModel.receiveResult(products)
        //Then
        XCTAssertTrue(mockModel.updateViewCalled)
    }
    
    func test_productsListItemButtonPressed_add_flow() {
        //Given
        let basket = MockBasketViewEntity.givenBasket()
        let mockModel = MockProductsListViewModel.model
        mockModel.currentBasket = basket
        let item = MockBasketProductViewEntity.givenBasketProduct1().transformToProductsListItem(action: mockModel.productsListItemButtonPressed)
        //When
        mockModel.productsListItemButtonPressed(item: item as! ProductsListItem, action: .add)
        //Then
        XCTAssertTrue(mockModel.updateViewCalled)
    }
    
    func test_productsListItemButtonPressed_remove_flow() {
        //Given
        let basket = MockBasketViewEntity.givenBasket()
        let mockModel = MockProductsListViewModel.model
        mockModel.currentBasket = basket
        let item = MockBasketProductViewEntity.givenBasketProduct1().transformToProductsListItem(action: mockModel.productsListItemButtonPressed)
        //When
        mockModel.productsListItemButtonPressed(item: item as! ProductsListItem, action: .remove)
        //Then
        XCTAssertTrue(mockModel.updateViewCalled)
    }
}
