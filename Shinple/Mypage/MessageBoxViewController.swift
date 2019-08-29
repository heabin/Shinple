//
//  MessageBoxViewController.swift
//  Shinple
//
//  Created by user on 29/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit

class MessageBoxViewController: UIViewController {
    
    @IBOutlet weak var lblLine: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        lblLine.layer.borderWidth = 1
        lblLine.layer.borderColor = UIColor.lightGray.cgColor
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
