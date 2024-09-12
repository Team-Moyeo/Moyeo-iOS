//
//  MockDataBuilder.swift
//  moyeo
//
//  Created by kyungsoolee on 9/5/24.
//

import Foundation

struct MockDataBuilder {
    
    // pendingMeetings 데이터를 반환합니다.
    static var pendingMeetings: [Meeting] {
        return [
            Meeting(
                id: 1,
                title: "오택동 첫 회식",
                startDate: "2024-08-12".toDate ?? Date(),
                endDate: "2024-08-14".toDate ?? Date(),
                startTime: "09:00".toTime ?? Date(),
                endTime: "24:00".toTime ?? Date(),
                fixedTimes: [
                    "2024-08-12 12:00".toDateTime ?? Date(),
                    "2024-08-12 12:30".toDateTime ?? Date(),
                    "2024-08-12 13:00".toDateTime ?? Date(),
                    "2024-08-12 13:30".toDateTime ?? Date()
                ],
                fixedPlaceId: 1,
                deadline: .now,
                numberOfPeople: 4,
                inviteCode: "DK3J3D"
            ),
            Meeting(
                id: 2,
                title: "오택동 첫 회식",
                startDate: "2024-08-12".toDate ?? Date(),
                endDate: "2024-08-14".toDate ?? Date(),
                startTime: "09:00".toTime ?? Date(),
                endTime: "24:00".toTime ?? Date(),
                fixedTimes: [
                    "2024-08-12 12:00".toDateTime ?? Date(),
                    "2024-08-12 12:30".toDateTime ?? Date(),
                    "2024-08-12 13:00".toDateTime ?? Date(),
                    "2024-08-12 13:30".toDateTime ?? Date()
                ],
                fixedPlaceId: 1,
                deadline: .now,
                numberOfPeople: 4,
                inviteCode: "DK3J3D"
            ),
            Meeting(
                id: 3,
                title: "오택동 첫 회식",
                startDate: "2024-08-12".toDate ?? Date(),
                endDate: "2024-08-14".toDate ?? Date(),
                startTime: "09:00".toTime ?? Date(),
                endTime: "24:00".toTime ?? Date(),
                fixedTimes: [
                    "2024-08-12 12:00".toDateTime ?? Date(),
                    "2024-08-12 12:30".toDateTime ?? Date(),
                    "2024-08-12 13:00".toDateTime ?? Date(),
                    "2024-08-12 13:30".toDateTime ?? Date()
                ],
                fixedPlaceId: 1,
                deadline: .now,
                numberOfPeople: 4,
                inviteCode: "DK3J3D"
            ),
        ]
    }
    
    // confirmMeetings 데이터를 반환합니다.
    static var confirmMeetings: [Meeting] {
        return [
            Meeting(
                id: 1,
                title: "와인 모임",
                startDate: "2024-08-12".toDate ?? Date(),
                endDate: "2024-08-14".toDate ?? Date(),
                startTime: "09:00".toTime ?? Date(),
                endTime: "24:00".toTime ?? Date(),
                fixedTimes: [
                    "2024-08-12 12:00".toDateTime ?? Date(),
                    "2024-08-12 12:30".toDateTime ?? Date(),
                    "2024-08-12 13:00".toDateTime ?? Date(),
                    "2024-08-12 13:30".toDateTime ?? Date()
                ],
                fixedPlaceId: 1,
                deadline: .now,
                numberOfPeople: 4,
                inviteCode: "DK3J3D"
            ),
            Meeting(
                id: 2,
                title: "와인 모임",
                startDate: "2024-08-12".toDate ?? Date(),
                endDate: "2024-08-14".toDate ?? Date(),
                startTime: "09:00".toTime ?? Date(),
                endTime: "24:00".toTime ?? Date(),
                fixedTimes: [
                    "2024-08-12 12:00".toDateTime ?? Date(),
                    "2024-08-12 12:30".toDateTime ?? Date(),
                    "2024-08-12 13:00".toDateTime ?? Date(),
                    "2024-08-12 13:30".toDateTime ?? Date()
                ],
                fixedPlaceId: 1,
                deadline: .now,
                numberOfPeople: 4,
                inviteCode: "DK3J3D"
            ),
            Meeting(
                id: 3,
                title: "와인 모임",
                startDate: "2024-08-12".toDate ?? Date(),
                endDate: "2024-08-14".toDate ?? Date(),
                startTime: "09:00".toTime ?? Date(),
                endTime: "24:00".toTime ?? Date(),
                fixedTimes: [
                    "2024-08-12 12:00".toDateTime ?? Date(),
                    "2024-08-12 12:30".toDateTime ?? Date(),
                    "2024-08-12 13:00".toDateTime ?? Date(),
                    "2024-08-12 13:30".toDateTime ?? Date()
                ],
                fixedPlaceId: 1,
                deadline: .now,
                numberOfPeople: 4,
                inviteCode: "DK3J3D"
            ),
            Meeting(
                id: 4,
                title: "와인 모임",
                startDate: "2024-08-12".toDate ?? Date(),
                endDate: "2024-08-14".toDate ?? Date(),
                startTime: "09:00".toTime ?? Date(),
                endTime: "24:00".toTime ?? Date(),
                fixedTimes: [
                    "2024-08-12 12:00".toDateTime ?? Date(),
                    "2024-08-12 12:30".toDateTime ?? Date(),
                    "2024-08-12 13:00".toDateTime ?? Date(),
                    "2024-08-12 13:30".toDateTime ?? Date()
                ],
                fixedPlaceId: 1,
                deadline: .now,
                numberOfPeople: 4,
                inviteCode: "DK3J3D"
            ),
        ]
    }
}
