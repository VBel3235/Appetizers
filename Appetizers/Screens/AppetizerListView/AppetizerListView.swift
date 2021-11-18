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
        ZStack{
        NavigationView{
            List(viewModel.appetizers){ appetizer in
                AppetizerListCell(appetizer: appetizer)
//                    .listRowSeparator(.automatic)
//                    .listRowSeparatorTint(.brandPrimary)
                    .onTapGesture {
                        viewModel.selectedAppetizer = appetizer
                    }
            }
            .navigationTitle("🍔 Appetizers")
            .disabled(viewModel.isShowingDetailView)
        }
        .onAppear{
            viewModel.getAppetizers()
        }
    
        .blur(radius: viewModel.isShowingDetailView ? 40 : 0)
            if viewModel.isShowingDetailView {
                if let appetizer = viewModel.selectedAppetizer{
                    AppetizerDetailView(isShowingDetailView: $viewModel.isShowingDetailView, appetizer: appetizer)
                }
            }
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alert in
            Alert(title: alert.title, message: alert.message, dismissButton: alert.dismissButton)
    }
//        .sheet(isPresented: $viewModel.isShowingDetailView, content: {
//            if let appetizer = viewModel.selectedAppetizer{
//                AppetizerDetailView(isShowingDetailView: $viewModel.isShowingDetailView, appetizer: appetizer)
//            }
//          
//        })
    
}

}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
