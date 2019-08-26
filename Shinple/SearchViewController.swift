//
//  SearchViewController.swift
//  Shinple
//
//  Created by 김기성 on 23/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UITextViewDelegate {
    
    var isSearchBarFocused = false
    var lectureArray = [String]()
    var currentLectureArray = [String]()
    
    @IBOutlet weak var btnSearchCategory: UIButton!
    @IBOutlet weak var btnSearchHashtag: UIButton!
    @IBOutlet weak var lblNoPreviousSample: UILabel!
    @IBOutlet weak var lblMainLabel: UILabel!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLectures()
        setUpSearchBar()
        self.view.bringSubviewToFront(lblMainLabel)
        self.view.bringSubviewToFront(btnSearchHashtag)
        self.view.bringSubviewToFront(btnSearchCategory)
        table.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    private func setUpSearchBar() {
        // Make back button
        let button = UIButton(frame: CGRect(x: 0, y: self.view.frame.size.height/2, width: 20, height: 100))
        button.setTitle("뒤로가기", for: .normal)
        button.backgroundColor = UIColor.lightGray
        button.addTarget(self, action: #selector(backButtonPressed(_:)), for: .touchUpInside)
        
        // link search bar delegate with self
        searchBar.delegate = self
        
        // add back button and search bar in navigation object
        self.navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: button), UIBarButtonItem(customView:searchBar)]
    }
    
    @objc private func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    
    private func setUpLectures() {
        // This is sample data!@!@
        lectureArray.append("ICT 바로알기")
        lectureArray.append("클라우드 바로알기")
        lectureArray.append("오늘 점심은 닭곰탕")
        lectureArray.append("오늘 약속은 사당역")
        lectureArray.append("불금임")
        lectureArray.append("IOS 화이팅")
        lectureArray.append("ICT 바로알기")
        lectureArray.append("클라우드 바로알기")
        lectureArray.append("오늘 점심은 닭곰탕")
        lectureArray.append("오늘 약속은 사당역")
        lectureArray.append("불금임")
        lectureArray.append("IOS 화오이팅")
        lectureArray.append("ICT 바로알기")
        lectureArray.append("클라우드 바로알기")
        lectureArray.append("오늘 점심은 닭곰탕")
        lectureArray.append("오늘 약속은 사당역")
        lectureArray.append("불금오점임")
        lectureArray.append("IOS 화이팅")
        lectureArray.append("ICT 바로알기")
        lectureArray.append("클라우드 바로알기")
        lectureArray.append("오늘 점심은 닭곰탕")
        lectureArray.append("오늘 약속은 사당역")
        lectureArray.append("불금점점임")
        lectureArray.append("IOS 화이점점팅")

        currentLectureArray = lectureArray
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentLectureArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? SearchTableViewCell else {
            return UITableViewCell()
        }
        cell.lblLecture.text = currentLectureArray[indexPath.row]
        if isSearchBarFocused == false {
            searchBar.showsCancelButton = false
            cell.isHidden = true
        } else {
            searchBar.showsCancelButton = true
            cell.isHidden = false
        }
        return cell
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    // called when text starts editing
    @available(iOS 2.0, *)
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isSearchBarFocused = true
        self.searchBar.showsCancelButton = true
        self.view.bringSubviewToFront(lblNoPreviousSample)
        print("searchBarTextDidBeginEditing")
    }

    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            self.view.bringSubviewToFront(lblNoPreviousSample)
            table.isHidden = true
            currentLectureArray = lectureArray
            table.reloadData()
            return
        }
        table.isHidden = false
        self.view.bringSubviewToFront(table)
        currentLectureArray = lectureArray.filter({ lecture -> Bool in
            lecture.lowercased().contains(searchText.lowercased())
        })
        table.reloadData()
    }
    
    // called when cancel button pressed
    @available(iOS 2.0, *)
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearchBarFocused = false
        table.reloadData()
        self.view.bringSubviewToFront(lblMainLabel)
        self.view.bringSubviewToFront(btnSearchHashtag)
        self.view.bringSubviewToFront(btnSearchCategory)
        searchBar.endEditing(true)
        self.searchBar.text = ""
        self.searchBar.showsCancelButton = false
    }

    
}

class lecture {
    let title: String
    init(_ title:String) {
        self.title = title
    }
}
