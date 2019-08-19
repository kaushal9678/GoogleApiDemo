//
//  RestaurantPhotoViewModel.swift
//  Demo
//
//  Created by Kaushal on 19/08/19.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation
import UIKit
import Foundation
import CoreLocation
import RxSwift

protocol RestaurantItemPhotoPresentable {
	
	var items:Photo? {get}
}
class RestaurantItemPhotoViewModel:RestaurantItemPhotoPresentable{
	
	var items: Photo?
	
	init(items:Photo) {
		self.items = items;
	}
}
//1 - Setup  viewModel that inherits from NSObject
@objc class RestaurantListingPhotoViewModel:NSObject {
	
	
	
	
	
	/// array is of type RestaurantItemPresentable which represents PoiList type objects
	///  - Define an items property that will hold the data of POIInterest (available Taxi in Hamsburg defined bound) from myTaxi Fake API.
	
	var photoItems:Variable<[RestaurantItemPresentable]> = Variable([]);

}
