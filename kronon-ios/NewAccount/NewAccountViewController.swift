//
//  NewAccountViewController.swift
//  kronon-ios
//
//  Created by 杉浩輝 on 2021/02/23.
//

import UIKit

class NewAccountViewController: UIViewController {

    
    
    @IBOutlet weak var nameEditText: UITextField!
    @IBOutlet weak var emailEditText: UITextField!
    @IBOutlet weak var passwordEditText: UITextField!
    @IBOutlet weak var passwordConfirmEditText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        let nameLeftPadding = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        let emailLeftPadding = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        let passwordLeftPadding = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        let passwordConfirmLeftPadding = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
//
        nameEditText.leftView = nameLeftPadding
        nameEditText.leftViewMode = .always
        emailEditText.leftView = emailLeftPadding
        emailEditText.leftViewMode = .always
        passwordEditText.leftView = passwordLeftPadding
        passwordEditText.leftViewMode = .always
        passwordConfirmEditText.leftView = passwordConfirmLeftPadding
        passwordConfirmEditText.leftViewMode = .always
        // Do any additional setup after loading the view.
        
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
