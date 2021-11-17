//
//  Appetizer.swift
//  Appetizers
//
//  Created by Владислав Белов on 17.11.2021.
//

import Foundation

struct Appetizer: Decodable, Identifiable{
    let id: Int
    let name: String
    let descriptiong: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
    
}

struct AppetizerResponse{
    let request: [Appetizer]
}

struct MockData{
    static let sampleAppetizer = Appetizer(id: 1,
                                     name: "Big mac",
                                     descriptiong: "This is a description for big mac",
                                     price: 9.99,
                                     imageURL: "",
                                     calories: 99,
                                     protein: 99,
                                     carbs: 99)
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
}
