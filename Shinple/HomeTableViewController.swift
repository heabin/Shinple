//
//  HomeTableViewController.swift
//  Shinple
//
//  Created by user on 26/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    var userName = "권민재"
    var categories = ["마이페이지", "최근 시청 강의", "인기 강의", "신규 강의"]
    
    //TableView cell
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = indexPath.row
        
        if row == 0 {
            return 120
        } else {
            return 160
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
            cell.collectionView.tag = indexPath.row
            cell.btnSeeMore.addTarget(self, action: #selector(goToPage), for: .touchUpInside)
            
            return cell
        }
    }
    
    @objc func goToPage() {
        performSegue(withIdentifier: "goToLibrary", sender: nil)
    }

}
