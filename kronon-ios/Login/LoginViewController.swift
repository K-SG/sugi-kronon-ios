    //
    //  LoginViewController.swift
    //  kronon-ios
    //
    //  Created by 杉浩輝 on 2021/02/17.
    //
    
    import UIKit
    
    class LoginViewController: UIViewController {
        
        @IBOutlet weak var emailText: UITextField!
        @IBOutlet weak var passwordText: UITextField!
        let krononClient = KrononClient()
        
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
            let inputEmail = emailText.text
            let inputPassWord = passwordText.text
            //APICall
            loginApi(email: inputEmail!, password:inputPassWord!)
            
        }
        private func loginApi(email:String,password:String){
            // UserDefaults のインスタンス
            let userDefaults = UserDefaults.standard
            let apiURL = "\(krononClient.apiURL)login"
            guard let url = URL(string: apiURL) else { return }
            
            let parameters = ["email":email,"password":password]
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
                            userDefaults.set(responseUser.data.token, forKey: "userToken")
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
        
        
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
