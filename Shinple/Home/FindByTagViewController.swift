//
//  FindByTagViewController.swift
//  Shinple
//
//  Created by 김기성 on 28/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit

class FindByTagViewController: UIViewController {
    
    var clickedOnce = false
    var clickedItems = 0
    var nowYOffset: CGFloat = 0
    var data = [
        "ICT", "파이어베이스", "안드로이드", "자바", "윤리",
        "기업", "기성", "파이썬", "C", "C++",
        "일ICT", "일파이어베이스", "일안드로이드", "일자바", "일윤리",
        "일기업", "일기성", "일파이썬", "일C", "일C++",
        "일ICT", "일파이어베이스", "일안드로이드", "일자바", "일윤리",
        "일기업", "일기성", "일파이썬", "일C", "일C++",
        "일ICT", "일파이어베이스", "일안드로이드", "일자바", "일윤리",
        "일기업", "일기성", "일파이썬", "일C", "일C++",
        "일ICT", "일파이어베이스", "일안드로이드", "일자바", "일윤리",
        "일기업", "일기성", "일파이썬", "일C", "일C++",
        "일ICT", "일파이어베이스", "일안드로이드", "일자바", "일윤리",
        "일기업", "일기성", "일파이썬", "일C", "일C++",
        "일ICT", "일파이어베이스", "일안드로이드", "일자바", "일윤리",
        "일기업", "일기성", "일파이썬", "일C", "일C++"
    ]
    var dataClicked = [Bool?]()
    var buttons = [UIButton?]()
    
    @IBOutlet weak var initClicked: UIButton!
    @IBOutlet weak var search: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtons(data, famousIndex: 10)
        
        scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: nowYOffset)
        scrollView.canCancelContentTouches = true
        self.view.bringSubviewToFront(scrollView)
    }
    
    func setLabel(x: CGFloat, y: CGFloat, message: String) {
        let label = UILabel()
        label.text = message
        label.frame = CGRect(origin:CGPoint(x: x, y: y), size: CGSize(width: 100, height: 10))
        self.scrollView.addSubview(label)
    }
    
    func setButtons(_ data: [String], famousIndex: Int) {
        var rowSizeLeft = UIScreen.main.bounds.maxX * 1.8
        var rowX = CGFloat(5)
        var heightY = CGFloat(50)
        let spacing = CGFloat(5)
        
        setLabel(x: rowX, y: heightY, message: "인기 키워드")
        heightY += CGFloat(35)
        for index in 0..<data.count {
            dataClicked.append(false)
            if index == famousIndex {
                rowSizeLeft = UIScreen.main.bounds.maxX * 1.8
                heightY += CGFloat(75)
                rowX = CGFloat(5)
                setLabel(x: rowX, y: heightY, message: "일반 키워드")
                heightY += CGFloat(35)
            }
            let button = setButton(data[index])
            let nowItemSizeX = button.center.x * 2 + spacing
            if (nowItemSizeX + rowX) > rowSizeLeft {
                rowSizeLeft = UIScreen.main.bounds.maxX * 1.8
                heightY += button.center.y * 2.5 + spacing
                rowX = CGFloat(5)
            }
            button.frame = CGRect(x: rowX, y: heightY, width: nowItemSizeX-spacing, height: button.center.y*2)
            button.tag = index
            buttons.append(button)
            self.scrollView.addSubview(button)
            rowSizeLeft -= nowItemSizeX
            rowX += nowItemSizeX
        }
        nowYOffset = heightY + CGFloat(100)
    }
    
    func setButton(_ title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        button.layer.borderWidth = 0.5
        button.sizeToFit()
        button.layer.cornerRadius = 10
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.isEnabled = true
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        return button
    }
    
    @objc func buttonAction(sender: UIButton!) {
        if dataClicked[sender.tag]! {
            sender.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
            sender.setTitleColor(UIColor.black, for: .normal)
            clickedItems -= 1
        } else {
            sender.backgroundColor = UIColor(red: 10/255, green: 10/255, blue: 255/255, alpha: 1)
            sender.setTitleColor(UIColor.white, for: .normal)
            clickedItems += 1
        }
        
        if clickedItems > 0 {
            self.view.bringSubviewToFront(stackView)
        } else {
            self.view.bringSubviewToFront(scrollView)
        }
        dataClicked[sender.tag] = !dataClicked[sender.tag]!
    }
    
    
    @IBAction func initClickedItems(_ sender: UIButton) {
        for index in 0..<dataClicked.count {
            if dataClicked[index]! {
                dataClicked[index] = false
                buttons[index]!.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
                buttons[index]!.setTitleColor(UIColor.black, for: .normal)
            }
        }
        self.view.bringSubviewToFront(scrollView)
    }
    
    @IBAction func searchClickedItems(_ sender: UIButton) {
        var selected = [String?]()
        for index in 0..<dataClicked.count {
            if dataClicked[index]! {
                selected.append(data[index])
            }
        }
        print(selected)
    }}
