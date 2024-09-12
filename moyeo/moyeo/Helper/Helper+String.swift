//
//  Helper+String.swift
//  moyeo
//
//  Created by kyungsoolee on 9/12/24.
//

import Foundation

extension String {
    // 문자열을 Date로 변환하는 메서드
    var toDate: Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.date(from: self)
    }
    
    // 문자열을 Date(time)으로 변환하는 메서드
    var toTime: Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.date(from: self)
    }
    
    // 문자열을 DateTime으로 변환하는 메서드
    var toDateTime: Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        return formatter.date(from: self)
    }
}
