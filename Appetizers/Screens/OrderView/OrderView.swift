//
//  OrderView.swift
//  Appetizers
//
//  Created by Владислав Белов on 17.11.2021.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    List{
                        ForEach(order.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deleteItems)
                    }
                    .listStyle(.insetGrouped)
                    Button{
                        
                    } label: {
                        AddToTheCartButton(title: Text("$\(order.totalPrice, specifier: "%.2f") - Place Order"), textColor: .white, backgroundColor: .brandPrimary)
                    }
                    .padding(.bottom, 25)
                }
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order", message: "You have no items in your order")
                }
            }
           
                .navigationTitle("🚚 Orders")
                        
        }
       
    }
   
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
