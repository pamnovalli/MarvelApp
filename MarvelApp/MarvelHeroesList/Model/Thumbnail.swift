//
//  Thumbnail.swift
//  MarvelApp
//
//  Created by Pamela Ianovalli on 24/10/19.
//  Copyright © 2019 Pamela Ianovalli. All rights reserved.
//

import Foundation

struct Thumbnail: Decodable {
    let path: String
    let ext: String
    
    var url: String {
        return path + "." + ext
    }
    
    enum CodingKeys: String, CodingKey {
        case path
        case ext = "extension"
        
    }
    
    init(path: String, ext: String) {
        
        self.path = path
        self.ext = ext
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let path: String = try container.decode(String.self, forKey: .path)
        let ext: String = try container.decode(String.self, forKey: .ext)
        
        self.init(path: path, ext: ext)
    }
    
}
