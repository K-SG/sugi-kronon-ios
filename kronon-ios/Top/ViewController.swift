//
//  ViewController.swift
//  kronon-ios
//
//  Created by 杉浩輝 on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func start_button(_ sender: UIButton) {
//        let viewController = LoginViewController()
//        navigationController?.pushViewController(viewController, animated: true)
    }
    
    //    //ライフサイクルメソッドの一つ
        override func viewWillAppear(_ animated: Bool) {
    //        navigationItem.hidesBackButton = true
            self.navigationController?.setNavigationBarHidden(true, animated: animated)
            super.viewWillAppear(animated)
        }
    
//        //ライフサイクルメソッドの一つ
//        override func viewWillDisappear(_ animated: Bool) {
//            self.navigationController?.setNavigationBarHidden(false, animated: animated)
//            super.viewWillDisappear(animated)
//        }

//    override func viewWillDisappear(_ animated: Bool) {
//        self.navigationController?.setNavigationBarHidden(true, animated: animated)
//        super.viewWillDisappear(animated)
//    }

}

