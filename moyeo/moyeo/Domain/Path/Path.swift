//
//  Path.swift
//  moyeo
//
//  Created by kyungsoolee on 9/5/24.
//

import Foundation

enum ProfileSettingPath: Hashable {
    case profileView
}

enum MeetingVotePath: Hashable {
    case meetingVoteView
}

@Observable
final class PathModel {
    var profileSettingPath: [ProfileSettingPath] = []
}
