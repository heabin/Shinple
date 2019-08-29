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
        setupGradientLayer()
        
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupGradientLayer(){
        let colorStartBlue = UIColor(red: 37/255, green: 97/255, blue: 166/255, alpha: 1)
        let colorMiddleBlue = UIColor(red: 45/255, green: 132/255, blue: 194/255, alpha: 1)
        let colorEndBlue = UIColor(red: 53/255, green: 169/255, blue: 223/255, alpha: 1)
        let gradientLayer = CAGradientLayer()
        
        
        
        var bounds = lblColor.bounds
        bounds.size.height = UIApplication.shared.statusBarFrame.size.height*2
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorStartBlue.cgColor, colorMiddleBlue.cgColor, colorEndBlue.cgColor]
        gradientLayer.locations = [0.1,0.5,1.0]
        
        lblColor.layer.addSublayer(gradientLayer)
    }

}
