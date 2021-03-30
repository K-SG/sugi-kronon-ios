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
    let krononClient = KrononClient()
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.navigationItem.hidesBackButton = true
        let nameLeftPadding = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        let emailLeftPadding = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        let passwordLeftPadding = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        let passwordConfirmLeftPadding = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))

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
    //ライフサイクルメソッドの一つ
    override func viewWillAppear(_ animated: Bool) {
//        navigationItem.hidesBackButton = true
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.parent?.navigationItem.title = "アカウント"
        super.viewWillAppear(animated)
    }
    @IBAction func addAccountButton(_ sender: Any) {
        let inputName = nameEditText.text
        let inputEmail = emailEditText.text
        let inputPassWord = passwordEditText.text
        
        
        let inputConfirmPassWord = passwordConfirmEditText.text
        if(inputPassWord != inputConfirmPassWord){
            conflictPassword()
        }
        
        addAccountApi(inputName: inputName!, inputEmail: inputEmail!, inputPassWord: inputPassWord!)
        
    }
    private func addAccountApi(inputName:String,inputEmail:String,inputPassWord:String){
        // UserDefaults のインスタンス
        let userDefaults = UserDefaults.standard
        //APICall
        let apiURL = "\(krononClient.apiURL)users"
        guard let url = URL(string: apiURL) else { return }
        
        let parameters = ["name":inputName,"email":inputEmail,"password":inputPassWord]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = httpBody
        
        URLSession.shared.dataTask(with: request){(data,respose,error) in
            let decoder: JSONDecoder = JSONDecoder()
            do {
                if let respose = respose as? HTTPURLResponse {
                    if (200...299).contains(respose.statusCode){
                        print(respose.statusCode)
                        let responseUser: ResponseUserData = try decoder.decode(ResponseUserData.self, from: data!)
                        userDefaults.set(responseUser.data.name!, forKey: "userName")
                        userDefaults.set(responseUser.data.email!, forKey: "userEmail")
                        userDefaults.set(responseUser.data.token!, forKey: "userToken")
                        DispatchQueue.main.sync {
                            let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "calendar") as! KrononTabBarController
                            self.navigationController?.pushViewController(secondViewController, animated: true)
                        }
                    }else{
                        let sample: ErrorResponse = try decoder.decode(ErrorResponse.self, from: data!)
                        print("decode:\(sample)")
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
    
    //ライフサイクルメソッドの一つ
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillDisappear(animated)
    }
    //一つのメソッドの中でやる処理は一つ,
    private func viewSetUp(){
        
    }
    //
    private func uiTextFieldRound(){
        
    }
    //ダイアログ
    private func conflictPassword(){
            let dialog = UIAlertController(title: "入力エラー", message: "パスワードが異なっているよ", preferredStyle: .alert)
            dialog.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            // 生成したダイアログを実際に表示します
            self.present(dialog, animated: true, completion: nil)
    }

}
