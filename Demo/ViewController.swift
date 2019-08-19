//
//  ViewController.swift
//  Demo
//
//  Created by Kaushal on 16/08/19.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
class ViewController: UIViewController {
	@IBOutlet weak var tableViewCabList: UITableView!
	let cellIdentifier = "RestaurantListingCell"
	
		//1 -
		@IBOutlet var viewModel: RestaurantListingViewModel!
		
		@IBOutlet weak var labelTitle: UILabel!
		
		@IBOutlet weak var btnBookCab: UIButton!
		let disposeBag = DisposeBag()
		
		
		//MARK: View Life Cycle
		override func viewDidLoad() {
			super.viewDidLoad()
			
			// Do any additional setup after loading the view.
			
			tableViewSetup();
			//addOverView()
			
			viewModel.items.asObservable().bind(to:tableViewCabList.rx.items(cellIdentifier:cellIdentifier,cellType:RestaurantListingCell.self)){index,item,cell in
				
				cell.configure(withViewModel: item)
				
				}.disposed(by: disposeBag)
		}
		
		
		override func viewDidAppear(_ animated: Bool) {
			super.viewDidAppear(animated)
			
			// Get data of predifined boundries of hamsburg through API
			
			if Reachability.isConnectedToNetwork(){
				viewModel?.getPOI(completion: {
					self.tableViewCabList.reloadData()
					DispatchQueue.main.async {
						//SVProgressHUD.dismiss()
						self.view.isUserInteractionEnabled = true
						
					}
				})
			}else{
				let okAlert = SingleButtonAlert(
					title: "Network Issue",
					message: "Could not connect to server. Check your network and try again later.",
					action: AlertAction(buttonTitle: "OK", handler: { print("Ok pressed!") })
				)
				self.presentSingleButtonDialog(alert: okAlert)
			}
		}
		override func viewDidDisappear(_ animated: Bool) {
			super.viewDidDisappear(animated)
		}
		
		override func viewWillDisappear(_ animated: Bool) {
			super.viewWillDisappear(animated)
			
			
		}
		
	
		//MARK: View set
		/*!
		@discussion This function used for table setup
		@param
		@return Void
		*/
		func tableViewSetup(){
			let nib = UINib.init(nibName: NIB_Name.RestaurantTableViewCell, bundle: nil)
			self.tableViewCabList.register(nib, forCellReuseIdentifier: cellIdentifier)
			self.tableViewCabList.separatorStyle = .singleLine;
			
			//tableViewCabList.estimatedRowHeight = 266
			tableViewCabList.rowHeight = UITableView.automaticDimension
			
		}
		
		//MARK: Button Actions
		//MARK: Button Book Cab Action
		/// this button action redirects user to Map page where he can see available cab(s) in their area.
		@IBAction func btnBookCabAction(_ sender: UIButton) {
			
			self.performSegue(withIdentifier: Segue.POI_VC, sender: self)
			
		}
		
		
	
	}
	
	
	extension ViewController :UITableViewDelegate{
		// MARK: Protocol Conformance | UITableViewDelegate
		func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
			let restauranttableViewCell = cell as! RestaurantListingCell
			//restauranttableViewCell.slide(to: .right)
		}
		func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
			return 266;
		}
	}

	extension ViewController: SingleButtonDialogPresenter { }
