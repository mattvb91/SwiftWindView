//
//  ViewController.swift
//  SwiftWindView
//
//  Created by Matthias von Bargen on 09/11/2017.
//  Copyright © 2017 Matthias von Bargen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		let windview = SwiftWindView(windSpeed: 8, pressure: 2, unit: "km/h")
		
		let frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 220)
		windview.frame = frame
				
		self.view.addSubview(windview)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

