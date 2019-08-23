//
//  MainCollectionView.swift
//  Login2
//
//  Created by user on 20/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit

class HomeCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate {

    var titles1 = ["제1강. Swift 부시기", "제2강. 메인페이지힘듦..", "제3강. 던져버리고싶다", "제4강. 에헤라디야", "제5강. 뿌셔뿌셔"]
    var imageFiles1 = ["video.png", "video2.png", "video3.png", "video4.png", "video5.png"]
    var titles2 = ["몽쉘 생크림케이크", "행복한 카스타드", "HAITAI 오예스", "명가 찰떡 파이", "맛있는거 먹고싶다"]
    var imageFiles2 = ["video5.png", "video4.png", "video3.png", "video2.png", "video.png"]
    var titles3 = ["A TWOSOME PLACE", "Level UP! 막심커피", "스타벅스", "개인적으로 할리스짱", "배고프다"]
    var imageFiles3 = ["video3.png", "video2.png", "video.png", "video4.png", "video5.png"]
    
    
    override func awakeFromNib() {
        self.delegate = self
        self.dataSource = self
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeVideoCollectionViewCell", for: indexPath) as! HomeVideoCollectionViewCell
        
        if collectionView.tag == 1 {
            cell.lblTitle.text = titles1[indexPath.row]
            cell.imgVideo.image = UIImage(named: imageFiles1[indexPath.row])
        }
        if collectionView.tag == 2 {
            cell.lblTitle.text = titles2[indexPath.row]
            cell.imgVideo.image = UIImage(named: imageFiles2[indexPath.row])
        }
        if collectionView.tag == 3 {
            cell.lblTitle.text = titles3[indexPath.row]
            cell.imgVideo.image = UIImage(named: imageFiles3[indexPath.row])
        }
            
        return cell
    }

}
