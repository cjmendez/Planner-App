//
//  LocationManager.swift
//  Planner
//
//  Created by csuftitan on 11/9/23.
//

import Foundation
import CoreLocation

final class LocationManager: NSObject, CLLocationManagerDelegate{
    private let manager = CLLocationManager()
    
    static let shared = LocationManager()
    
    private var locationFetchCompletion: ((CLLocation) -> Void)?
    
    private var location: CLLocation?{
        didSet{
            guard let location else{
                return
            }
            locationFetchCompletion?(location)
        }
    }
    public func getCurrentLocation(completion: @escaping (CLLocation) -> Void){
        self.locationFetchCompletion = completion
        
        manager.requestWhenInUseAuthorization()
        manager.delegate = self
        manager.startUpdatingLocation()
    }
    
    //mark: - Location
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else{
            return
        }
        manager.stopUpdatingLocation()
    }
}
