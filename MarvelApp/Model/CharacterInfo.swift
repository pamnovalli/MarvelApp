//
//  CharacterInfo.swift
//  MarvelApp
//
//  Created by felipecardoso on 05/07/19.
//  Copyright © 2019 Pamela Ianovalli. All rights reserved.
//

import Foundation

struct CharacterInfo: Decodable {
    let code: Int
    let status: String
    let data: CharacterData
    
    enum CodingKeys: String, CodingKey {
        case code
        case status
        case data
    }
    
    init(code: Int, status: String, data: CharacterData) {
        self.code = code
        self.status = status
        self.data = data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let code: Int = try container.decode(Int.self, forKey: .code)
        let status: String = try container.decode(String.self, forKey: .status)
        let data: CharacterData = try container.decode(CharacterData.self, forKey: .data)
        
        self.init(code: code, status: status, data: data)
    }
}
