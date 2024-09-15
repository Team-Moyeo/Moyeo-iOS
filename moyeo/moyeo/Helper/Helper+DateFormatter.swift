//
//  Helper+DateFormatter.swift
//  moyeo
//
//  Created by kyungsoolee on 9/11/24.
//

import Foundation

extension Date {
    
    /// 2024.08.15 포맷 문자열을 반환합니다.
    var totalYearMonthDayFormat: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        return formatter.string(from: self)
    }
    
    /// 07/31/2024 포맷 문자열을 반환
    var monthDayYearFormat: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter.string(from: self)
    }
    
    /// 09:41 포맷 문자열을 반환
    var hourMinuteFormat: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: self)
    }
    
    /// 09:41 포맷 문자열을 반환
    var yearMonthDayFormat: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yy.MM.dd"
        return formatter.string(from: self)
    }
}
