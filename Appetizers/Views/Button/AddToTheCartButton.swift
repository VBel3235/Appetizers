//
//  AddToTheCartButton.swift
//  Appetizers
//
//  Created by Владислав Белов on 18.11.2021.
//

import SwiftUI

struct AddToTheCartButton: View {
    
    var title: Text
    var textColor: Color
    var backgroundColor: Color
    
    
    var body: some View{
        title
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .foregroundColor(textColor)
            .background(backgroundColor)
            
            .cornerRadius(10)
    }
}

struct AddToTheCartButton_Previews: PreviewProvider {
    static var previews: some View {
        AddToTheCartButton(title: Text("$11.49 - Add To Order"), textColor: .white, backgroundColor: .brandPrimary)
    }
}
