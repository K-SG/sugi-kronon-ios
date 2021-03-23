//
//  LoginApiModel.swift
//  kronon-ios
//
//  Created by 杉浩輝 on 2021/03/23.
//

import Foundation

//JSONのitem内のデータ構造
struct ItemJson:Codable {
    //sucess
    let success : String?
    //code
    let message : String?
    //data
    let data : LoginUser?
}
//JSONのデータ構造
struct LoginUser:Codable {
    //nama
    let name : String?
    //email
    let email: String?
    //token
    let token: String?
}
//error
struct LoginError:Codable {
    let success: String?
    let code: Int?
    let message: String?
}
