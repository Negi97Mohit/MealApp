//
//  Home.swift
//  mealApp1
//
//  Created by param madan on 29/01/24.
//

import SwiftUI

struct Home: View {
    
    @StateObject var HomeModel=HomeViewModel()
    var body: some View {
        ZStack{
            VStack(spacing:10){
                HStack(spacing: 15){
                    Button(action: {
                        withAnimation(.easeIn){HomeModel.showMenu.toggle()}
                    }, label: {
                        Image(systemName:"line.horizontal.3")
                            .font(.title)
                            .foregroundColor(.pink)
                    })
                    
                    Text(HomeModel.userLocation == nil ? "Location..." : "Deliver To")
                        .foregroundColor(.black)
                    Text(HomeModel.userAddress)
                        .font(.caption)
                        .fontWeight(.heavy)
                        .foregroundColor(.pink)
                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                }
                .padding([.horizontal,.top])
                
                Divider()
                HStack(spacing: 15){
                    TextField("Search",text: $HomeModel.search)
                    if HomeModel.search != ""{
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "magnifyingglass")
                                .font(.title2)
                                .foregroundColor(.gray)
                        })
                        .animation(.easeIn)
                    }
                    }
                .padding(.horizontal)
                .padding(.top,10)
                Divider()
                Spacer()
            }

            //Side Menu
            HStack{Menu(homeData: HomeModel)
                //Move effect from left
                    .offset(x : HomeModel.showMenu ? 0 : -UIScreen.main.bounds.width / 1.6)
                Spacer(minLength: 0)
                
            }
            .background(
                Color.black.opacity(HomeModel.showMenu ? 0.3 : 0).ignoresSafeArea()
                    //clsing when taps on outside
                    .onTapGesture(perform: {
                        withAnimation(.easeIn){HomeModel.showMenu.toggle()}
                    })
            )
            //Non closable if permission denied
            if HomeModel.noLocation{
                Text("Please Enable Location Access in Setting  to Further Move In !!!!")
                    .foregroundColor(.black)
                    .frame(width: UIScreen.main.bounds.width - 100, height: 120)
                    .background(Color.white)
                    .cornerRadius(10)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                    .background(Color.black.opacity(0.3).ignoresSafeArea())
            }
        }
        .onAppear(perform: {
            //calling location delegate
            HomeModel.locationManager.delegate = HomeModel
            
            
        })
    }
}

#Preview {
    Home()
}
