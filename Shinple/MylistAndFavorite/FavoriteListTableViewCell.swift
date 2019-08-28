//
//  FavoritListTableViewCell.swift
//  Shinple
//
//  Created by user on 27/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit

class FavoriteListTableViewCell: UITableViewCell {

    @IBOutlet weak var imgVideo: UIImageView!
    @IBOutlet weak var imgFavorite: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblContent: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblWatchingTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
