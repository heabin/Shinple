//
//  VideoDetailViewController.swift
//  Shinple
//
//  Created by user on 27/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit

class VideoDetailViewController: UIViewController {

    // 데이터받아와야 하는것들
    var videoTitle:String? = ""    // 강의 제목
    var videoInfo:String? = ""     // 강의 내용
    var isBookmarked:Bool = false    // 강의 찜하기
    var percent: Int = 0           // 강의 수강 퍼센트
//    var videoValue            // 강의 시간
    
    @IBOutlet var headView: UIView! //  뷰컨트롤러에 붙어있는뷰
    @IBOutlet weak var videoView: UIView!
    
    // 뒤로가기 버튼
    @IBOutlet weak var btnGoBack: UIButton!
    
    // 강의 찜하기
    @IBOutlet weak var btnBookmark: UIButton!
    
    // 재생일시정지, 되감기, 앞으로
    @IBOutlet weak var btnPlayPause: UIButton!
    @IBOutlet weak var btnRewind: UIButton!
    @IBOutlet weak var btnForward: UIButton!
    
    // 현재재생시간, 전체재생시간(비디오길이), 확대
    @IBOutlet weak var lblCurrentLength: UILabel!
    @IBOutlet weak var lblVideoLength: UILabel!
    @IBOutlet weak var btnMinMax: UIButton!
    
    // 재생시간 슬라이더
    @IBOutlet weak var videoSlider: UISlider!
    
