//
//  TimelineViewController.swift
//  Makestagram
//
//  Created by 小林和宏 on 11/19/15.
//  Copyright © 2015 Make School. All rights reserved.
//

import UIKit
import Parse

class TimelineViewController: UIViewController {

    var photoTakingHelper: PhotoTakingHelper?
    var posts: [Post] = []

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.delegate = self
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        ParseHelper.timelineRequestForCurrentUser {
            (result: [AnyObject]?, error: NSError?) -> Void in
            self.posts = result as? [Post] ?? []
            
//            for post in self.posts {
//                let data = post.imageFile?.getData()
//                post.image = UIImage(data: data!, scale:1.0)
//            }
//            
            self.tableView.reloadData()
        }
    
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
        photoTakingHelper = PhotoTakingHelper(viewController: self.tabBarController!) { (image: UIImage?) in
            let post = Post()
            post.image.value = image!
            post.uploadPost()
        }
    }
}

extension TimelineViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PostCell") as! PostTableViewCell
        
        let post = posts[indexPath.row]
        post.downloadImage()
        cell.post = post
//        cell.postImageView.image = posts[indexPath.row].image
        
        return cell
    }
}