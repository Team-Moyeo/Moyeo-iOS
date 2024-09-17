//
//  Path.swift
//  moyeo
//
//  Created by kyungsoolee on 9/5/24.
//

import Foundation

enum MainPath: Hashable {
    case profileView
    case meetingVoteView
}

@Observable
final class PathModel {
    var mainPaths: [MainPath] = []
}
