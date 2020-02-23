//
//  DataClass.swift
//  MarvelApp
//
//  Created by Pamela Ianovalli on 09/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import Foundation

struct DataClass: Decodable {
    
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [Result]

    enum CodingKeys: String, CodingKey  {
        case offset
        case limit
        case total
        case count
        case results
    }

    init(offset: Int, limit: Int, total: Int, count: Int, results: [Result]) {
        self.offset = offset
        self.limit = limit
        self.total = total
        self.count = count
        self.results = results
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let offset: Int = try container.decode(Int.self, forKey: .offset)
        let limit: Int = try container.decode(Int.self, forKey: .limit)
        let total: Int = try container.decode(Int.self, forKey: .total)
        let count: Int = try container.decode(Int.self, forKey: .count)
        let results: [Result] = try container.decode([Result].self, forKey: .results)

        self.init(offset: offset, limit: limit, total: total, count: count, results: results)
    }
    
}
