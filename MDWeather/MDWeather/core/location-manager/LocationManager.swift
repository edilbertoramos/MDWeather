//
//  LocationManager.swift
//  MDWeather
//
//  Created by Edilberto Ramos on 25/09/22.
//

import CoreLocation

final public class LocationManager: NSObject, ObservableObject {
    
    private let manager = CLLocationManager()

    @Published var location: CLLocationCoordinate2D?
    @Published var hasAuthorization = false
    @Published var denied = false

    override init() {
        super.init()
        manager.delegate = self
    }
    
}

// MARK: - Public
public extension LocationManager {
    
    func requestLocation() {
        manager.requestLocation()
    }

}

// MARK: - Helper
private extension LocationManager {
    
    func hanldeAuthorization() {
        switch manager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            hasAuthorization = true
            requestLocation()
        case .denied:
            hasAuthorization = true
            denied = true
        default:
            hasAuthorization = false
            manager.requestWhenInUseAuthorization()
        }
    }
    
}

// MARK: - CLLocationManagerDelegate
extension LocationManager: CLLocationManagerDelegate {

    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
    }
    
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        #if DEBUG
        print("error:: \(error.localizedDescription)")
        #endif
    }

    public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        hanldeAuthorization()
    }
    
}
