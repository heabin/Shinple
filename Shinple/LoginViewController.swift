//
//  ViewController.swift
//  Login2
//
//  Created by user on 19/08/2019.
//  Copyright © 2019 veronica. All rights reserved.
//

import UIKit

// MARK:- EC_login
extension UIColor {
        static var lightBlue = UIColor(red: 0/255, green: 192/255, blue: 243/255, alpha:1)
}

//로그인 밑줄
extension CALayer {
    func addBorder(_ arr_edge: [UIRectEdge], color: UIColor, width: CGFloat) {
        for edge in arr_edge {
            let border = CALayer()
            switch edge {
            case UIRectEdge.top:
                border.frame = CGRect.init(x: 0, y: 0, width: frame.width, height: width)
                break
            case UIRectEdge.bottom:
                border.frame = CGRect.init(x: 0, y: frame.height - width, width: frame.width, height: width)
                break
            case UIRectEdge.left:
                border.frame = CGRect.init(x: 0, y: 0, width: width, height: frame.height)
                break
            case UIRectEdge.right:
                border.frame = CGRect.init(x: frame.width - width, y: 0, width: width, height: frame.height)
                break
            default:
                break
            }
            border.backgroundColor = color.cgColor;
            self.addSublayer(border)
        }
    }
}



// MARK:- EC_login
class LoginViewController: UIViewController, UITextFieldDelegate {

    
    //MARK: - Login IBOutlet
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var txtID: UITextField!
    @IBOutlet weak var txtPW: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var imgID: UIImageView!
    @IBOutlet weak var imgPW: UIImageView!
    
    //image login
    let img_log = UIImage(named: "logo_first")
    let img_id = UIImage(named: "user2")
    let img_pw = UIImage(named: "password2")
    
    var SaveOn = false

    // MARK : DAEUN 로그인 정보, 추후 DB에서 가지고 와야함
    let id = "shinple"
    let pw = "123"
    
    
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgLogo.image = img_log
        imgID.image = img_id
        imgPW.image = img_pw
        
        //btnLogin.backgroundColor = .lightBlue
        btnLogin.setTitleColor(.white, for: .normal)
        //btnLogin.layer.cornerRadius = 8
        
        txtID.borderStyle = .none
        txtPW.borderStyle = .none
        txtID.layer.addBorder([.bottom], color: .lightGray, width: 1.0)
        txtPW.layer.addBorder([.bottom], color: .lightGray, width: 1.0)
        
        
        txtID.returnKeyType = .done
        txtPW.returnKeyType = .done
        keyBoardHandling(txtID)
        keyBoardHandling(txtPW)

    }
    
    
    
    
    
    
    //MARK: - KEY BORAD login
    //-----------------키보드 올릴 때
    func keyBoardHandling(_ sender:UITextField){
        // 키보드가 보일때
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification , object: nil)
        // 키보드가 사라질때
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification , object: nil)
    }
    
    @objc func keyboardWillShow(_ sender: Notification){
        NSLog("—keyboardWillShow—")
        self.view.frame.origin.y = -50
    }
    
    @objc func keyboardWillHide(_ sender: Notification){
        NSLog("—keyboardWillHide")
        self.view.frame.origin.y = 0
    }
    
    
    //-----------------키보드 내릴 때
    // done 선택 시
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        NSLog("==== textFieldShouldReturn ====")
        
        textField.resignFirstResponder()
        return true
    }
    
    // 아무데나 선택 시
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //MARK: - Action
    //login
    @IBAction func btnLogin(_ sender: Any) {
        //텍스트박스의 로그의 로그인(아이디, 비밀번호) 규칙을 해야한다.
        
//        //텍스트박스 박스에 공백이 아니면,
//        if !(txtID.text!.isEmpty || txtPW.text!.isEmpty) {
//            if SaveOn {
//                print("로그인 정보 저장하기")
//                //로그인 정보 저장하기
//                UserDefaults.standard.set(txtID.text, forKey: "id")
//                UserDefaults.standard.set(txtPW.text, forKey: "pw")
//            }
////            print("로그인하기")
////            print("=====" + UserDefaults.standard.string(forKey: "id")!)
////            print("=====" + UserDefaults.standard.string(forKey: "pw")!)
//        }
        
        // MARK : - DAEUN 로그인
        // 아이디와 비밀번호가 일치하면 아이디를 userDefaults.standart에 저장
        if txtID.text! == id && pw == txtPW.text! {
            UserDefaults.standard.set(txtID.text, forKey: "id")
            
            let myTabBar = self.storyboard?.instantiateViewController(withIdentifier: "myTabBar") as! UITabBarController
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = myTabBar
            
            //            let vc = storyboard?.instantiateViewController(withIdentifier: "myTabBar")
            //            navigationController?.pushViewController(vc!, animated: true)
        }else{
            let alert = UIAlertController(title: "경고", message: "아이디 혹은 비밀번호가 맞지 않습니다.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        }
        
        
    }
    

}

