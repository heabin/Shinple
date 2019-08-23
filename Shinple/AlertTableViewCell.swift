//
//  AlerTableViewCell.swift
//  Shinple
//
//  Created by user on 23/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit

class AlertTableViewCell: UITableViewCell {

    //@IBOutlet weak var lblcolor: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblContent: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblColor: UIImageView!
    
    func layout() {
        lblColor.layer.cornerRadius = lblColor.frame.width / 2
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
