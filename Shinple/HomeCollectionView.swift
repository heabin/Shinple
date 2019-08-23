//
//  MainCollectionView.swift
//  Login2
//
//  Created by user on 20/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit

class HomeCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate {

    var titles = ["제1강. Swift 부시기", "제2강. 메인페이지힘듦..", "제3강. 던져버리고싶다", "제4강. 에헤라디야", "제5강. 뿌셔뿌셔"]
    var imageFiles = ["video.png", "video2.png", "video3.png", "video4.png", "video5.png"]
    
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

        let status = titles[indexPath.row]
        let status2 = UIImage(named: imageFiles[indexPath.row])
            
        cell.lblTitle.text = status
        cell.imgVideo.image = status2
            
        return cell
    }

}
