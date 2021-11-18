//
//  CustomModifiers.swift
//  Appetizers
//
//  Created by Владислав Белов on 19.11.2021.
//

import SwiftUI

struct StandartButtonStyle: ViewModifier{
    func body(content: Content) -> some View {
        content
        .buttonStyle(.bordered)
        .tint(.brandPrimary)
        .controlSize(.large)
    }
}

extension View{
    func standartButtonStyle() -> some View{
        self.modifier(StandartButtonStyle())
    }
}

