//
//  GroupUserCollectionViewCell.swift
//  Vovo
//
//  Created by Arun Jangid on 2/11/17.
//  Copyright © 2017 Arun Jangid. All rights reserved.
//

import UIKit

class GroupUserCollectionViewCell: UICollectionViewCell {
 
    @IBOutlet var userProfilePic: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var datasource: GroupMember{
        get {
            return self.datasource
        }
        set{
////            if (newValue.userPhoto?.letterize().count)! > 0 {
//                let url = URL(string: newValue.userPhoto!)!
//                let placeholderImage = UIImage(named: "profilePic")!
//                
//                userProfilePic.af_setImage(withURL: url, placeholderImage: placeholderImage)
//            }

        }
    }
    
}
