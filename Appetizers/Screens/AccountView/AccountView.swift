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
                    TextField("First name", text: $accountViewModel.user.firstName)
                    TextField("Last name", text: $accountViewModel.user.lastName)
                    TextField("E-mail", text: $accountViewModel.user.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    DatePicker("Birthday", selection: $accountViewModel.user.birthday, displayedComponents: .date)
                    Button{
                        accountViewModel.saveChanges()
                    } label: {
                        Text("Save changes")
                    }
                }

                Section(header: Text("Requests")){
                    Toggle("Extra napkins", isOn: $accountViewModel.user.extraNapkin)
                    Toggle("Frequent refills", isOn: $accountViewModel.user.frequentRefills)
                   
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
            }
          
                .navigationTitle("👨🏼‍💼 Account")
            
                        
        }
        .onAppear(perform: {
            accountViewModel.retreiveUser()
        })
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
