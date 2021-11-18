//
//  AccountView.swift
//  Appetizers
//
//  Created by Владислав Белов on 17.11.2021.
//

import SwiftUI

struct AccountView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var birthday = Date()
    @State private var extraNapkin = Bool()
    @State private var frequentRefills = Bool()
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Personal info") ) {
                    TextField("First name", text: $firstName)
                    TextField("Last name", text: $lastName)
                    TextField("E-mail", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    DatePicker("Birthday", selection: $birthday, displayedComponents: .date)
                    Button{
                        print("Save")
                    } label: {
                        Text("Save changes")
                    }
                }

                Section(header: Text("Requests")){
                    Toggle("Extra napkins", isOn: $extraNapkin)
                    Toggle("Frequent refills", isOn: $frequentRefills)
                   
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
            }
          
                .navigationTitle("👨🏼‍💼 Account")
                        
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
