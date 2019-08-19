//
//  DesignableView.swift
//  Demo
//
//  Created by Kaushal on 18/08/19.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class RoundedCornersView: UIView {
	
	@IBInspectable var cornerRadius: CGFloat = 0 {
		didSet {
			layer.cornerRadius = cornerRadius
			
			layer.masksToBounds = cornerRadius > 0
		}
	}
	@IBInspectable var borderWidth: CGFloat = 0 {
		didSet {
			layer.borderWidth = borderWidth
			//layer.borderWidth = 1
			//layer.cornerRadius = 3
			layer.borderColor = UIColor.init(red: 249.0/255.0, green: 249.0/255.0, blue: 249.0/255.0, alpha: 1.0) .cgColor
			layer.masksToBounds = borderWidth > 0
		}
	}
	
}
@IBDesignable
class RoundedButton: UIButton {
	@IBInspectable var cornerRadius:CGFloat = 0{
		didSet{
			layer.cornerRadius = cornerRadius;
			layer.masksToBounds = cornerRadius>0
			
		}
	}
}
@IBDesignable
class RoundedImageView: UIImageView {
	@IBInspectable var cornerRadius:CGFloat = 0{
		didSet{
			layer.cornerRadius = cornerRadius;
			layer.masksToBounds = cornerRadius>0
		}
	}
}
@IBDesignable
class RoundedTextField: UITextField {
	@IBInspectable var cornerRadius:CGFloat = 0{
		didSet{
			layer.cornerRadius = cornerRadius;
			layer.borderColor = UIColor.black.cgColor;
			layer.masksToBounds = cornerRadius>0
			
		}
	}
}
