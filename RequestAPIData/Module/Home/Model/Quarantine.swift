//
//  Quarantine.swift
//  RequestAPIData
//
//  Created by Haryanto Salim on 16/07/20.
//  Copyright © 2020 Haryanto Salim. All rights reserved.
//

import Foundation

//"status": 200,
//"type": "stack",

struct Quarantine: Codable {
    //property
    let status: Int?
    let type: String?
    let data: QuarantineData?
    
    //enum
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case type = "type"
        case data = "data"
    }
    
}

struct QuarantineData: Codable {
    //property
    let summary: Summary?
    let change: Summary?
    let generatedOn: Int?
    
    //enum
    enum CodingKeys: String, CodingKey {
        case summary = "summary"
        case change = "change"
        case generatedOn = "generated_on"
    }
    
}

struct Summary: Codable {
    //define semua property yang bisa kita dapatkan dari API
    let totalCases: Int?
    let activeCases: Int?
    let deaths: Int?
    let recovered: Int?
    let critical: Int?
    let tested: Int?
    let deathRatio: Double?
    let recoveryRatio: Double?
    
    //define enum untuk mengkonfirmasi text/key yang digunakan di dalam JSON API
    enum CodingKeys: String, CodingKey {
        case totalCases = "total_cases"
        case activeCases = "active_cases"
        case deaths = "deaths"
        case recovered = "recovered"
        case critical = "critical"
        case tested = "tested"
        case deathRatio = "death_ratio"
        case recoveryRatio = "recovery_ratio"
    }
}
