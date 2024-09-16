//
//  CandidateTime.swift
//  moyeo
//
//  Created by kyungsoolee on 9/16/24.
//

import Foundation

struct CandidateTime: Identifiable, Hashable {
    let id = UUID()
    var dateTime: Date
    var voteCount: Int
    
    init(
        dateTime: Date,
        voteCount: Int
    ) {
        self.dateTime = dateTime
        self.voteCount = voteCount
    }
    static func == (lhs: CandidateTime, rhs: CandidateTime) -> Bool {
        return lhs.dateTime == rhs.dateTime && lhs.voteCount == rhs.voteCount
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(dateTime)
        hasher.combine(voteCount)
    }
//    // id를 기준으로 객체를 비교
//    static func == (lhs: CandidateTime, rhs: CandidateTime) -> Bool {
//        return lhs.id == rhs.id
//    }
//
//    // id를 기준으로 해시값 생성
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(id)
//    }
}
