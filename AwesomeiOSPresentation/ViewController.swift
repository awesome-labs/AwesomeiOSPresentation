//
//  ViewController.swift
//  AwesomeiOSPresentation
//
//  Created by Lucas Farah on 2/17/16.
//  Copyright © 2016 Lucas Farah. All rights reserved.
//

//MARK: - Libraries
import UIKit
import Gifu
import Alamofire
import EZLoadingActivity

class ViewController: UIViewController {

	// MARK: - Outlets
	@IBOutlet weak var txtGif: UITextField!
	@IBOutlet weak var imgvGif: AnimatableImageView!

	// MARK: - Buttons
	@IBAction func searchTapped(sender: AnyObject) {

		// Showing Loader
		showLoader()

		// Parse Textfield text
        var gifName = txtGif.text!.stringByReplacingOccurrencesOfString(" ", withString: "+")
        gifName += "+cat"
        
		// Request GIF
        requestGif(gifName)
	}

	// MARK: - Methods
    func requestGif(name: String) {

		let parameters = ["q": name, "api_key": "dc6zaTOxFJmzC", "rating": "pg-13"]

		Alamofire.request(.GET, "http://api.giphy.com/v1/gifs/search", parameters: parameters)
			.responseJSON { response in

				// Generate Random number
                let randomNumber = Int(arc4random_uniform(6) + 1)

				// Parse JSON
				if let JSON = response.result.value, url = JSON["data"]!![randomNumber]["images"]!!["fixed_height"]!!["url"] as? String {

					// Print URL
					print(url)

					// Show GIF
					self.showGif(url)

					// Stop Loader
					self.hideLoader()

				}
		}
	}

	// GIFU
	func showGif(urlString: String) {

		if let url = NSURL(string: urlString), data = NSData(contentsOfURL: url) {

			// Gifu Method
			self.imgvGif.animateWithImageData(data)
		}
	}

	// MARK: EZLoadingActivity methods
	func showLoader() {

		EZLoadingActivity.show("Loading \(txtGif.text!) cat GIF", disableUI: true)
	}

	func hideLoader() {

		EZLoadingActivity.hide(success: true, animated: true)
	}

	// MARK: - ETC
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.

	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

}

