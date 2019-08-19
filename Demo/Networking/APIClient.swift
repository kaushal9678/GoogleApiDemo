//
//  Service.swift
//  Demo
//
//  Created by Kaushal on 18/08/19.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation

import UIKit

typealias Handler = (_ rootData:Root?, _ error:Error?)->Void

@objc protocol APIClientProtocol {
	
	@objc func load(from url: URL, completionHandler: @escaping Handler);
}

//1 - This APIClient will be called by the MapviewModel to get POI app data.
@objc class APIClient: NSObject,APIClientProtocol {
	
	
	
	
	
	private let engine: NetworkEngineProtocol?
	
	
	@objc convenience override init() {
		
		self.init(engine: URLSession.shared)
	}
	
	
	@objc init(engine: NetworkEngineProtocol = URLSession.shared) {
		self.engine = engine
		super.init()
	}
	
	func load(from url: URL, completionHandler: @escaping Handler) {
		
		engine?.performRequest(for: url, completionHandler: { (data, response, error) in
			
			
			if let error = error {
				return completionHandler(nil, error)
			}
			guard let data = data else { return }
			
			
			do {
				
				//5 parsing JSON
				
				let decoder = JSONDecoder()
				//let welcome = try? decoder.decode(Root.self, from: data)
				if let apiData = try? decoder.decode(Root.self, from: data){
					completionHandler(apiData,nil);
				}
				/*if let poiList = apiData.results{
				
				completionHandler(poiList,nil)
				}
				} catch let err {
				
				completionHandler(nil,error);*/
			}catch let err{
				completionHandler(nil,error);
			}
			
		})
	}
}


@objc protocol NetworkEngineProtocol {
	typealias Handler = (Data?, URLResponse?, Error?) -> Void
	
	@objc func performRequest(for url: URL, completionHandler: @escaping Handler)
}

extension URLSession: NetworkEngineProtocol {
	typealias Handler = NetworkEngineProtocol.Handler
	
	func performRequest(for url: URL, completionHandler: @escaping Handler) {
		let task = dataTask(with: url, completionHandler: completionHandler)
		task.resume()
	}
}
