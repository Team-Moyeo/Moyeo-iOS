//
//  Member.swift
//  moyeo
//
//  Created by kyungsoolee on 9/12/24.
//

import Foundation

struct Member {
    var id: Int
    // TODO: SocialType 개발 이후 연결
//    var socialType: SocialType
    var name: String
    var avatar: String
    var phoneNumber: String
    var email: String
    
    init(
        id: Int,
        // TODO: SocialType 개발 이후 연결
//        socialType: SocialType,
        name: String,
        avatar: String,
        phoneNumber: String,
        email: String
    ) {
        self.id = id
        // TODO: SocialType 개발 이후 연결
//        self.socialType = socialType
        self.name = name
        self.avatar = avatar
        self.phoneNumber = phoneNumber
        self.email = email
    }
}
