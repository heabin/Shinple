//
//  FavoriteListTableViewController.swift
//  Shinple
//
//  Created by user on 27/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit

class FavoriteListTableViewController: UITableViewController {
    
    var titles: String = "제목입니다."
    var contents: String = "There is a content about the video.You can see the video if you click the image."
    var date: String = "19.09.09"
    var number: Int = 80
    
    var imagieFiles = ["video5.png","video.png", "video2.png"]
    
    let heartEmpty = UIImage(named: "heart_empty.png")
    let heartFull = UIImage(named: "heart_full.png")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return imagieFiles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteListTableViewCell") as! FavoriteListTableViewCell
        
        cell.lblTitle.text = titles
        cell.lblDate.text = date
        cell.lblWatchingTime.text = "진행률: " + String(number) + " %"
        cell.lblContent.text = contents
        
        
        cell.imgVideo.image = UIImage(named: imagieFiles[indexPath.row])
        cell.imgVideo.translatesAutoresizingMaskIntoConstraints = true
        
        cell.imgFavorite.image = heartFull
        
        return cell
    }


}
