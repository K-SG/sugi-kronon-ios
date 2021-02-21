//
//  LoginViewController.swift
//  kronon-ios
//
//  Created by 杉浩輝 on 2021/02/17.
//

import UIKit

class LoginViewController: UIViewController {

//    @IBOutlet weak var textField:UITextField!
    
    @IBOutlet weak var mail_text: UITextField!
    @IBOutlet weak var password_text: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let mailLeftPadding = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        let passwordLeftPadding = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
//        mailLeftPadding.backgroundColor = UIColor.clear
        mail_text.leftView = mailLeftPadding
        mail_text.leftViewMode = .always
        password_text.leftView = passwordLeftPadding
        password_text.leftViewMode = .always
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
