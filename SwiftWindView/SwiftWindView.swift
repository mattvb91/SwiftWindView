//
//  SwiftWindView.swift
//  SwiftWindView
//
//  Created by Matthias von Bargen on 09/11/2017.
//  Copyright © 2017 Matthias von Bargen. All rights reserved.
//

import UIKit

class SwiftWindView : UIView {
	
	var windSpeed = 1
	var pressure = 1
	var unit = "km/h"
	
	var mainView = UIView()
	
	var largeBladeImageView = UIImageView()
	var largePoleImageView = UIImageView()
	
	var smallBladeImageView = UIImageView()
	var smallPoleImageView = UIImageView()
	
	var windLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
	var barometerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
	var windspeedLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
	var pressureLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 30))

	init(windSpeed: Int, pressure: Int, unit: String) {
		self.init()
		
		self.windSpeed = windSpeed
		self.pressure = pressure
		self.unit = unit
		
		self.setNeedsDisplay()
	}
	
	func setTextColor(color: UIColor)
	{
		self.windspeedLabel.textColor = color
		self.pressureLabel.textColor = color
	}
	
	//Refresh with the values passed in constructor
	override func setNeedsDisplay() {
		windspeedLabel.text = String(self.windSpeed) + " " + self.unit
		pressureLabel.text = String(self.pressure)
		
		super.setNeedsDisplay()
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		windLabel.text = "Wind"
		windLabel.textColor = UIColor.white
		windLabel.font = UIFont(name: "Aerial", size: 25)
		
		barometerLabel.text = "Barometer"
		barometerLabel.textColor = UIColor.white
		barometerLabel.font = UIFont(name: "Aerial", size: 25)

		windspeedLabel.text = String(self.windSpeed) + " " + self.unit
		windspeedLabel.textColor = UIColor.white
		windspeedLabel.font = UIFont.boldSystemFont(ofSize: 30)

		pressureLabel.text = String(self.pressure)
		pressureLabel.textColor = UIColor.white
		pressureLabel.font = UIFont.boldSystemFont(ofSize: 30)
		pressureLabel.textAlignment = .center
		
		mainView.addSubview(windLabel)
		mainView.addSubview(barometerLabel)
		mainView.addSubview(self.windspeedLabel)
		mainView.addSubview(self.pressureLabel)
		
		let bladeImage = UIImage(named: "Blade")!
		let poleImage = UIImage(named: "Pole")!
		
		self.largeBladeImageView = UIImageView(image: bladeImage)
		self.largePoleImageView = UIImageView(image: poleImage)
		
		self.smallBladeImageView = UIImageView(image: bladeImage)
		self.smallPoleImageView = UIImageView(image: poleImage)
		
		mainView.addSubview(self.largeBladeImageView)
		mainView.addSubview(self.largePoleImageView)
		
		mainView.addSubview(self.smallPoleImageView)
		mainView.addSubview(self.smallBladeImageView)
		
		self.layer.backgroundColor = UIColor.lightGray.cgColor
		self.addSubview(mainView)
	
		setNeedsUpdateConstraints()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	/**
	 * Align the blades with poles
	 */
	override func updateConstraints() {
		largeBladeImageView.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
		largePoleImageView.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
		
		smallBladeImageView.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
		smallPoleImageView.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
		
		self.largePoleImageView.center.x = self.largeBladeImageView.center.x
		self.largePoleImageView.center.y = self.largeBladeImageView.center.y + ((self.largeBladeImageView.image?.size.height)! / 2) - 50
		
		self.smallPoleImageView.center.x = self.largeBladeImageView.center.x + 40
		self.smallPoleImageView.center.y = self.largePoleImageView.center.y + 20
		
		self.smallBladeImageView.center.x = self.smallPoleImageView.center.x
		self.smallBladeImageView.center.y = self.smallPoleImageView.center.y - 20
		
		self.windLabel.center = CGPoint(x: self.largePoleImageView.center.x + 180, y: self.largePoleImageView.center.y - 80)
		self.windspeedLabel.center = CGPoint(x: windLabel.center.x, y: self.windLabel.center.y + 30)
		
		self.barometerLabel.center = CGPoint(x: windLabel.center.x, y: self.windspeedLabel.center.y + 50)
		self.pressureLabel.center = CGPoint(x: self.largePoleImageView.center.x + 90, y: self.barometerLabel.center.y + 30)
		
		rotate360Degrees(view: self.largeBladeImageView)
		rotate360Degrees(view: self.smallBladeImageView)

		super.updateConstraints()
	}
	
	private func rotate360Degrees(view: UIView, duration: CFTimeInterval = 1.0, completionDelegate: AnyObject? = nil) {
		let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
		
		rotateAnimation.fromValue = 0.0
		rotateAnimation.toValue = 360
		rotateAnimation.duration = 200
		rotateAnimation.repeatCount = .infinity
		
		if let delegate: AnyObject = completionDelegate {
			rotateAnimation.delegate = delegate as? CAAnimationDelegate
		}
		
		view.layer.add(rotateAnimation, forKey: nil)
	}
}
