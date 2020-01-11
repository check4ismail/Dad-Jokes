//
//  SplashController.swift
//  DadJokes
//
//  Created by Ismail Elmaliki on 1/11/20.
//  Copyright © 2020 Ismail Elmaliki. All rights reserved.
//

import UIKit

class SplashController: UIViewController {
	
	private let segueDadJokes = "showDadJokes"
	
	override func viewDidLoad() {
		Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { timer in
			print("Splash screen timer invalidated")
			timer.invalidate()
			self.performSegue(withIdentifier: self.segueDadJokes, sender: self)
		}
	}
}
