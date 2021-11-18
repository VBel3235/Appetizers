//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Владислав Белов on 18.11.2021.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    @Binding var isShowingDetailView: Bool
    
    var appetizer: Appetizer
    
    var body: some View {
        VStack{
           
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .frame(width: 300, height: 225, alignment: .top)
           
            Text(appetizer.name)
                .font(.title2)
                .fontWeight(.semibold)
            
            Text(appetizer.description)
                .multilineTextAlignment(.center)
                .font(.body)
                .padding()
            HStack(spacing: 40){
                NutritionVStack(title: Text("Calories"), value: Text("\(appetizer.calories)"))
                NutritionVStack(title: Text("Carbs"), value: Text("\(appetizer.carbs) g"))
                NutritionVStack(title: Text("Protein"), value: Text("\(appetizer.protein) g"))
            }
            Spacer()
            Button {
                
            } label: {
                AddToTheCartButton(title: Text("$\(appetizer.price, specifier: "%.2f") - Add To Order"), textColor: .white, backgroundColor: .brandPrimary)
            }
            .padding(.bottom, 30)
            
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button {
           isShowingDetailView = false
        } label : {
          XDismissButton()
        }, alignment: .topTrailing)
    }
}

struct NutritionVStack: View {
    var title: Text
    var value: Text
    
    var body: some View{
        VStack(spacing: 5){
            title
                .bold()
                .font(.caption)
                
            value
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
            
        }
    }
}

struct AppetizerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView( isShowingDetailView: .constant(true), appetizer: MockData.sampleAppetizer)
    }
}
