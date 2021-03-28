//
//  addScheduleViewController.swift
//  kronon-ios
//
//  Created by 杉浩輝 on 2021/03/06.
//

import UIKit

class addScheduleViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var okButton: UIButton!
    let dataList = [
        "オフィス","外出","在宅"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Delegate設定
        pickerView.delegate = self
        pickerView.dataSource = self
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.parent?.navigationItem.title = "予定登録"
        super.viewWillAppear(animated)
    }
    // UIPickerViewの列の数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // UIPickerViewの行数、リストの数
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        return dataList.count
    }
    // UIPickerViewの最初の表示
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        
        return dataList[row]
    }
    @IBAction func okButton(_ sender: Any) {
        print("OKbuttons")
        let inputTitle = "お腹減った"
        let inputDate = "2021-03-04"
        let inputPlace = 1
        let startTime = "10:00"
        let endTime = "14:00"
        let content = "疲れたて"
        addScheduleApi(inputTitle: inputTitle, inputDate: inputDate, inputPlace: inputPlace, startTime: startTime, endTime: endTime, content: content)
        
    }
    private func addScheduleApi(inputTitle:String,inputDate:String,inputPlace:Int,startTime:String,endTime:String,content:String){
        // UserDefaults のインスタンス
        let userDefaults = UserDefaults.standard
        let token: String = userDefaults.object(forKey: "userToken") as! String
        let apiURL = "http://54.64.229.155/api/schedules"
        guard let url = URL(string: apiURL) else { return }
        let parameters = ["title":inputTitle,"schedule_date":inputDate,"place":inputPlace,"start_time":startTime,"end_time":endTime,"content":content] as [String : Any]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.httpBody = httpBody
        
        URLSession.shared.dataTask(with: request){(data,respose,error) in
            do {
                let decoder: JSONDecoder = JSONDecoder()
                if let respose = respose as? HTTPURLResponse {
                    if (200...299).contains(respose.statusCode){
                        print(respose.statusCode)
                        let responseUser: ResponseScheduleData = try decoder.decode(ResponseScheduleData.self, from: data!)
                        print(responseUser)
                        DispatchQueue.main.sync {
                            let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "calendar") as! KrononTabBarController
                            self.navigationController?.pushViewController(secondViewController, animated: true)
                        }
                    }else{
                        let sample: ErrorResponse = try decoder.decode(ErrorResponse.self, from: data!)
                        DispatchQueue.main.sync {
                            let dialog = UIAlertController(title: "入力エラー", message: sample.message, preferredStyle: .alert)
                            dialog.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                            // 生成したダイアログを実際に表示します
                            self.present(dialog, animated: true, completion: nil)
                        }
                    }
                }
            } catch {
                print(error)
            }
        }.resume()
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
