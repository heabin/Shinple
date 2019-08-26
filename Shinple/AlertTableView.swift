//
//  AlertTableView.swift
//  Shinple
//
//  Created by user on 23/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit

class AlertTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    

    override func awakeFromNib() {
        self.delegate = self
        self.dataSource = self
    }
    
    //TableView cell
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlertTableViewCell") as! AlertTableViewCell
        cell.lblColor.layer.cornerRadius = cell.lblColor.frame.width / 2
        //lblcolor.layer.cornerRadius = lblcolor.frame.width / 2
        
        if row == 0 {
            cell.lblTitle.text = "댓글알림"
            cell.lblContent.text = "동영상 댓글에 답글이 달렸습니다."
            cell.lblDate.text = "19.09.09"
            
        } else if row == 1 {
            cell.lblTitle.text = "공지알림"
            cell.lblContent.text = "새로운 공지가 등록되었습니다."
            cell.lblDate.text = "19.09.08"
            
        } else {
            cell.lblTitle.text = "댓글알림"
            cell.lblContent.text = "동영상 댓글에 답글이 달렸습니다."
            cell.lblDate.text = "19.09.07"
            cell.lblColor.backgroundColor = UIColor(red: 212/255, green: 202/255, blue: 212/255, alpha:1)
        }
        
        return cell
    }

}
