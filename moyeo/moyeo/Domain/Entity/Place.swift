//
//  Place.swift
//  moyeo
//
//  Created by kyungsoolee on 9/12/24.
//

import Foundation

struct Place: Identifiable {
    var id: Int
    var memberId: Int
    var title: String
    var address: String
    var latitude: Double
    var longitude: Double
    
    init(
        id: Int,
        memberId: Int,
        title: String,
        address: String,
        latitude: Double,
        longitude: Double
    ) {
        self.id = id
        self.memberId = memberId
        self.title = title
        self.address = address
        self.latitude = latitude
        self.longitude = longitude
    }
}
