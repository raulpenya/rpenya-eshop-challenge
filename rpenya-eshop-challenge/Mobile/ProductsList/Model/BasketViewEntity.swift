//
//  BasketViewEntity.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 8/3/23.
//

import Foundation
import Domain

struct BasketViewEntity {
    let products: [BasketProductViewEntity]
}

extension BasketViewEntity {
    func transformToProductsList(action: ((ProductListItem, ProductListItemAction) -> Void)?) -> ProductsListItem {
        return ProductsListItem(items: products.compactMap { $0.transformToProductListItem(action: action) })
    }
    
    func transformToProductListButtonItem(action: @escaping ((ButtonItem) -> Void)) -> ProductListButtonItem {
        let isDisbled = false
        return ProductListButtonItem(title: NSLocalizedString("proceed_checkout", comment: ""), isDisabled: isDisbled, action: action)
    }
}

extension BasketViewEntity {
    func isEmpty() -> Bool {
        return true
    }
}

extension Products {
    func transformToBasket() -> BasketViewEntity {
        return BasketViewEntity(products: products.compactMap { $0.transformToBasketProduct() })
    }
}
