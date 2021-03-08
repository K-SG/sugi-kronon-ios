//
//  CalendarViewController.swift
//  kronon-ios
//
//  Created by 杉浩輝 on 2021/02/23.
//

import UIKit

class CalendarViewController: UIViewController {
    var addScheduleButton: UIBarButtonItem! // 追加ボタン

    @IBOutlet weak var headerPreButton: UIButton!
    @IBOutlet weak var headerNextButton: UIButton!
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var calendarHeaderView: UIView!
    @IBOutlet weak var calemdarCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //初期設定パターン① (アイコンを使うパターン)
        addScheduleButton = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(addButtonPressed(_:)))
        // ナビゲーションバー にボタンを追加
        self.navigationItem.rightBarButtonItem = addScheduleButton
        addScheduleButton.tintColor = UIColor.gray


        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.parent?.navigationItem.title = "カレンダー"
        
        super.viewWillAppear(animated)
    }
    
    @objc func addButtonPressed(_ sender: UIBarButtonItem) {
        print("追加ボタンが押されました")
        self.performSegue(withIdentifier: "addSchedule", sender: self)
    }
    
    @IBAction func tappedHeaderPrevButton(sender: UIButton) {
    }

    @IBAction func tappedHeaderNextButton(sender: UIButton) {
    }

}

