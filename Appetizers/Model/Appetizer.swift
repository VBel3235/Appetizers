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
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
    
}

struct AppetizerResponse: Decodable{
    let request: [Appetizer]
}

struct MockData{
    static let sampleAppetizer = Appetizer(id: 1,
                                     name: "Big mac",
                                     description: "This is a description for big mac",
                                     price: 9.99,
                                     imageURL: "",
                                     calories: 99,
                                     protein: 99,
                                     carbs: 99)
    static let appetizers = [orderItemOne, orderItemTwo, orderItemThree, orderItemFour]
    
    static let orderItemOne = Appetizer(id: 0001,
                                        name: "Big mac",
                                        description: "This is a description for big mac",
                                        price: 9.99,
                                        imageURL: "",
                                        calories: 99,
                                        protein: 99,
                                        carbs: 99)
    
    static let orderItemTwo = Appetizer(id: 0002,
                                        name: "McNuggets",
                                        description: "This is a description for big mac",
                                        price: 9.99,
                                        imageURL: "",
                                        calories: 99,
                                        protein: 99,
                                        carbs: 99)
    
    static let orderItemThree = Appetizer(id: 0003,
                                        name: "Fries",
                                        description: "This is a description for big mac",
                                        price: 9.99,
                                        imageURL: "",
                                        calories: 99,
                                        protein: 99,
                                        carbs: 99)
    
    static let orderItemFour = Appetizer(id: 0004,
                                        name: "Cheeseburger",
                                        description: "This is a description for big mac",
                                        price: 9.99,
                                        imageURL: "",
                                        calories: 99,
                                        protein: 99,
                                        carbs: 99)
}
