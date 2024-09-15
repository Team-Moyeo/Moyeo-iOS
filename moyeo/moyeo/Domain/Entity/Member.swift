//
//  Member.swift
//  moyeo
//
//  Created by kyungsoolee on 9/12/24.
//

import Foundation

protocol Client {
    var name: String { get set}
    var avatar: String { get set}
}

struct Member: Client {
    var id: Int
    var socialType: SocialType
    var name: String
    var avatar: String
    var phoneNumber: String
    var email: String
    
    init(
        id: Int,
        socialType: SocialType,
        name: String,
        avatar: String,
        phoneNumber: String,
        email: String
    ) {
        self.id = id
        self.socialType = socialType
        self.name = name
        self.avatar = avatar
        self.phoneNumber = phoneNumber
        self.email = email
    }
}

struct Participant: Client, Identifiable {
    var id: Int
    var name: String
    var avatar: String
    
    init(
        id: Int,
        name: String,
        avatar: String
    ) {
        self.id = id
        self.name = name
        self.avatar = avatar
    }
}
