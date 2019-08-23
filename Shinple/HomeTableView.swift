//
//  MainTableView.swift
//  Login2
//
//  Created by user on 20/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit



class HomeTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var userName = "권민재"
    var categories = ["마이페이지", "최근 시청 강의", "인기 강의", "신규 강의"]
    
    override func awakeFromNib() {
        self.delegate = self
        self.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        
        if row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeMypageTableViewCell") as! HomeMypageTableViewCell
            
            cell.userInfor()
            cell.imgPicture.image = UIImage(named: "user.png")
            
            cell.lblName.text = userName + "님, 안녕하세요!"
            
            
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCategoryTableViewCell") as! HomeCategoryTableViewCell
            let status = categories[indexPath.row]
            cell.lblCategory.text = status
            
            return cell
        }
    }


}
