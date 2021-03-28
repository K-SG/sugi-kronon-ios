//
//  KrononResponse.swift
//  kronon-ios
//
//  Created by 杉浩輝 on 2021/03/26.
//

import Foundation
//JSONのitem内のデータ構造
struct ResponseUserData:Codable {
    //sucess
    let success : Bool?
    //code
    let message : String?
    //data
    let data : User
}

struct ResponseScheduleData:Codable {
    //sucess
    let success : Bool?
    //code
    let code : Int?
    //data
    let data : Schedules
}
//JSONのデータ構造
struct User:Codable {
    //nama
    let name : String?
    //email
    let email: String?
    //token
    let token :String?
}

struct Schedules:Codable {
    //nama
    let title : String?
    //email
    let schedule_date: String?
    //token
    let place :Int?
    
    let start_time:String?
    
    let end_time:String?
    
    let content:String?
    
    let delete_flag:Int?
}

struct ErrorResponse:Codable {
    let success: Bool?
    let code: Int?
    let message: String?
}
