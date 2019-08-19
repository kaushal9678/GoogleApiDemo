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
	var photos:Variable<[RestaurantItemPhotoPresentable]> = Variable([])
	@IBOutlet weak var imagePlaceholderView: UIView!
	
	let cellIdentifier = "RestaurantImageCell"
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
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
			
			
			
			/*self.photos.value = viewModel.items!.photos.map({ (items)  in
				RestaurantItemPhotoViewModel(items: items)
				
			})*/
			if let photo = viewModel.items?.photos{
				for object in photo{
					self.photos.value = RestaurantItemPhotoViewModel(items: object as Photo)
				}
			}
			
			viewModel.items.asObservable().bind(to:tableViewCabList.rx.items(cellIdentifier:cellIdentifier,cellType:RestaurantListingCell.self)){index,item,cell in
				
				cell.configure(withViewModel: item)
				
				}.disposed(by: disposeBag)
		}
		
		
		
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
