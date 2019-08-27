//
//  MainCategoryTableViewCell.swift
//  Login2
//
//  Created by user on 20/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit

class HomeCategoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var collectionView: HomeCollectionView!
    @IBOutlet weak var btnSeeMore: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
