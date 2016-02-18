//
//  ViewController.swift
//  AwesomeiOSPresentation
//
//  Created by Lucas Farah on 2/17/16.
//  Copyright © 2016 Lucas Farah. All rights reserved.
//

import UIKit
import TGCameraViewController

class ViewController: UIViewController,TGCameraDelegate {
  
  
  @IBOutlet weak var butImage: UIButton!
  @IBAction func butImage(sender: AnyObject)
  {
    let navigationController = TGCameraNavigationController.newWithCameraDelegate(self)
    self.presentViewController(navigationController, animated: true, completion: nil)
  }
  
  //MARK: TGCameraDelegate required
  func cameraDidCancel()
  {
    self.dismissViewControllerAnimated(true, completion: nil)
  }
  
  func cameraDidTakePhoto(image: UIImage!)
  {
    self.butImage.setTitle("", forState: .Normal)
    self.butImage.setBackgroundImage(image, forState: .Normal)
    
    self.dismissViewControllerAnimated(true, completion: nil)
    
    SweetAlert().showAlert("Good job!", subTitle: "You added a photo!", style: AlertStyle.Success)
  }
  
  func cameraDidSelectAlbumPhoto(image: UIImage!)
  {
    self.dismissViewControllerAnimated(true, completion: nil)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
}

