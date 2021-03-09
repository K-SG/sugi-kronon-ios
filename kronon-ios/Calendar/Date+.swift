//
//  Date+.swift
//  kronon-ios
//
//  Created by 杉浩輝 on 2021/03/08.
//

import Foundation

extension Date{
    func monthAgoDate() -> Date? {
        let addValue = -1
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.month = addValue
        return calendar.date(byAdding: dateComponents, to: self)
    }
    
    func monthLaterDate() -> Date? {
        let addValue = 1
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.month = addValue
        return calendar.date(byAdding: dateComponents, to: self)
    }
}
