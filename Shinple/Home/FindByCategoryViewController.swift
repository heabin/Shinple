//
//  FindByCategoryViewController.swift
//  Shinple
//
//  Created by 김기성 on 29/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit

class FindByCategoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let darkBlue = UIColor(red: 11/255, green: 25/255, blue: 102/255, alpha: 1)
    let lightGray = UIColor(red: 89/255, green: 89/255, blue: 89/255, alpha: 1)

    
    var sampleData = [
        "ICT", "영어", "중국어", "기업윤리", "사내문화",
        "ICT", "영어", "중국어", "기업윤리", "사내문화",
        "ICT", "영어", "중국어", "기업윤리", "사내문화",
        "ICT", "영어", "중국어", "기업윤리", "사내문화",
        "ICT", "영어", "중국어", "기업윤리", "사내문화",
    ]
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.showsVerticalScrollIndicator = false
        table.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = table.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! FindByCategoryViewCell
        cell.btnCategory.setTitle(sampleData[indexPath.row], for: .normal)
        cell.btnCategory.setTitleColor(darkBlue, for:.normal)
        return cell
    }
    
    // MARK: clicked action
    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(sampleData[indexPath.row])
    }


}

class FindByCategoryViewCell: UITableViewCell {
    
    @IBOutlet weak var btnCategory: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
