//
//  AppDelegate.swift
//  Discovery
//
//  Created by Ilham Hadi Prabawa on 3/15/19.
//  Copyright © 2019 Codenesia. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        
        let rootVC = ViewController()
        let navigationVC = UINavigationController(rootViewController: rootVC)
        window?.rootViewController = navigationVC
        window?.makeKeyAndVisible()
        
        return true
    }

}

