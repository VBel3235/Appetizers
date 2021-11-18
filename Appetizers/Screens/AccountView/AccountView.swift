//
//  AccountView.swift
//  Appetizers
//
//  Created by Владислав Белов on 17.11.2021.
//

import SwiftUI

struct AccountView: View {
  
    @StateObject  var accountViewModel = AccountViewModel()
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Personal info") ) {
                    TextField("First name", text: $accountViewModel.firstName)
                    TextField("Last name", text: $accountViewModel.lastName)
                    TextField("E-mail", text: $accountViewModel.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    DatePicker("Birthday", selection: $accountViewModel.birthday, displayedComponents: .date)
                    Button{
                        accountViewModel.saveChanges()
                    } label: {
                        Text("Save changes")
                    }
                }

                Section(header: Text("Requests")){
                    Toggle("Extra napkins", isOn: $accountViewModel.extraNapkin)
                    Toggle("Frequent refills", isOn: $accountViewModel.frequentRefills)
                   
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
            }
          
                .navigationTitle("👨🏼‍💼 Account")
            
                        
        }
        .alert(item: $accountViewModel.alertItem) { alert in
            Alert(title: alert.title, message: alert.message, dismissButton: alert.dismissButton)
    }
}
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
