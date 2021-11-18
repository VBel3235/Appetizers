//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Владислав Белов on 17.11.2021.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
