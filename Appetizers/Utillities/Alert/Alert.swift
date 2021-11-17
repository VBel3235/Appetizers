//
//  Alert.swift
//  Appetizers
//
//  Created by Владислав Белов on 17.11.2021.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidData = AlertItem(title: Text("Server Error"), message: Text("Data received from the internet was invalid"), dismissButton: .default(Text("OK")))
    static let invalidResponse = AlertItem(title: Text("Server Error"), message: Text("Invalid response from the server. Please try again"), dismissButton: .default(Text("OK")))
    static let invalidURL = AlertItem(title: Text("Server error"), message: Text("There was an issue connecting to the server. Please try again"), dismissButton: .default(Text("")))
    static let unableToComplete = AlertItem(title: Text("Server error"), message: Text("Unable to complete you request. Please try again"), dismissButton: .default(Text("")))
                                           
}
