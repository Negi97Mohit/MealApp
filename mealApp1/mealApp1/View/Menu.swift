//
//  Menu.swift
//  mealApp1
//
//  Created by param madan on 29/01/24.
//

import SwiftUI

struct Menu: View {
    @ObservedObject var homeData : HomeViewModel
    var body: some View {
        
        VStack{
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                HStack(spacing: 15){
                        Image(systemName: "cart")
                        .font(.title)
                        .foregroundColor(.pink)
                    
                    Text("Cart")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.black)
                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                }
                .padding()
            })
            
            Spacer()
            HStack{
                Spacer()
                Text("Version : BETA")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.pink)
            }
            .padding(10)
        }
        .frame(width: UIScreen.main.bounds.width / 1.6)
        .background(Color.white.ignoresSafeArea())

    }
}

//#Preview {
//    Menu()
//}
