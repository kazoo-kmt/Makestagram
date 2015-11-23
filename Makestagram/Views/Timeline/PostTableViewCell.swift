//
//  PostTableViewCell.swift
//  Makestagram
//
//  Created by 小林和宏 on 11/22/15.
//  Copyright © 2015 Make School. All rights reserved.
//

import UIKit
import Bond

class PostTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likesIconImageView: UIImageView!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var moreButton: UIButton!
    
    @IBAction func moreButtonTapped(sender: AnyObject) {
    }
    
    @IBAction func likeButtonTapped(sender: AnyObject) {
    }
    
    var post: Post? {
        didSet {
            if let post = post {
                // bind the image of the post to the 'postImage' view
                post.image.bindTo(postImageView.bnd_image)
            }
        }
    }

    @IBOutlet weak var postImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
