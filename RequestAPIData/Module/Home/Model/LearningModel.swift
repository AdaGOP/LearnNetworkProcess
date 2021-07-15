//
//  LearningModel.swift
//  RequestAPIData
//
//  Created by zein rezky chandra on 15/07/21.
//  Copyright © 2021 Haryanto Salim. All rights reserved.
//

import Foundation

struct LearningData: Codable {
    let records: [LearningDataResponse]?
}

struct LearningDataResponse: Codable {
    let id: String?
    let fields: LearningDataFieldResponse?
    let createdTime: String?
}

struct LearningDataFieldResponse: Codable {
    let Status: String?
    let Namee: String?
    let Date: String?
    let type: String?
    let ActivityCode: String?
}
