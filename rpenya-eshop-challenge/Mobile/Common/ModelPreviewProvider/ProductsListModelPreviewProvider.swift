//
//  ProductsListModelPreviewProvider.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 8/3/23.
//

import Foundation

struct ProductsListModelPreviewProvider {
    static func getProductsListItem() -> ProductsListItem {
        return ProductsListItem(items: [ProductsListModelPreviewProvider.getProductListItem1(), ProductsListModelPreviewProvider.getProductListItem2()])
    }
    
    static func getProductListItem1() -> ProductListItem {
        return ProductListItem(basketProduct: ProductsListModelPreviewProvider.getBasketProduct1(), view: .productsList, action: nil)
    }
    
    static func getProductListItem2() -> ProductListItem {
        return ProductListItem(basketProduct: ProductsListModelPreviewProvider.getBasketProduct2(), view: .productsList, action: nil)
    }
    
    static func getBasketProduct1() -> BasketProductViewEntity {
        return BasketProductViewEntity(product: getProduct(), units: 2)
    }
    
    static func getBasketProduct2() -> BasketProductViewEntity {
        return BasketProductViewEntity(product: getProductWithoutPromotion(), units: 200)
    }
    
    static func getProduct() -> ProductViewEntity {
        return ProductViewEntity(code: "TSHIRT", name: "Cabify T-Shirt", price: 20, currency: "€", promotion: ProductsListModelPreviewProvider.getPromotion())
    }
    
    static func getProductWithoutPromotion() -> ProductViewEntity {
        return ProductViewEntity(code: "TSHIRT", name: "Cabify T-Shirt", price: 20, currency: "€", promotion: nil)
    }
    
    static func getPromotion() -> PromotionViewEntity {
        return PromotionViewEntity(productCode: "TSHIRT", name: "Pay 1 get 2", type: .percentage, unitsNeeded: 2, discount: 0.5)
    }
}
