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
	
	private var dadJokeText: String = ""
	private let headers: HTTPHeaders = [
		"Accept": "application/json"
	]
	private let url = "https://icanhazdadjoke.com/"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		triggerDadJoke()
	}
	
	func triggerDadJoke() {
		/// If: it's connected to internet, update joke
		/// Else: display default textview with no internet
		if Connectivity.isConnectedToInternet {
			generateRandomDadJoke()
		} else {
			defaultNoInternetText()
			alertNoInternet()
		}
	}
	
	//MARK: Change status bar to white
	override func viewDidAppear(_ animated: Bool) {
		navigationController?.navigationBar.barStyle = .black
	}
	
	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
		triggerDadJoke()
	}
	
	// MARK: Dad Jokes API
	/// Calling Dad jokes API then changing textview in main thread
	func generateRandomDadJoke() {
		Alamofire.request(url, method: .get, headers:headers)
			.validate().responseJSON { response in
			
			switch response.result {
			case .success(let value):
				let json = JSON(value)
				DispatchQueue.main.async {
					if let joke = json["joke"].string {
						self.dadJoke.text = joke
						self.dadJokeText = joke
					}
				}
			case .failure(let error):
				print("Error: \(error)")
			}
		}
	}
	
	// MARK: Refresh button
	@IBAction func forceRandomJoke(_ sender: Any) {
		triggerDadJoke()
	}
	
	//MARK: Share button
	@IBAction func shareDadJoke(_ sender: Any) {
		let textToShare: String = "\"\(dadJokeText)\""
		
		let activityVC = UIActivityViewController(activityItems: [textToShare], applicationActivities: nil)
		activityVC.popoverPresentationController?.sourceView = (sender as! UIView)
		self.present(activityVC, animated: true, completion: nil)
	}
	
	
	// MARK: Alert displayed if there's no internet connectivity
	private func alertNoInternet() {
		let alert = UIAlertController(title: "Cannot Generate Dad Joke", message: "No internet detected 😢", preferredStyle: UIAlertController.Style.alert)
		alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
		self.present(alert, animated: true, completion: nil)
	}
	
	// MARK: Default textview if there's no internet connectivity
	func defaultNoInternetText() {
		dadJokeText = "When you're using your Dad Jokes app without an internet connection"
		dadJoke.text = dadJokeText
	}
}
