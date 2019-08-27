//
//  MainTableViewCell.swift
//  Login2
//
//  Created by user on 20/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit


class HomeMypageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgPicture: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblSentence: UILabel!
    @IBOutlet weak var lblColor: UILabel!
    
    
    
    func userInfor() {
        imgPicture.layer.cornerRadius = imgPicture.frame.width / 2
        imgPicture.layer.borderWidth = 1
        imgPicture.layer.borderColor = UIColor.lightGray.cgColor
        
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
