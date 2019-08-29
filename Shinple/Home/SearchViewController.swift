//
//  SearchViewController.swift
//  Shinple
//
//  Created by 김기성 on 23/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UITextViewDelegate {
    
    let colorLightGray = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
    
    let colorStartBlue = UIColor(red: 37/255, green: 97/255, blue: 166/255, alpha: 1)
    let colorMiddleBlue = UIColor(red: 45/255, green: 132/255, blue: 194/255, alpha: 1)
    let colorEndBlue = UIColor(red: 53/255, green: 169/255, blue: 223/255, alpha: 1)

    var isSearchBarFocused = false
    var lectureArray = [String]()
    var currentLectureArray = [String]()
    var searchedBefore = [String?]()
    struct cgFloatInt {
        var width: Int
        var height: Int
        var widthSpacing: Int
        var heightSpacing: Int
        var buttonSizing: Int
        init(w: Int, h:Int, ws:Int, hs:Int, bs:Int) {
            width = w
            height = h
            widthSpacing = ws
            heightSpacing = hs
            buttonSizing = bs
        }
    }
    var custom: cgFloatInt = cgFloatInt(w: 25, h: 30, ws: 200, hs:35, bs:100)
    

    @IBOutlet weak var searchedScrollView: UIScrollView!
    @IBOutlet weak var btnSearchCategory: UIButton!
    @IBOutlet weak var btnSearchHashtag: UIButton!
    @IBOutlet weak var lblNoPreviousSample: UILabel!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    
    //-------------viewDidLoad-------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSampleData()
        loadMain()
        setUpSearchBar()
        self.view.bringSubviewToFront(btnSearchHashtag)
        self.view.bringSubviewToFront(btnSearchCategory)
        table.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    
    
    //-------------최근 검색 리스트-------------
    func setSearchedList() {
        let subViews = searchedScrollView.subviews
        for subview in subViews{
            subview.removeFromSuperview()
        }

        var heightY = CGFloat(custom.height)
        let width = CGFloat(custom.widthSpacing)
        let rowSizeLeft = UIScreen.main.bounds.maxX * 1.8
        let label = UILabel()
        label.text = "     최근 검색내역입니다"
        label.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height:25)
        searchedScrollView.addSubview(label)
        label.font = UIFont.systemFont(ofSize: 12)
        label.backgroundColor = colorLightGray
        label.textColor = UIColor.black

        for index in 0..<searchedBefore.count {
            setSearched(x: UIScreen.main.bounds.size.width/4, y: heightY, message: searchedBefore[index], rowSize: rowSizeLeft, width: width, index:index)
            heightY += CGFloat(custom.heightSpacing)
        }
        
        let button = UIButton()
        button.frame = CGRect(origin: CGPoint(x: UIScreen.main.bounds.size.width/2-CGFloat(custom.buttonSizing/2), y:heightY+CGFloat(10)), size: CGSize(width: custom.buttonSizing, height: custom.height))

        searchedScrollView.addSubview(button)
        button.backgroundColor = colorEndBlue
        button.setTitle("전체삭제", for: .normal)
        button.layer.cornerRadius = 10
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.addTarget(self, action: #selector(deleteSearchedAll), for: .touchUpInside)
    }
    
    
    
    //-------------최근 검색 리스트-------------
    
    func setSearched(x: CGFloat, y: CGFloat!, message: String!, rowSize: CGFloat!, width: CGFloat, index:Int) {
        let labelButton = UIButton()
        labelButton.setTitle(message, for: .normal)
        labelButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        labelButton.frame = CGRect(origin:CGPoint(x: x-CGFloat(5), y: y), size: CGSize(width: width, height: 20))
        labelButton.addTarget(self, action: #selector(clickedSearched), for:.touchUpInside)
        labelButton.setTitleColor(UIColor.black, for: .normal)
        searchedScrollView.addSubview(labelButton)

        let button = UIButton()
        button.frame = CGRect(origin: CGPoint(x: x+width, y:y), size: CGSize(width: 20, height: 20))
        button.setImage(UIImage(named: "icons8-delete-50.png"), for: .normal)
        searchedScrollView.addSubview(button)
        button.imageEdgeInsets = UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
        button.addTarget(self, action: #selector(deleteSearched), for: .touchUpInside)
        button.tag = index
    }
    
    
    @objc func clickedSearched(sender: UIButton) {
        print(sender.currentTitle!)
    }
    
    
    @objc func deleteSearched(sender: UIButton) {
        let index = sender.tag
        searchedBefore.remove(at: index)
        if searchedBefore.isEmpty {
            self.view.bringSubviewToFront(lblNoPreviousSample)
        } else {
            setSearchedList()
        }
    }
    
    
    @objc func deleteSearchedAll() {
        searchedBefore.removeAll()
        self.view.bringSubviewToFront(lblNoPreviousSample)
    }

    
    private func loadMain() {
        btnSearchCategory.backgroundColor = colorLightGray
        btnSearchCategory.setTitleColor(UIColor.black, for: .normal)
        btnSearchHashtag.backgroundColor = colorLightGray
        btnSearchHashtag.setTitleColor(UIColor.black, for: .normal)

        lblNoPreviousSample.text = "최근 검색결과가 없습니다"
        lblNoPreviousSample.textColor = .black
        lblNoPreviousSample.font.withSize(CGFloat(12))
        lblNoPreviousSample.backgroundColor = .white
        if !searchedBefore.isEmpty {
            self.view.bringSubviewToFront(searchedScrollView)
            setSearchedList()
        }
    }
    
    
    //-------------Bar 셋팅&기능-------------
    
    private func setUpSearchBar() {
        // Make back button
        let button = UIButton(frame: CGRect(x: 0, y: self.view.frame.size.height/2, width: 20, height: 100))
        button.setImage(UIImage(named: "0_home_20_white.png"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        button.addTarget(self, action: #selector(backButtonPressed(_:)), for: .touchUpInside)
        
        // link search bar delegate with self
        searchBar.delegate = self
        
        // add back button and search bar in navigation object
        self.navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: button), UIBarButtonItem(customView:searchBar)]
    }
    
    @objc private func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    
    
    //-------------샘플 데이터-------------
    
    // MARK: Data should be put(this setup should be set in appear-stage(lifecycle))
    private func setUpSampleData(type:String = "all") {
        if type == "all" {
            searchedBefore.append("IC")
            searchedBefore.append("t")
            searchedBefore.append("zzkjdkzjdjzkjdkzdzkjdzk")
            searchedBefore.append("파이에베이스")
            searchedBefore.append("자바")
            searchedBefore.append("투투")
            searchedBefore.append("일과 이분의 일")
        }
        
        // MARK: This is sample data!@!@
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
        if searchedBefore.isEmpty {
            self.view.bringSubviewToFront(lblNoPreviousSample)
        } else {
            self.view.bringSubviewToFront(searchedScrollView)
        }
        print("searchBarTextDidBeginEditing")
    }

    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            if searchedBefore.isEmpty {
                self.view.bringSubviewToFront(lblNoPreviousSample)
            } else {
                self.view.bringSubviewToFront(searchedScrollView)
            }
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
        self.view.bringSubviewToFront(btnSearchHashtag)
        self.view.bringSubviewToFront(btnSearchCategory)
        if searchedBefore.isEmpty {
            self.view.bringSubviewToFront(lblNoPreviousSample)
        } else {
            self.view.bringSubviewToFront(searchedScrollView)
        }
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
