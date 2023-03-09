//
//  ButtonItem.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 8/3/23.
//

import Foundation

protocol ButtonItem {
    var title: String { get set }
    var isDisabled: Bool { get set }
    var action: ((ButtonItem) -> Void) { get set }
}

struct ProductListButtonItem: ButtonItem {
    var title: String
    var isDisabled: Bool
    var action: ((ButtonItem) -> Void)
}

struct CheckoutListButtonItem: ButtonItem {
    var title: String
    var isDisabled: Bool
    var action: ((ButtonItem) -> Void)
}
