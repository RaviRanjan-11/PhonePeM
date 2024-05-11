//
//  AppDelegate.swift
//  PhonePe
//
//  Created by Ravi Ranjan on 11/05/24.
//

import UIKit

import CoreLocation
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    
    
    
    var window: UIWindow?
    var navigation : UINavigationController?
    var locationManager: CLLocationManager?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // APP strats from here
        start()
    
        
        return true
    }
    
    private func locationService() {
       
    }

    
    /// App starts from here
    /// Can be configure on the basis of user status
    private func start() {
        
        let viewmodel = NearbyViewModel()
        let root = NearbyViewController(viewModel: viewmodel)
        window = UIWindow(frame: UIScreen.main.bounds)
        navigation = UINavigationController(rootViewController: root)
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
        
    }
    
}


