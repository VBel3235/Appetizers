//
//  AccoountViewModel.swift
//  Appetizers
//
//  Created by Владислав Белов on 18.11.2021.
//

import Foundation

final class AccountViewModel: ObservableObject {
    
    @Published var alertItem: AlertItem?
    
    @Published  var firstName: String = ""
    @Published  var lastName: String = ""
    @Published  var email: String = ""
    @Published  var birthday = Date()
    @Published  var extraNapkin = Bool()
    @Published  var frequentRefills = Bool()
    
    var isValidForm: Bool {
        guard !firstName.isEmpty && !lastName.isEmpty else {
            self.alertItem = AccountErrorContext.nameIsRequired
            return false
        }
        
        guard email.isValidEmail else {
            self.alertItem = AccountErrorContext.invalidEmail
            return false
            
        }
        
        return true
    }
    
    func saveChanges(){
        guard isValidForm else {
            return
        }
        print("Changes have been saved successfully")
    }
}
