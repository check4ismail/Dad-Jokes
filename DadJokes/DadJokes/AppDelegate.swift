//
//  AppDelegate.swift
//  DadJokes
//
//  Created by Ismail Elmaliki on 11/23/19.
//  Copyright © 2019 Ismail Elmaliki. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		// Make status bar hidden while splash screen is displayed
		UIApplication.shared.isStatusBarHidden = false
		
		return true
	}
}
