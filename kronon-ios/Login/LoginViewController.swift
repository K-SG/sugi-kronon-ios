//
//  LoginViewController.swift
//  kronon-ios
//
//  Created by 杉浩輝 on 2021/02/17.
//

import UIKit

class LoginViewController: UIViewController {

//    @IBOutlet weak var textField:UITextField!
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let mailLeftPadding = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        let passwordLeftPadding = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        emailText.leftView = mailLeftPadding
        emailText.leftViewMode = .always
        passwordText.leftView = passwordLeftPadding
        passwordText.leftViewMode = .always
    }
    //ライフサイクルメソッドの一つ
    override func viewWillAppear(_ animated: Bool) {
//        navigationItem.hidesBackButton = true
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }

//    //ライフサイクルメソッドの一つ
//    override func viewWillDisappear(_ animated: Bool) {
//        self.navigationController?.setNavigationBarHidden(false, animated: animated)
//        super.viewWillDisappear(animated)
//    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
