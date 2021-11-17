//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Владислав Белов on 17.11.2021.
//

import SwiftUI

struct AppetizerListView: View {
    var body: some View {
        NavigationView{
            Text("Appetizer View")
                .navigationTitle("🍔 Appetizers")
                        
        }
        
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
