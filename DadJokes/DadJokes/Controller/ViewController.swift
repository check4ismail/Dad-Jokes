//
//  ViewController.swift
//  DadJokes
//
//  Created by Ismail Elmaliki on 11/23/19.
//  Copyright © 2019 Ismail Elmaliki. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class ViewController: UIViewController {

	@IBOutlet weak var dadJoke: UITextView!
	private let headers: HTTPHeaders = [
		"Accept": "application/json"
	]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		/// If: it's connected to internet, update joke
		/// Else: display default textview with no internet
		if Connectivity.isConnectedToInternet {
			generateRandomDadJoke()
		} else {
			defaultNoInternetText()
		}
	}
	
	//MARK: Change status bar to white
	override func viewDidAppear(_ animated: Bool) {
		navigationController?.navigationBar.barStyle = .black
	}
	
	// MARK: Dad Jokes API
	/// Calling Dad jokes API then changing textview in main thread
	private func generateRandomDadJoke() {
		Alamofire.request("https://icanhazdadjoke.com/",
						  method: .get,
						headers:headers).validate().responseJSON { response in
			switch response.result {
				case .success(let value):
					let json = JSON(value)
					DispatchQueue.main.async {
						if let joke = json["joke"].string {
							self.dadJoke.text = joke
						}
					}
				case .failure(let error):
					print("Error fetching dad joke - \(error)")
			}
		}
	}
	
	// MARK: Refresh button
	@IBAction func forceRandomJoke(_ sender: Any) {
		if Connectivity.isConnectedToInternet { // If: there's internet, update joke
			generateRandomDadJoke()
		} else {	// Else: display alert that there's no internet and update textview
			alertNoInternet()
			defaultNoInternetText()
		}
	}
	
	// MARK: Alert displayed if there's no internet connectivity
	private func alertNoInternet() {
		let alert = UIAlertController(title: "Error", message: "No internet detected 😢", preferredStyle: UIAlertController.Style.alert)
		alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
		self.present(alert, animated: true, completion: nil)
	}
	
	// MARK: Default textview if there's no internet connectivity
	private func defaultNoInternetText() {
		dadJoke.text = "When you're using your Dad Jokes app without an internet connection"
	}
}
