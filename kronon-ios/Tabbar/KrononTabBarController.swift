//
//  KrononTabBarController.swift
//  kronon-ios
//
//  Created by 杉浩輝 on 2021/02/27.
//

import UIKit

class KrononTabBarController: UITabBarController {
    var addScheduleButton: UIBarButtonItem!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        // アイコンの色を変更できます！
        UITabBar.appearance().tintColor = SoreppoiAppColor.tabIcon
        // 背景色を変更できます！
        UITabBar.appearance().barTintColor = SoreppoiAppColor.tabBackground
        //初期設定パターン① (アイコンを使うパターン)
        addScheduleButton = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(addButtonPressed(_:)))
        // ナビゲーションバー にボタンを追加
        self.navigationItem.rightBarButtonItem = addScheduleButton
        addScheduleButton.tintColor = UIColor.gray
        

        // Do any additional setup after loading the view.
        
    }
    @objc func addButtonPressed(_ sender: UIBarButtonItem) {
        print("追加ボタンが押されました")
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "addSchedule") as! addScheduleViewController
        self.present(secondViewController, animated: true, completion: nil)
//        self.performSegue(withIdentifier: "addSchedule", sender: self)
     }
    //ライフサイクルメソッドの一つ
//    override func viewWillAppear(_ animated: Bool) {
////        navigationItem.hidesBackButton = true
//        self.navigationController?.setNavigationBarHidden(false, animated: animated)
//        super.viewWillAppear(animated)
//    }
//
//    //ライフサイクルメソッドの一つ
//    override func viewWillDisappear(_ animated: Bool) {
//        self.navigationController?.setNavigationBarHidden(true, animated: animated)
//        super.viewWillDisappear(animated)
//    }
    
    @IBAction func logoutButton(_ sender: Any) {
        print("logout")
    }
    @IBAction func logoutTouuchUpInside(_ sender: Any) {
        print("logout")
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
