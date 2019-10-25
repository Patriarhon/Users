//
//  UserTableViewCell.swift
//  Users
//
//  Created by Petr on 22.10.2019.
//  Copyright © 2019 Petr. All rights reserved.
//

import UIKit
import Kingfisher
import Alamofire
import AlamofireImage

protocol UserTableViewCellDelegate: class {
    
}

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    weak var delegate: UserTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        avatarImageView.layer.cornerRadius = 20
        avatarImageView.layer.masksToBounds = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        avatarImageView.image = nil
    }
    
    func configure(with model: UsersListModel) {
        nameLabel.text = model.name
        avatarImageView.kf.indicatorType = .activity
        avatarImageView.kf.setImage(with: model.avatarUrl)
    }
}
