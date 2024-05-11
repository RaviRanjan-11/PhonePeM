//
//  NearbyViewModel.swift
//  PhonePe
//
//  Created by Ravi Ranjan on 11/05/24.
//

import Foundation
import CoreLocation



typealias URLString =  String


protocol NearByViewmodelDelegate: AnyObject {
    func reload()
}

class NearbyViewModel: ViewModelProtocol, LocationManagerReprestable {
    
    private let locationmanager: LocationManager
    private var currentPage: Int = 0
    private var lattitude: String = "0.0"
    private var longitude: String = "0.0"
    private var range : Int = 1
    var isLoading: Bool = false
    
    
    weak var delegate: NearByViewmodelDelegate?
    var venues =  [Venue]()
    
    init(){
        locationmanager = LocationManager()
        locationmanager.requestLocationAccess()
        locationmanager.delegate = self
        self.isLoading = true
        
    }
    
    var totalPlaceCount: Int {
        return venues.count
    }
    
    
    func didFetchLocation(lattitue: String, longitude: String) {
        self.lattitude = lattitue
        self.longitude = longitude
        serviceRequestForNearByLocation()
    }
    
    private func createRequestparam() -> [String: Any] {
        
        var request = [String: Any]()
        
        request["per_page"] = 10
        request["page"] = currentPage
        request["client_id"] = "Mzg0OTc0Njl8MTcwMDgxMTg5NC44MDk2NjY5"
        request["lat"] = lattitude
        request["lon"] = longitude
        request["range"] = "\(range)mi"
        return request
    }
    
    func updateRange(with currentRange: Float) {
        
        range = Int(round(currentRange))
        self.currentPage = 0
        serviceRequestForNearByLocation()
    }
    
    func serviceRequestForNearByLocation() {
        
        NetworkManager.shared.serviceRequest(parameter: createRequestparam()) { [weak self ] (response: Result<NearByLocation, HTTPError>) in
            self?.isLoading = false
            
            switch response {
            case .success(let data):
                guard let venues = data.venues else {return}
                self?.venues.append(contentsOf: venues)
                self?.delegate?.reload()
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    
    func loadMoreData() {
        guard !isLoading else {return}
        self.currentPage += 1
        serviceRequestForNearByLocation()
    }
}
