//
//  QuestionTableView.swift
//  Shinple
//
//  Created by user on 26/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit

class QuestionTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    let send = UIImage(named: "send")
    let recive = UIImage(named: "send2")
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionTableViewCell") as! QuestionTableViewCell
        
        if row == 0 {
            cell.lblTitle.text = "받은쪽지"
            cell.lblContent.text = "안녕하세요. 문의사항 답변드립니다."
            cell.lblDate.text = "19.09.09  09:05"
            cell.imgState.image = send
            
        } else if row == 1 {
            cell.lblTitle.text = "받은쪽지"
            cell.lblContent.text = "안녕하세요. 문의사항 답변드립니다."
            cell.lblDate.text = "19.09.08  15:03"
            cell.imgState.image = send
            
        } else {
            cell.lblTitle.text = "보낸쪽지"
            cell.lblContent.text = "동영상 재생이 되지 않아요. 개발을 이런식으로"
            cell.lblDate.text = "19.09.01   13:01"
            cell.imgState.image = recive
        }
        
        return cell
    }
}
    

