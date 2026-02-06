//
//  AppDelegate.swift
//  CocoaTouchUIKit
//
//  Created by Sashi Jagadam on 06/02/26.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    //Called when the app finishes launching
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        print("App Launched")
        return true
    }
    
    //called when app is about to move from active to inactive
    func applicationWillResignActive(_ application: UIApplication) {
        print("App will resign active")
    }
    
    //called when app enters background
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("App entered background")
    }

    /*
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
*/

}

