//
//  RestaurantListingViewModel.swift
//  Demo
//
//  Created by Kaushal on 18/08/19.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import Foundation
import CoreLocation
import RxSwift

protocol RestaurantItemPresentable {
	
	var items:Result? {get}
}
class RestaurantItemViewModel:RestaurantItemPresentable{
	
	var items: Result?
	
	init(items:Result) {
		self.items = items;
	}
}


//1 - Setup  viewModel that inherits from NSObject
@objc class RestaurantListingViewModel:NSObject {
	
	
	
	 private let apiClient: APIClientProtocol
	
	
	@objc convenience override init() {
		
		self.init(apiClient: APIClient())
	}
	
	
	
	@objc  init(apiClient: APIClientProtocol) {
		
		self.apiClient = apiClient
	}
	
	
	/// array is of type RestaurantItemPresentable which represents PoiList type objects
	///  - Define an items property that will hold the data of POIInterest (available Taxi in Hamsburg defined bound) from myTaxi Fake API.
	
	var items:Variable<[RestaurantItemPresentable]> = Variable([])
	//var loadingHud:Variable<CabItemPresentable> = Variable([])
	var progressHud = Variable(false)
	
	//4 - This function is what directly accesses the apiClient to make the API call
	func getPOI(completion: @escaping () -> Void) {
		
		//5 - call on the apiClient to fetch the apps
		
		let url = URL(string: Url.Restaurant_URL)
		
		
		self.apiClient.load(from: url!) { [weak self] (result,error) in
			//6 - Put this block on the main queue because our completion handler is where the data display code will happen and we don't want to block any UI code.
			if(error == nil){
				DispatchQueue.main.async {
					//7 - assign our local apps array to our returned json
					
					self?.items.value = result!.results!.map({ (items)  in
					RestaurantItemViewModel(items: items)
					
					})
					
					//8 - call our completion handler because it is in this completion that we will reload data in our view controller tableview
					completion()
				}
			}
		}
	}
}




