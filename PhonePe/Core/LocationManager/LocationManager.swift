//
//  LocationManager.swift
//  PhonePe
//
//  Created by Ravi Ranjan on 11/05/24.
//
import Foundation
import CoreLocation


protocol LocationManagerReprestable: AnyObject {
    func didFetchLocation(lattitue: String, longitude: String)
}


class LocationManager: NSObject {
    
    private let locationManager: CLLocationManager = CLLocationManager()
    weak var delegate: LocationManagerReprestable?
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func requestLocationAccess() {
        
        locationManager.requestWhenInUseAuthorization()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location manager failed with error: \(error.localizedDescription)")

    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            locationManager.requestLocation()
        case .restricted:
            print("Location access is restricted.")
        case .denied:
            print("Location access is denied.")
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.requestLocation()
        default:
            print("Unknown authorization status.")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            print("Location updated: \(location.coordinate.latitude), \(location.coordinate.longitude)")
            let lat = location.coordinate.latitude
            let long = location.coordinate.longitude
            delegate?.didFetchLocation(lattitue: "\(lat)", longitude: "\(long)")
        }
    }
}
