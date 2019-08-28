//
//  AskingViewController.swift
//  Shinple
//
//  Created by user on 27/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit

class AskingViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    // =============== Initialize ===============
    // 문의유형
    var lists = ["사용장애", "강좌요청", "사용문의"]
    // 피커뷰 인덱스 간격(2개 함수에서 사용)
    let pickerViewHeight:CGFloat = 40.0
    // 텍스트필드 패딩
    let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 1, height: 0))
    // =============== /Initialize ===============
    
    
    // =============== Outlet ===============
    @IBOutlet weak var btnType: UIButton!
    @IBOutlet weak var txtFieldTitle: UITextField!
    @IBOutlet weak var lblContents: UILabel!
    @IBOutlet weak var txtViewContents: UITextView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var btnSubmit: UIButton!
    // =============== /Outlet ===============
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UI 상세 설정
        btnType.layer.borderWidth = 1
        btnType.layer.cornerRadius = 10.0
        btnType.titleEdgeInsets = UIEdgeInsets(top: 0, left: 6, bottom: 0, right: 6)
        txtFieldTitle.layer.borderWidth = 1
        txtFieldTitle.layer.cornerRadius = 10.0
        txtFieldTitle.leftView = leftView
        txtFieldTitle.leftViewMode = .always
        txtViewContents.layer.borderWidth = 1
        txtViewContents.layer.cornerRadius = 10.0
        btnSubmit.layer.borderWidth = 1
        btnSubmit.layer.cornerRadius = 10.0
        btnSubmit.contentHorizontalAlignment = .center
        
        // 피커뷰 감추기
        pickerView.isHidden = true
    }
    
    
    // =============== Action ===============
    @IBAction func btnTypeAction(_ sender: UIButton) {
        // 문의유형 클릭 시, 피커뷰 보이기
        pickerView.isHidden = false
    }
    // =============== /Action ===============

    
    // =============== PickerView ===============
    // 피커뷰 1줄
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // 피커뷰 인덱스 수 넘기기
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return lists.count
    }
    
    // 피커뷰 인덱스 세로 길이
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return pickerViewHeight
    }
    
    // 피커뷰 인덱스 그리기
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return lists[row]
    }
    
    // 피커뷰 인덱스 선택 시, 문의유형 버튼에 삽입
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // 버튼에 피커뷰 인덱스 표시
        btnType.setTitle(lists[row], for: .normal)
        // 버튼에 검은색 글자로 표시
        btnType.setTitleColor(.black, for: .normal)
        // 버튼에 표시 후 피커뷰 숨기기
        pickerView.isHidden = true
    }
    
    // 피커뷰 디자인
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let label: UILabel?
        if(view == nil){
            label = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: pickerView.frame.width, height: pickerViewHeight))
        }else{
            label = view as? UILabel
        }
        
        label!.text = lists[row]
        label?.textAlignment = .center
        label?.font = UIFont.boldSystemFont(ofSize: 18)
        label?.textColor = .white
        label?.backgroundColor = .darkGray
        
        return label!
    }
    // =============== /PickerView ===============




}
