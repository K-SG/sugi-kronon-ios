//
//  LoginApiModel.swift
//  kronon-ios
//
//  Created by 杉浩輝 on 2021/03/23.
//

import Foundation

//JSONのitem内のデータ構造
struct LoginUserResponse:Codable {
    //sucess
    let success : Bool?
    //code
    let message : String?
    //data
    let data : UserData?
}
//error
struct LoginErrorResponse:Codable {
    let success: Bool?
    let code: Int?
    let message: String?
}
