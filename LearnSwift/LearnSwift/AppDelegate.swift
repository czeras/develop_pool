//
//  AppDelegate.swift
//  LearnSwift
//
//  Created by czeras on 2022/6/5.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    internal var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        self.window?.makeKeyAndVisible()
        
        let navi = UINavigationController.init(rootViewController: ViewController.init())
        self.window?.rootViewController = navi
        
        return true
    }
}

