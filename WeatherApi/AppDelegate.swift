//
//  AppDelegate.swift
//  WeatherApi
//
//  Created by Александр on 22.11.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
//    private let locationService = LocationManager.shared
//
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = UINavigationController(rootViewController: WeatherViewController())
//        locationService.requestPermission()
//        locationService.start()
        return true
    }

}

