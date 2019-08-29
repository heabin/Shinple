//
//  NoticeViewController.swift
//  Shinple
//
//  Created by user on 29/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit

class NoticeViewController: UIViewController {

    @IBOutlet weak var lblLine: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        lblLine.layer.borderWidth = 1
        lblLine.layer.borderColor = UIColor.lightGray.cgColor
    }

}
