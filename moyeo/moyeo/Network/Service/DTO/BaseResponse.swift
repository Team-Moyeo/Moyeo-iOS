//
//  BaseResponse.swift
//  moyeo
//
//  Created by kyungsoolee on 9/5/24.
//

import Foundation

struct BaseResponse<ResultType: Decodable>: Decodable {
    let timestamp: String
    let code: String
    let message: String
    let result: ResultType
}
