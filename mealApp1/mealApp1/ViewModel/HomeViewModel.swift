//
//  HomeViewModel.swift
//  mealApp1
//
//  Created by param madan on 29/01/24.
//

import SwiftUI
import CoreLocation

class HomeViewModel: NSObject,ObservableObject,CLLocationManagerDelegate{
    @Published var locationManager=CLLocationManager()
    @Published var search = ""
    
    //location details
    @Published var userLocation : CLLocation!
    @Published var userAddress = ""
    @Published var noLocation = false
    
    //Side Menu
    @Published var showMenu = false
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        //checking location acess
        switch manager.authorizationStatus {
        case .authorizedWhenInUse:
            print("Authorized")
            self.noLocation = false
            manager.requestLocation()
        case .denied:
            print("denied")
            self.noLocation = true
        default:
            print("Unknown")
            self.noLocation = false
            //direct call
            locationManager.requestWhenInUseAuthorization()
            
            //modify info.plist
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //reading user location
        self.userLocation = locations.last
        self.extractLocation ()
    }
    func extractLocation (){
        CLGeocoder().reverseGeocodeLocation(self.userLocation){
            (res,err) in
            guard let safeData = res else{return}
            var address = ""
            //getting area and locality name:
            address+=safeData.first?.name ?? ""
            address+=", "
            address+=safeData.first?.locality ?? ""
            
            self.userAddress=address
        }
    }
}

//#Preview {
//    HomeViewModel()
//}