    // 강의정보
    @IBOutlet weak var lblVideoTitle: UILabel!
    @IBOutlet weak var txvInfo: UITextView!
    
    
    var backStoryboard: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        settingLibrary()
        print("--- 강의 상세 페이지 ---")
        // 뷰를 터치했을때
        let gesture = UITapGestureRecognizer(target: self, action: Selector("someAction:"))
        self.videoView.addGestureRecognizer(gesture)
    }
    
    // 레이아웃 설정
    func settingLibrary(){
        
        print("*라이브러리 설정시작")
        // 비디오뷰 크기 및 위치 설정
        let height = headView.frame.width * 9 / 16
        let videoPlayerFrame = CGRect(x: 0, y: UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 0, width: headView.frame.width, height: height)
        videoView.frame = videoPlayerFrame
        videoView.backgroundColor = UIColor.black
        
        // 뒤로가기 버튼
        btnGoBack.topAnchor.constraint(equalTo: videoView.topAnchor, constant: 8).isActive = true
        btnGoBack.leadingAnchor.constraint(equalTo: videoView.leadingAnchor, constant: 8).isActive = true
        btnGoBack.widthAnchor.constraint(equalToConstant: 24).isActive = true
        btnGoBack.heightAnchor.constraint(equalToConstant: 24).isActive = true
        btnGoBack.setImage(UIImage(named: "icons8-expand-arrow-90"), for: .normal)
        btnGoBack.translatesAutoresizingMaskIntoConstraints = false
        btnGoBack.tintColor = UIColor.white
        
        // 북마크 버튼
        btnBookmark.topAnchor.constraint(equalTo: videoView.topAnchor, constant: 8).isActive = true
        btnBookmark.trailingAnchor.constraint(equalTo: videoView.trailingAnchor, constant: -8).isActive = true
        btnBookmark.widthAnchor.constraint(equalToConstant: 24).isActive = true
        btnBookmark.heightAnchor.constraint(equalToConstant: 24).isActive = true
        btnBookmark.setImage(UIImage(named: "heart_empty"), for: .normal)
        btnBookmark.translatesAutoresizingMaskIntoConstraints = false
        btnBookmark.tintColor = UIColor.white
        
        
        // 재생, 일시정지 버튼
        btnPlayPause.centerXAnchor.constraint(equalTo: videoView.centerXAnchor, constant: 0).isActive = true
        btnPlayPause.centerYAnchor.constraint(equalTo: videoView.centerYAnchor, constant: 0).isActive = true
        btnPlayPause.widthAnchor.constraint(equalToConstant: 30).isActive = true
        btnPlayPause.heightAnchor.constraint(equalToConstant: 30).isActive = true
        btnPlayPause.setImage(UIImage(named: "icons8-pause-100"), for: .normal)
        btnPlayPause.translatesAutoresizingMaskIntoConstraints = false
        btnPlayPause.tintColor = UIColor.white
        
        // 뒤로 10초
        btnRewind.centerXAnchor.constraint(equalTo: videoView.centerXAnchor, constant: -70).isActive = true
        btnRewind.centerYAnchor.constraint(equalTo: videoView.centerYAnchor, constant: 0).isActive = true
        btnRewind.widthAnchor.constraint(equalToConstant: 30).isActive = true
        btnRewind.heightAnchor.constraint(equalToConstant: 30).isActive = true
        btnRewind.setImage(UIImage(named: "icons8-replay-10-100"), for: .normal)
        btnRewind.translatesAutoresizingMaskIntoConstraints = false
        btnRewind.tintColor = UIColor.white

        // 앞으로 10초
        btnForward.centerXAnchor.constraint(equalTo: videoView.centerXAnchor, constant: 70).isActive = true
        btnForward.centerYAnchor.constraint(equalTo: videoView.centerYAnchor, constant: 0).isActive = true
        btnForward.widthAnchor.constraint(equalToConstant: 30).isActive = true
        btnForward.heightAnchor.constraint(equalToConstant: 30).isActive = true
        btnForward.setImage(UIImage(named: "icons8-forward-10-100"), for: .normal)
        btnForward.translatesAutoresizingMaskIntoConstraints = false
        btnForward.tintColor = UIColor.white
        
        
        // 풀스크린 버튼
        btnMinMax.bottomAnchor.constraint(equalTo: videoView.bottomAnchor, constant: 0).isActive = true
        btnMinMax.trailingAnchor.constraint(equalTo: videoView.trailingAnchor, constant: -8).isActive = true
        btnMinMax.widthAnchor.constraint(equalToConstant: 24).isActive = true
        btnMinMax.heightAnchor.constraint(equalToConstant: 24).isActive = true
        btnMinMax.setImage(UIImage(named: "icons8-full-screen-90"), for: .normal)
        btnMinMax.translatesAutoresizingMaskIntoConstraints = false
        btnMinMax.tintColor = UIColor.white
        
        // 현재재생 시간
        lblCurrentLength.leftAnchor.constraint(equalTo: videoView.leftAnchor, constant: 8).isActive = true
        lblCurrentLength.centerYAnchor.constraint(equalTo: btnMinMax.centerYAnchor).isActive = true
        lblCurrentLength.widthAnchor.constraint(equalToConstant: 60).isActive = true
        lblCurrentLength.heightAnchor.constraint(equalToConstant: 24).isActive = true
        lblCurrentLength.text = "00:00"
        lblCurrentLength.sizeToFit()
        lblCurrentLength.textAlignment = .center
        lblCurrentLength.textColor = UIColor.white
        lblCurrentLength.font = UIFont.boldSystemFont(ofSize: 14)
        lblCurrentLength.translatesAutoresizingMaskIntoConstraints = false

        // 전체재생시간
        lblVideoLength.trailingAnchor.constraint(equalTo: btnMinMax.leadingAnchor, constant: 0).isActive = true
        lblVideoLength.centerYAnchor.constraint(equalTo: btnMinMax.centerYAnchor).isActive = true
        lblVideoLength.widthAnchor.constraint(equalToConstant: 60).isActive = true
        lblVideoLength.heightAnchor.constraint(equalToConstant: 24).isActive = true
        lblVideoLength.text = "00:00"
        lblVideoLength.sizeToFit()
        lblVideoLength.textAlignment = .center
        lblVideoLength.textColor = UIColor.white
        lblVideoLength.font = UIFont.boldSystemFont(ofSize: 14)
        lblVideoLength.translatesAutoresizingMaskIntoConstraints = false
        
        // 슬라이더
        videoSlider.centerYAnchor.constraint(equalTo: videoView.bottomAnchor).isActive = true
        videoSlider.leadingAnchor.constraint(equalTo: videoView.leadingAnchor).isActive = true
        videoSlider.trailingAnchor.constraint(equalTo: videoView.trailingAnchor).isActive = true
        videoSlider.translatesAutoresizingMaskIntoConstraints = false
        videoSlider.minimumTrackTintColor = UIColor.red
        videoSlider.maximumTrackTintColor = UIColor.white
        videoSlider.thumbTintColor = UIColor.red
        
     
        
        
        print("라이브러리 설정끝*")
    }
    
    // 뷰를 터치했을때!
    @objc func someAction(_ sender:UITapGestureRecognizer){
        // do other task
        print("비디오 터치")
        
        // 그라데이션, 뒤로가기 정지 버튼들, 레이블들,
        // 딜레이 넣어서 2초 후 사라지도록 구현!
    }
    
    // 북마크에 추가
    @IBAction func bookmark(_ sender: UIButton) {
        if isBookmarked {
            print("북마크 삭제")
            btnBookmark.setImage(UIImage(named: "heart_empty"), for: .normal)
        }else {
            print("북마크 추가")
            btnBookmark.setImage(UIImage(named: "heart_fill"), for: .normal)
        }
        isBookmarked = !isBookmarked
    }
    
    @IBAction func fullScreen(_ sender: UIButton) {
        print("전체화면")
        // view를 전체 화면으로!
        videoView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        videoView.transform = view.transform.rotated(by: CGFloat(90 * M_PI / 180))
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            print("가로로")
            //imageView.image = UIImage(named: const2)
        } else {
            print("세로로")
            //imageView.image = UIImage(named: const)
        }
    }
    
    @IBAction func backPage(_ sender: UIButton) {
        print("이전 페이지로")
        self.dismiss(animated: true)
        
        // Main View Controller
        // 나중에 참고용으로 넣어 놓은 코드~
//        self.present(otherViewController, animated: true)
    }
    
}
