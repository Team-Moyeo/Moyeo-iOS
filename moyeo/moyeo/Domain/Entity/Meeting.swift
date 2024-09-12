//
//  Meeting.swift
//  moyeo
//
//  Created by kyungsoolee on 9/11/24.
//

import Foundation

struct Meeting: Identifiable {
    var id: Int
    var title: String
    // TODO: Place Entity 개발 이후 연결
//    var meetingStatus: MeetingStatus
    var startDate: Date
    var endDate: Date
    var startTime: Date
    var endTime: Date
    var fixedTimes: [Date]
    // TODO: Place Entity 개발 이후 연결
//    var fixedPlace: [Place]
    var deadline: Date
    var numberOfPeople: Int
    var inviteCode: String
    
    init(
        id: Int,
        title: String,
        // TODO: Place Entity 개발 이후 연결
//        meetingStatus: String,
        startDate: Date,
        endDate: Date,
        startTime: Date,
        endTime: Date,
        // TODO: Place Entity 개발 이후 연결
        fixedTimes: [Date],
        deadline: Date,
        numberOfPeople: Int,
        inviteCode: String
    ) {
        self.id = id
        self.title = title
        // TODO: Place Entity 개발 이후 연결
//        self.meetingStatus = meetingStatus
        self.startDate = startDate
        self.endDate = endDate
        self.startTime = startTime
        self.endTime = endTime
        self.fixedTimes = fixedTimes
        // TODO: Place Entity 개발 이후 연결
//        self.fixedPlace = fixedPlace
        self.deadline = deadline
        self.numberOfPeople = numberOfPeople
        self.inviteCode = inviteCode
    }
}
