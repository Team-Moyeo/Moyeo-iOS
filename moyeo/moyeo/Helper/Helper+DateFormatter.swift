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
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy.MM.dd"
        return formatter.string(from: self)
    }
    
    /// 2024.08.15 포맷 문자열을 반환합니다.
    var totalYearMonthDaySnakeFormat: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: self)
    }
    
    /// 07/31/2024 포맷 문자열을 반환
    var monthDayYearFormat: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter.string(from: self)
    }
    
    /// 07/31/2024 포맷 문자열을 반환
    var dateTimeFormat: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "MM-dd\nHH:mm"
        return formatter.string(from: self)
    }
    
    /// 09:41 포맷 문자열을 반환
    var hourMinuteFormat: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: self)
    }
    
    /// 09:41 포맷 문자열을 반환
    var yearMonthDayFormat: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yy.MM.dd"
        return formatter.string(from: self)
    }
    
    
    // 날짜 형식 변환을 위한 함수
    var deadlineFormat: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy년 M월 d일 (E)"
        return formatter.string(from: self)
    }
    
    var dateFormat: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "M월 d일 (E)"
        return formatter.string(from: self)
    }
    
    var dayFormat: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "d일(E)"
        return formatter.string(from: self)
    }
}
