//
//  AppetizersViewModel.swift
//  Appetizers
//
//  Created by Владислав Белов on 17.11.2021.
//

import Foundation
import SwiftUI

final class AppetizerViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false

    func getAppetizers(){
        isLoading = true
        NetworkManager.shared.getAppetizer { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let appetizers):
                    DispatchQueue.main.async {
                        self.appetizers = appetizers
                        
                    }
                 
                case .failure(let error):
                    switch error {
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidResponse
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        self.alertItem = AlertContext.invalidURL
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                }
            }
        
            
        }
    }
    
    
    
}
