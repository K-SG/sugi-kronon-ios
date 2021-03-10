//
//  DetailAccountViewController.swift
//  kronon-ios
//
//  Created by 杉浩輝 on 2021/03/04.
//

import UIKit

class DetailAccountViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.parent?.navigationItem.title = "アカウント"
        //tabbarControllerにnavigationが入っている
//        tabBarController?.navigationItem.rightBarButtonItems?.removeAll()
        super.viewWillAppear(animated)
        
    }
    @IBAction func logoutButton(_ sender: Any) {
        print("ログアウトボタンが押されました")
        // layere_number：階層番号を表す。０がトップ画面（rootView）
        var layere_number = navigationController!.viewControllers.count
        //いつでもログイン画面に戻るように
        layere_number = 3
        self.navigationController?.popToViewController(navigationController!.viewControllers[layere_number-2], animated: true)
//        self.navigationController?.popViewController(animated: true)
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
