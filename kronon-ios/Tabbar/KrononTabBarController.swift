//
//  KrononTabBarController.swift
//  kronon-ios
//
//  Created by 杉浩輝 on 2021/02/27.
//

import UIKit

enum TabTag: Int {
    case Calendar = 0
    case Schedule = 1
    case Account  = 2
}

class KrononTabBarController: UITabBarController {
    var addScheduleButton: UIBarButtonItem!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //戻るボタン消す
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
//        self.navigationController.push(secondViewController, animated: true, completion: nil)
        self.navigationController?.pushViewController(secondViewController, animated: true)
//        self.performSegue(withIdentifier: "addSchedule", sender: self)
     }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.tag {
        case TabTag.Account.rawValue:
            // viewDidLoad
            self.navigationItem.rightBarButtonItem = nil
            break;
        default:
            //初期設定パターン① (アイコンを使うパターン)
            addScheduleButton = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(addButtonPressed(_:)))
            // ナビゲーションバー にボタンを追加
            self.navigationItem.rightBarButtonItem = addScheduleButton
            addScheduleButton.tintColor = UIColor.gray
            break;
        }
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
