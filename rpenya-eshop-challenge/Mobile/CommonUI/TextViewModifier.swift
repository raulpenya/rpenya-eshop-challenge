//
//  TextViewModifier.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 7/3/23.
//

import SwiftUI

struct TitleTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.system(.title, weight: .semibold)).foregroundColor(Colors.textColor)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .lineLimit(2)
            .minimumScaleFactor(0.01)
    }
}

struct SubtitleTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.system(.subheadline, weight: .regular)).foregroundColor(Colors.textColor)
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .lineLimit(2)
            .minimumScaleFactor(0.01)
    }
}

struct PriceTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.system(.title, weight: .bold)).foregroundColor(Colors.textColor)
            .frame(maxWidth: .infinity, alignment: .trailing)
            .minimumScaleFactor(0.01)
    }
}

struct UnitsTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.system(.title3, weight: .semibold)).foregroundColor(Colors.textColor)
            .frame(width: 30, height: 30)
            .minimumScaleFactor(0.01)
    }
}

struct AddRemoveButtonTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.title)
            .foregroundColor(Colors.addRemoveButtonTextColor)
            .bold()
            .minimumScaleFactor(0.01)
    }
}

struct CompleteButtonTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.title)
            .foregroundColor(Colors.completeButtonTextColor)
            .bold()
            .lineLimit(2)
            .minimumScaleFactor(0.01)
            .padding(.all, 6)
    }
}
