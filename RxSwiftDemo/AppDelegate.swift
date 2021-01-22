//
//  AppDelegate.swift
//  RxSwiftDemo
//
//  Created by xiao on 2020/8/12.
//  Copyright © 2020 phjt. All rights reserved.
//

import UIKit
import Foundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let rootVc = HomeController()
        let nav = UINavigationController(rootViewController: rootVc)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        
        return true
    }




}

