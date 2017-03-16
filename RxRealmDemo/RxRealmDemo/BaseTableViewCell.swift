//
//  BaseTableViewCell.swift
//  Vovo
//
//  Created by Arun Jangid on 2/11/17.
//  Copyright © 2017 Arun Jangid. All rights reserved.
//

import UIKit
import IBAnimatable

class BaseTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: AnimatableImageView!
    @IBOutlet weak var userName : AnimatableLabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var unreadCount: AnimatableLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
