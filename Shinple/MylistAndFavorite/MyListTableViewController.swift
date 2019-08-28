//
//  MylistTableViewController.swift
//  Shinple
//
//  Created by user on 27/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit

class MyListTableViewController: UITableViewController {
    
    var titles: String = "제목입니다."
    var contents: String = "There is a content about the video.You can see the video if you click the image."
    var date: String = "19.09.09"
    var number: Int = 80
    
    var imagieFiles = ["video.png", "video2.png", "video3.png", "video4.png", "video5.png","video.png", "video2.png", "video3.png", "video4.png", "video5.png"]
    
    let heartEmpty = UIImage(named: "heart_empty.png")
    let heartFull = UIImage(named: "heart_full.png")

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return imagieFiles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyListTableViewCell") as! MyListTableViewCell
        
        cell.lblTitle.text = titles
        cell.lblDate.text = date
        cell.lblWatchingTime.text = "진행률: " + String(number) + " %"
        cell.lblContent.text = contents
        

        cell.imgVideo.image = UIImage(named: imagieFiles[indexPath.row])
        cell.imgVideo.translatesAutoresizingMaskIntoConstraints = true

        if indexPath.row % 2 == 0 {
            cell.imgFavorite.image = heartFull
        }else {
            cell.imgFavorite.image = heartEmpty
        }
        
        return cell
    }


}
