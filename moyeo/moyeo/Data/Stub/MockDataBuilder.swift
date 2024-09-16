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
                ownerId: 1,
                title: "오택동 첫 회식",
                meetingStatus: .PENDING,
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
                ownerId: 1,
                title: "오택동 첫 회식",
                meetingStatus: .PENDING,
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
                ownerId: 1,
                title: "오택동 첫 회식",
                meetingStatus: .PENDING,
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
                ownerId: 1,
                title: "와인 동아리",
                meetingStatus: .CONFIRM,
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
                ownerId: 1,
                title: "와인 동아리",
                meetingStatus: .CONFIRM,
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
                ownerId: 1,
                title: "와인 동아리",
                meetingStatus: .CONFIRM,
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
                ownerId: 1,
                title: "와인 동아리",
                meetingStatus: .CONFIRM,
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
    
    // participants 데이터를 반환합니다.
    static var participants: [Participant] {
        return [
            Participant(id: 1, name: "리버", avatar: "https://avatars.githubusercontent.com/u/175570696?s=200&v=4"),
            Participant(id: 2, name: "밀루", avatar: "https://avatars.githubusercontent.com/u/175570696?s=200&v=4"),
            Participant(id: 3, name: "이수", avatar: "https://avatars.githubusercontent.com/u/175570696?s=200&v=4"),
            Participant(id: 4, name: "오스틴", avatar: "https://avatars.githubusercontent.com/u/175570696?s=200&v=4"),
            Participant(id: 5, name: "미아", avatar: "https://avatars.githubusercontent.com/u/175570696?s=200&v=4")
        ]
    }
    
    // meeting 데이터를 반환합니다.
    static var meeting: Meeting {
        return Meeting(
            id: 1,
            ownerId: 1,
            title: "와인 동아리",
            meetingStatus: .CONFIRM,
            startDate: "2024-08-12".toDate ?? Date(),
            endDate: "2024-08-14".toDate ?? Date(),
            startTime: "09:00".toTime ?? Date(),
            endTime: "12:00".toTime ?? Date(),
            fixedTimes: [
                "2024-08-12 09:00".toDateTime ?? Date(),
                "2024-08-12 09:30".toDateTime ?? Date(),
                "2024-08-12 10:00".toDateTime ?? Date(),
                "2024-08-12 10:30".toDateTime ?? Date()
            ],
            fixedPlaceId: 1,
            deadline: "2024-08-10 09:00".toDateTime ?? Date(),
            numberOfPeople: 4,
            inviteCode: "DK3J3D"
        )
    }
}
