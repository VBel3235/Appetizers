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

    func getAppetizers(){
        NetworkManager.shared.getAppetizer {  result in
            DispatchQueue.main.async {
                switch result {
                case .success(let appetizers):
                    DispatchQueue.main.async {
                        self.appetizers = appetizers
                    }
                 
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        
            
        }
    }
    
    
    
}
