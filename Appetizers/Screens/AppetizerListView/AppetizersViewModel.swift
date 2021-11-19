//
//  AppetizersViewModel.swift
//  Appetizers
//
//  Created by Владислав Белов on 17.11.2021.
//

import Foundation
import SwiftUI

@MainActor final class AppetizerViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false
    @Published var isShowingDetailView: Bool = false
    
    var selectedAppetizer: Appetizer? {didSet { isShowingDetailView = true }}
    
    func getAppetizers(){
        isLoading = true
        Task {
            do {
                appetizers = try await NetworkManager.shared.getAppetizer()
                isLoading = false
            } catch  {
                if let aPError = error as? APError {
                    switch aPError{
                        
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
             
                } else {
                    alertItem = AlertContext.invalidResponse
                  
                }
                isLoading = false
        }
        }
    }
    
//    func getAppetizers(){
//        isLoading = true
//        NetworkManager.shared.getAppetizer { [weak self] result in
//            guard let self = self else { return }
//            DispatchQueue.main.async {
//                self.isLoading = false
//                switch result {
//                case .success(let appetizers):
//                    DispatchQueue.main.async {
//                        self.appetizers = appetizers
//
//                    }
//
//                case .failure(let error):
//                    switch error {
//                    case .invalidURL:
//                        self.alertItem = AlertContext.invalidResponse
//                    case .invalidResponse:
//                        self.alertItem = AlertContext.invalidResponse
//                    case .invalidData:
//                        self.alertItem = AlertContext.invalidURL
//                    case .unableToComplete:
//                        self.alertItem = AlertContext.unableToComplete
//                    }
//                }
//            }
//
//
//        }
//    }
    
}
