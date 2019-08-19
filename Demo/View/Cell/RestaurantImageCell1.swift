//
//  RestaurantImageCellCollectionViewCell.swift
//  RestaurantListing
//
//  Created by Kaushal on 14/08/19.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
class RestaurantImageCell1: UICollectionViewCell {
	
	
	@IBOutlet weak var productImage: RoundedImageView!
	
	private(set) var disposeBag = DisposeBag()
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
	func configure(withViewModel viewModel:RestaurantItemPhotoPresentable)->(Void){
		
		
		DispatchQueue.main.async {
			
			//self.productImage.pin_updateWithProgress = true
			//self.productImage.pin_setImage(from: URL(string: viewModel.items?.icon ?? ""))
			
		}
		
		
		
	}
}

