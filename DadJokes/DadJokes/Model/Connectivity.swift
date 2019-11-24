//
//  Connectivity.swift
//  DadJokes
//
//  Created by Ismail Elmaliki on 11/24/19.
//  Copyright © 2019 Ismail Elmaliki. All rights reserved.
//

import Foundation
import Alamofire

class Connectivity {
	
	// Determines if device is online or offline
	class var isConnectedToInternet: Bool {
		return NetworkReachabilityManager()!.isReachable
	}
}
