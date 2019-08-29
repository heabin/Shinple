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
    }

    // MARK: - Table view data source

    var userName = "권민재"
    var categories = ["마이페이지", "최근 시청 강의", "인기 TOP5", "관심태그 강의","신규 강의"]
    
    //TableView cell
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = indexPath.row
        
        if row == 0 {
            return 80
        } else {
            return 160
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
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
            if row == 1 {
                cell.btnSeeMore.addTarget(self, action: #selector(goToPageLibrary), for: .touchUpInside)
            } else {
                cell.btnSeeMore.addTarget(self, action: #selector(goToPageList), for: .touchUpInside)
            }
            return cell
        }
    }
    
    @objc func goToPageLibrary() {
        performSegue(withIdentifier: "goToLibrary", sender: nil)
    }
    
    @objc func goToPageList() {
        performSegue(withIdentifier: "goToList", sender: nil)
    }
    
    func goToDetailPage() {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "videoDetails")
        UIApplication.topViewController()!.present(viewController, animated: true, completion: nil)
    }
    
}

extension UIApplication {
    class func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
}
