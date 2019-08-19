//
//  RestaurantListingCell.swift
//  Demo
//
//  Created by Kaushal on 18/08/19.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import CoreLocation
import RxCocoa
import RxSwift
import PINRemoteImage
import PINCache
class RestaurantListingCell: UITableViewCell {
	
	private(set) var disposeBag = DisposeBag()
	@IBOutlet weak var labelTitle: UILabel!
	
	@IBOutlet weak var labelAddress: UILabel!
	@IBOutlet weak var restaurantImage: UIImageView!
	
	@IBOutlet weak var labelRatings: UILabel!
	@IBOutlet weak var collectionView_: UICollectionView!
	var viewModelPhoto: RestaurantItemPhotoViewModel!
	//var photos:Variable<[RestaurantItemPhotoPresentable]> = Variable([])
	@IBOutlet weak var imagePlaceholderView: UIView!
	var photos:[Photo]?
	let cellIdentifier = "RestaurantImageCell"
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
		collectionViewSetup();
		self.collectionView_.dataSource = self;
	}
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	override func layoutSubviews() {
		super.layoutSubviews()
		//imagePlaceholderView.layer.cornerRadius = imagePlaceholderView.bounds.width/2
	}
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		
		// Configure the view for the selected state
	}
	
	// to avoid multiple outdated subscriptions on cell reuse
	override func prepareForReuse() {
		super.prepareForReuse()
		disposeBag = DisposeBag()
		
	}
	
	func collectionViewSetup(){
		let nib = UINib.init(nibName: NIB_Name.RestaurantImageViewCell, bundle: nil)
		self.collectionView_.register(nib, forCellWithReuseIdentifier: cellIdentifier)
		//self.collectionView_.separatorStyle = .singleLine;
		
		//tableViewCabList.estimatedRowHeight = 266
		//tableViewCabList.rowHeight = UITableView.automaticDimension
		
	}
	/*!
	@discussion This function is to configure your cell using view model
	*@params viewModel
	*@return Void
	*/
	/**
	* This function is used to configure cell accepts parameter of type CabItemPresentable
	*/
	func configure(withViewModel viewModel:RestaurantItemPresentable)->(Void){
		
		
		DispatchQueue.main.async {
			self.labelTitle.text = viewModel.items?.name
			self.labelAddress.text = viewModel.items?.vicinity
			
			if let ratings = viewModel.items?.rating{
				self.labelRatings.text = String.init(format: "%0.1f", ratings)
			}
			self.restaurantImage.pin_updateWithProgress = true
			self.restaurantImage.pin_setImage(from: URL(string: viewModel.items?.icon ?? ""))
			if let photo = viewModel.items?.photos{
				self.photos = photo;
				
			}
			self.collectionView_.reloadData()
		}
	}
	
}

extension RestaurantListingCell: UICollectionViewDataSource{
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1;
	}
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return  self.photos?.count ?? 0
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)as! RestaurantImageCell;
		let object = self.photos?[indexPath.item];
		let photoReferece = object?.photoReference ?? "";
		let urlOfImage = String.init(format: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=%@&key=%@",photoReferece,GoogleKeys.KEY_GOOGLE_MAP_SERVER_KEY );
		
		cell.restaurantImage.pin_updateWithProgress = true
		cell.restaurantImage.pin_setImage(from: URL(string: urlOfImage)!)
		
		return cell;
	}
	
	
}
	
	
	
	/*extension RestaurantTableViewCell: GradientsOwner {
	var gradientLayers: [CAGradientLayer] {
	return [titlePlaceholderView.gradientLayer, subtitlePlaceholderView.gradientLayer]
	}
	}
	*/
	
	
	
	
	extension UIColor {
		func brightened(by factor: CGFloat) -> UIColor {
			var h: CGFloat = 0, s: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
			getHue(&h, saturation: &s, brightness: &b, alpha: &a)
			return UIColor(hue: h, saturation: s, brightness: b * factor, alpha: a)
		}
}
