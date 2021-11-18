//
//  Order.swift
//  Appetizers
//
//  Created by Владислав Белов on 19.11.2021.
//

import SwiftUI

final class Order: ObservableObject{
    
    @Published var items: [Appetizer] = []
    
    func add(_ appetizer: Appetizer){
        items.append(appetizer)
    }
    
    func deleteItems(at offsets: IndexSet){
        items.remove(atOffsets: offsets)
    }
    
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price}
    }
}
