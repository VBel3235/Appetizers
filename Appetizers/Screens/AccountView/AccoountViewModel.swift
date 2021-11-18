//
//  AccoountViewModel.swift
//  Appetizers
//
//  Created by Владислав Белов on 18.11.2021.
//

import Foundation
import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @AppStorage("user") private var userData: Data?
    
    @Published var alertItem: AlertItem?
    
    @Published var user = User()
    
    func saveChanges(){
        guard isValidForm else {
            return
        }
        do {
           
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AccountErrorContext.userSaveSuccess
        } catch  {
            alertItem = AccountErrorContext.invalidUserData
        }
    }
    
    func retreiveUser(){
        guard let userData = userData else {
            return
        }
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch  {
            alertItem = AccountErrorContext.invalidUserData
        }
    }
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty else {
            self.alertItem = AccountErrorContext.nameIsRequired
            return false
        }
        
        guard user.email.isValidEmail else {
            self.alertItem = AccountErrorContext.invalidEmail
            return false
            
        }
        
        return true
    }
    
  
}
