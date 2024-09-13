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

@Observable
final class PathModel {
    var profileSettingPath: [ProfileSettingPath] = []
}
