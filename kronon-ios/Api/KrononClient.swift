//
//  KrononClient.swift
//  kronon-ios
//
//  Created by 杉浩輝 on 2021/03/28.
//

import Foundation
import UIKit

class KrononClient:UIAlertController{
    let apiURL = "http://52.197.190.20/api/"
    
    
    func loginApiClient(email:String,password:String) -> Int{
        let loginUrl = "\(apiURL)login"
        let userDefaults = UserDefaults.standard
        let decoder: JSONDecoder = JSONDecoder()
        guard let url = URL(string: loginUrl) else {
            return 1
        }
        var answerCode = 0
        
        let parameters = ["email":email,"password":password]
        let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = httpBody
        
        URLSession.shared.dataTask(with: request){(data,respose,error) in
            do{
                if let respose = respose as? HTTPURLResponse {
                    if (200...299).contains(respose.statusCode){
                        answerCode = respose.statusCode
                        let responseUser: ResponseUserData = try decoder.decode(ResponseUserData.self, from: data!)
                        userDefaults.set(responseUser.data.name!, forKey: "userName")
                        userDefaults.set(responseUser.data.email!, forKey: "userEmail")
                        userDefaults.set(responseUser.data.token, forKey: "userToken")
                    }else{
                        answerCode = respose.statusCode
                        let sample: ErrorResponse = try decoder.decode(ErrorResponse.self, from: data!)
                        let dialog = UIAlertController(title: "入力エラー", message: sample.message, preferredStyle: .alert)
                        dialog.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        // 生成したダイアログを実際に表示します
                        self.present(dialog, animated: true, completion: nil)
                    }
                }
            }catch{
                print(error)
            }
        }.resume()
        return answerCode
    }
}
