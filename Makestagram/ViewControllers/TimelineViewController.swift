//
//  TimelineViewController.swift
//  Makestagram
//
//  Created by 小林和宏 on 11/19/15.
//  Copyright © 2015 Make School. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {

    var photoTakingHelper: PhotoTakingHelper?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.delegate = self
    }
}

    // MARK: Tab Bar Delegate

extension TimelineViewController: UITabBarControllerDelegate {
        
    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        if (viewController is PhotoViewController) {
            takePhoto()
            return false
        } else {
            return true
        }
            
    }
    
    func takePhoto() {
     // instantiate photo taking class, provide callback for when photo is selected
        let photoTakingHelper = PhotoTakingHelper(viewController: self.tabBarController!) { (image: UIImage?) in
            print("received a callback")
            // don't do anthing, yet...
        }
    }
}