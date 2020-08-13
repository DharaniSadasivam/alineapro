//
//  AppDelegate.swift
//  AlineaInvest
//
//  Created by Dharani Sadasivam on 12/08/20.
//  Copyright © 2020 Dharani Sadasivam. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        let tabbarViewController = MainTabbarViewController()
        window?.rootViewController = UINavigationController(rootViewController: tabbarViewController)
        let barAppearance = UINavigationBar.appearance()
        barAppearance.barTintColor = UIColor.white
        barAppearance.tintColor = UIColor.black
        barAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        window?.makeKeyAndVisible()
        return true
    }
    
    
}

