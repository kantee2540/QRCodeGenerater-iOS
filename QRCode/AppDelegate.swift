//
//  AppDelegate.swift
//  QRCode
//
//  Created by Omp on 3/6/2563 BE.
//  Copyright © 2563 Omp. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let launchBefore = UserDefaults.standard.bool(forKey: "launchbefore")
        if !launchBefore{
            UserDefaults.standard.setValue("0107555000392", forKey: "taxid")
            UserDefaults.standard.setValue("อาคเนย์ประกันภัย", forKey: "companyname")
            UserDefaults.standard.setValue(true, forKey: "launchbefore")
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

