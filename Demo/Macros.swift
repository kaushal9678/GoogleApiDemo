//
//  Macros.swift
//  Demo
//
//  Created by Kaushal on 18/08/19.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation

struct Segue{
	
	static let POI_VC = "poiVC"
	static let CAB_LISTING_VC = "cabListingVC"//:352
}
struct Storyboard_identifier {
	static let POI = "appleMapVC"
	
}
struct NIB_Name {
	static let RestaurantTableViewCell = "RestaurantListingCell"
}

struct Url {
	static let HOST_URL = "https://fake-poi-api.mytaxi.com/?"
	static let Fake_URL = "https://fake-poi-api.mytaxi.com/?p2Lat=53.394655&p1Lon=9.757589&p1Lat=53.694865&p2Lon=10.099891"
	static let Restaurant_URL = "https://maps.googleapis.com/maps/api/place/search/json?location=28.611726,77.362289&radius=2000&types=restaurant&sensor=true&key=AIzaSyCBdlzPV_hjclwdwfFN8vFPK2_KzsFNC5s";
}

struct GoogleKeys{
	static let KEY_GOOGLE_MAP_SERVER_KEY  = "AIzaSyCBdlzPV_hjclwdwfFN8vFPK2_KzsFNC5s"//"AIzaSyD3g1TyvtuhINy0mVZabO7lRI0U9Jx2MPA"
	static let KEY_GOOGLE_MAP_API_KEY   =  "AIzaSyCBdlzPV_hjclwdwfFN8vFPK2_KzsFNC5s"//"AIzaSyD3g1TyvtuhINy0mVZabO7lRI0U9Jx2MPA"
	
	let KEY_GOOGLE_RESTAURANT_API = "https://maps.googleapis.com/maps/api/place/search/json?location="
	//"https://maps.googleapis.com/maps/api/place/search/json?location=%f,%f&radius=%d&types=%@&sensor=true&key=%@"
	let KEY_GOOGLE_GEOCODE_ADDRESS = "https://maps.googleapis.com/maps/api/geocode/json?latlng="
	//"https://maps.googleapis.com/maps/api/geocode/json?latlng=40.714224,-73.961452&key=YOUR_API_KEY"
	
	let KEY_GOOGLE_CONVERT_ADDRESS_TO_LAT_LNG = "https://maps.googleapis.com/maps/api/geocode/json?address="//1600+Amphitheatre+Parkway,+Mountain+View,+CA&key=YOUR_API_KEY"
	
	//MARKS: Object keys
	let kFORMATED_ADDRESS = "formatted_address"
	let kNEAR_BY_PLACES = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?key=AIzaSyD3g1TyvtuhINy0mVZabO7lRI0U9Jx2MPA&location=28.6243373,77.37497089999999&radius=5000&rankby=prominence&sensor=true&types=restaurant"

}
