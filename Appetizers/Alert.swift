//
//  Alert.swift
//  Appetizers
//
//  Created by Владислав Белов on 17.11.2021.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidDeviceInput = AlertItem(title: "invalid device input", message: "Something is wrong with the camera on your device. We are unable to capture the input", dismissButton: .default(Text("OK")))
    static let invalidScannedType = AlertItem(title: "Invalid scanned type", message: "Value scanned is not valid. This app scans EAN-8 and EAN-13", dismissButton: .default(Text("OK")))
}
