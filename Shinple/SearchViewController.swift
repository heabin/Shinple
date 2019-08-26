//
//  SearchViewController.swift
//  Shinple
//
//  Created by 김기성 on 23/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UITextViewDelegate {
    

    var lectureArray = [String]()
    var currentLectureArray = [String]()
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let navBarButton = UIBarButtonItem(customView:searchBar)
//        self.navigationItem.leftBarButtonItem = navBarButton
//        let sampleButton = UIBarButtonItem()
//        self.navigationItem.leftBarButtonItems?.append(sampleButton)
        setUpLectures()
        setUpSearchBar()
//        view.frame = CGRect(x: keyWindow.frame.width - 10, y: keyWindow.frame.height, width: 10, height: 10)
    }
    
    private func setUpSearchBar() {
        searchBar.delegate = self
    }
    
    private func setUpLectures() {
        lectureArray.append("ICT 바로알기")
        lectureArray.append("클라우드 바로알기")
        lectureArray.append("오늘 점심은 닭곰탕")
        lectureArray.append("오늘 약속은 사당역")
        lectureArray.append("불금임")
        lectureArray.append("IOS 화이팅")
        
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
        return cell
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            currentLectureArray = lectureArray
            table.reloadData()
            return
        }
        print(String(searchBar.isFocused))
        currentLectureArray = lectureArray.filter({ lecture -> Bool in
            lecture.lowercased().contains(searchText.lowercased())
        })
        table.reloadData()
    }
    
    
//    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
//
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

class lecture {
    let title: String
    
    init(_ title:String) {
        self.title = title
    }
}
