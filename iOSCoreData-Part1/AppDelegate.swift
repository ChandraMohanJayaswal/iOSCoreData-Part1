//
//  AppDelegate.swift
//  iOSCoreData-Part1
//
//  Created by Chandra Jayaswal on 03/09/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    private func willEnterForeground() {
        print("Will Enter Foreground Notification!")
    }
    
    private func didEnterBackground() {
        print("Did Enter Background Notification!")
        PersistentStorage.shared.saveContext()
    }


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //Saving some default users inside KeyChain
        do {
            try KeychainHandler.save(service: Bundle.main.bundleIdentifier!, account: "chandra", password: "chandra".data(using: .utf8) ?? Data())
        } catch {
            print(error)
        }
        
        do {
            try KeychainHandler.save(service: Bundle.main.bundleIdentifier!, account: "user", password: "password".data(using: .utf8) ?? Data())
        } catch {
            print(error)
        }
        
        
        NotificationCenter.default.addObserver(forName: UIApplication.willEnterForegroundNotification, object: nil, queue: nil) { (notification: Notification) in
            self.willEnterForeground()
        }
        
        NotificationCenter.default.addObserver(forName: UIApplication.didEnterBackgroundNotification, object: nil, queue: nil) { (notification: Notification) in
            self.didEnterBackground()
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
