//
//  Meeting.swift
//  moyeo
//
//  Created by kyungsoolee on 9/11/24.
//

import Foundation

struct Meeting: Identifiable {
    var id: Int
    var ownerId: Int
    var title: String
    var meetingStatus: MeetingStatus
    var startDate: Date
    var endDate: Date
    var startTime: Date
    var endTime: Date
    var fixedTimes: [Date]
    var fixedPlaceId: Int
    var deadline: Date
    var numberOfPeople: Int
    var inviteCode: String
    
    init(
        id: Int,
        ownerId: Int,
        title: String,
        meetingStatus: MeetingStatus,
        startDate: Date,
        endDate: Date,
        startTime: Date,
        endTime: Date,
        fixedTimes: [Date],
        fixedPlaceId: Int,
        deadline: Date,
        numberOfPeople: Int,
        inviteCode: String
    ) {
        self.id = id
        self.ownerId = ownerId
        self.title = title
        self.meetingStatus = meetingStatus
        self.startDate = startDate
        self.endDate = endDate
        self.startTime = startTime
        self.endTime = endTime
        self.fixedTimes = fixedTimes
        self.fixedPlaceId = fixedPlaceId
        self.deadline = deadline
        self.numberOfPeople = numberOfPeople
        self.inviteCode = inviteCode
    }
}
