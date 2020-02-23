//
//  HeroDetail.swift
//  MarvelApp
//
//  Created by Pamela Ianovalli on 09/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import Foundation

struct HeroDetail: Decodable {
    
    let code: Int
    let status: String
    let copyright: String
    let attributionText: String
    let attributionHTML: String
    let etag: String
    let data: DataClass
    
    enum CodingKeys: String, CodingKey  {
        case code
        case status
        case copyright
        case attributionText
        case attributionHTML
        case etag
        case data
    }
    
    init(code: Int, status: String, copyright: String, attributionText: String, attributionHTML: String, etag: String, data: DataClass) {
        self.code = code
        self.status = status
        self.copyright = copyright
        self.attributionText = attributionText
        self.attributionHTML = attributionHTML
        self.etag = etag
        self.data = data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let code: Int = try container.decode(Int.self, forKey: .code)
        let status: String = try container.decode(String.self, forKey: .status)
        let copyright: String = try container.decode(String.self, forKey: .copyright)
        let attributionText: String = try container.decode(String.self, forKey: .attributionText)
        let attributionHTML: String = try container.decode(String.self, forKey: .attributionHTML)
        let etag: String = try container.decode(String.self, forKey: .etag)
        let data: DataClass = try container.decode(DataClass.self, forKey: .data)
        
        self.init(code: code, status: status, copyright: copyright, attributionText: attributionText, attributionHTML: attributionHTML, etag: etag, data: data)
    }
    
}

