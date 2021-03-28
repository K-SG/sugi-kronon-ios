//
//  DetailAccountViewController.swift
//  kronon-ios
//
//  Created by 杉浩輝 on 2021/03/04.
//

import UIKit

class DetailAccountViewController: UIViewController {
    @IBOutlet weak var userNameText: UILabel!
    @IBOutlet weak var userEmailText: UILabel!
    let krononClient = KrononClient()
    override func viewDidLoad() {
        super.viewDidLoad()
        // UserDefaults のインスタンス
        let userDefaults = UserDefaults.standard
        let userName: String = userDefaults.object(forKey: "userName") as! String
        let userEmail: String = userDefaults.object(forKey: "userEmail") as! String
        userNameText.text = userName
        userEmailText.text = userEmail
        
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
        logoutApi()
        

//        self.navigationController?.popViewController(animated: true)
    }
    private func logoutApi(){
        // UserDefaults のインスタンス
        let userDefaults = UserDefaults.standard
        let token: String = userDefaults.object(forKey: "userToken") as! String
        let apiURL = "\(krononClient.apiURL)logout"
        guard let url = URL(string: apiURL) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request){(data,respose,error) in
            let decoder: JSONDecoder = JSONDecoder()
            do {
                if let respose = respose as? HTTPURLResponse {
                    if (200...299).contains(respose.statusCode){
                        print(respose.statusCode)
                        DispatchQueue.main.sync {
                            // layere_number：階層番号を表す。０がトップ画面（rootView）
                            var layere_number = self.navigationController!.viewControllers.count
                            //いつでもログイン画面に戻るように
                            layere_number = 3
                            self.navigationController?.popToViewController(self.navigationController!.viewControllers[layere_number-2], animated: true)
                        }
                    }else{
                        print(respose.statusCode)
                        let sample: ErrorResponse = try decoder.decode(ErrorResponse.self, from: data!)
                        print("decode:\(sample)")
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
