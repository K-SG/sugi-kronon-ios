//
//  KrononTabBarController.swift
//  kronon-ios
//
//  Created by 杉浩輝 on 2021/02/27.
//

import UIKit

class KrononTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // アイコンの色を変更できます！
        UITabBar.appearance().tintColor = SoreppoiAppColor.tabIcon
        // 背景色を変更できます！
        UITabBar.appearance().barTintColor = SoreppoiAppColor.tabBackground

        // Do any additional setup after loading the view.
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
