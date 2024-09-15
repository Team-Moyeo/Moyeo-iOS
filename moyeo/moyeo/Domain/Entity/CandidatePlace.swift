//
//  CandidatePlace.swift
//  moyeo
//
//  Created by kyungsoolee on 9/12/24.
//

import Foundation

struct CandidatePlace: Identifiable {
    var id: Int
    var meetingId: Int
    var placeId: Int
    var memberid: Int
    var voteCount: Int
    
    init(
        id: Int,
        meetingId: Int,
        placeId: Int,
        memberid: Int,
        voteCount: Int
    ) {
        self.id = id
        self.meetingId = meetingId
        self.placeId = placeId
        self.memberid = memberid
        self.voteCount = voteCount
    }
}
