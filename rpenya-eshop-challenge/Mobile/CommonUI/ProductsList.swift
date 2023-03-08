//
//  ProductsList.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 8/3/23.
//

import SwiftUI

struct ProductsList: View {
    let listItem: ProductsListItem
    var body: some View {
        List (listItem.items) { item in
            item.getCell(for: .productsList)
        }.listStyle(.plain)
    }
}

struct ProductsList_Previews: PreviewProvider {
    static var previews: some View {
        ProductsList(listItem: ProductsListModelPreviewProvider.getProductsListItem())
    }
}
