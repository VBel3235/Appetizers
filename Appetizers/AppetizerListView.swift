//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Владислав Белов on 17.11.2021.
//

import SwiftUI

struct AppetizerListView: View {
    
    
    @StateObject var viewModel = AppetizerViewModel()
    
    
    var body: some View {
        NavigationView{
            List(viewModel.appetizers){ appetizer in
                AppetizerListCell(appetizer: appetizer)
            }
            .navigationTitle("🍔 Appetizers")
        }
        .onAppear{
            viewModel.getAppetizers()
        }
    }
 
}



struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
