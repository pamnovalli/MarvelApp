//
//  CharacterData.swift
//  MarvelApp
//
//  Created by Pamela Ianovalli on 24/10/19.
//  Copyright © 2019 Pamela Ianovalli. All rights reserved.
//

import Foundation

struct HeroData: Decodable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [Hero]
    
    
    enum CodingKeys: String, CodingKey {
        case offset
        case limit
        case total
        case count
        case results
    }
    
    
    init(offset: Int, limit: Int, total: Int, count: Int, results: [Hero]) {
        
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
        let results: [Hero] = try container.decode([Hero].self, forKey: .results)
        
        self.init(offset: offset, limit: limit, total: total, count: count, results: results)
    }
    
}
