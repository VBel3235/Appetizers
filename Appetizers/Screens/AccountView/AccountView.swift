//
//  AccountView.swift
//  Appetizers
//
//  Created by Владислав Белов on 17.11.2021.
//

import SwiftUI

struct AccountView: View {
  
    @StateObject  var accountViewModel = AccountViewModel()
    
    @FocusState private var focusedTextfield: FormTextField?
    
    enum FormTextField {
        case firstName, lastName, email
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Personal info") ) {
                    TextField("First name", text: $accountViewModel.user.firstName)
                        .focused($focusedTextfield, equals: .firstName)
                        .onSubmit {focusedTextfield = .lastName}
                        .submitLabel(.next)
                    TextField("Last name", text: $accountViewModel.user.lastName)
                        .focused($focusedTextfield, equals: .lastName)
                        .onSubmit {focusedTextfield = .email}
                        .submitLabel(.next)
                    TextField("E-mail", text: $accountViewModel.user.email)
                        .focused($focusedTextfield, equals: .email)
                        .onSubmit {focusedTextfield = nil}
                        .submitLabel(.continue)
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
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Button("Dismiss") {
                            focusedTextfield = nil
                        }
                    }
                }
                        
        }
//        .onAppear(perform: {
//            accountViewModel.retreiveUser()
//        })
        .task {
            accountViewModel.retreiveUser()
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
