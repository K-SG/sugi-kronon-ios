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
    @IBAction func loginButton(_ sender: Any) {
//        var success:Bool?
        var message:String?
        
        let inputEmail = emailText.text
        let inputPassWord = passwordText.text
        
        //APICall
        let apiURL = "http://54.64.229.155/api/login"
        guard let url = URL(string: apiURL) else { return }
        
        let parameters = ["email":inputEmail,"password":inputPassWord]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = httpBody
        
        URLSession.shared.dataTask(with: request){(data,respose,error) in
            if let error = error {
                print("Fail to get item:\(error)")
                return
            }
            if let respose = respose as? HTTPURLResponse {
                if !(200...299).contains(respose.statusCode){
                    print("Response status code:\(respose.statusCode)")
                    DispatchQueue.main.sync {
                        //レスポンスされたものをdataに格納
                        if let data = data {
                            do{
                                let jsonDict = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                                //                                success = (jsonDict?["success"] as! Bool)
                                message = (jsonDict?["message"] as! String)
                            } catch {
                                print("Error parsing the response.")
                            }
                        }else{
                            print("ERROR parsing the response.")
                        }
                        //ダイアログで表示
                        let dialog = UIAlertController(title: "入力エラー", message: message, preferredStyle: .alert)
                        
                        dialog.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        // 生成したダイアログを実際に表示します
                        self.present(dialog, animated: true, completion: nil)
                    }
                    return
                }else{
                    //レスポンスされたものをdataに格納
                    if let data = data {
                        do{
                            let jsonDict = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                            
//                            message = (jsonDict?["message"] as! String)
                            let couponData = jsonDict.map { (couponData) -> [String: Any] in
                                return couponData
                            }
//                            print(jsonDict!["data"] as Any)
//                            print(couponData["name"] as! String)
            
//                            let responseName = (couponData[0]["name"] as! String)
//                            let responseEmail = (jsonDict?["data.email"] as! String)
//                            let responseToken = (jsonDict?["data.token"] as! String)
//                            print(responseName)
//                            print(responseEmail)
//                            print(responseToken)
                        } catch {
                            print("Error parsing the response.")
                        }
                    }else{
                        print("ERROR parsing the response.")
                    }
                    
                    print("Response status code:\(respose.statusCode)")
                    
//                    let userDefaults = UserDefaults.standard
//                    userDefaults.set([保存したいデータ], forKey: "[キー名]")
                    DispatchQueue.main.sync {
                        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "calendar") as! KrononTabBarController
                        self.navigationController?.pushViewController(secondViewController, animated: true)
                    }
                    return
                }
                
            }
            
        }.resume()
        print("アカウント作成ボタンが押されました")
        
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
