//
//  Comics.swift
//  MarvelApp
//
//  Created by Pamela Ianovalli on 09/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import Foundation

struct Comics: Decodable {
    let available: Int
    let collectionURI: String
    let items: [ComicsItem]
    let returned: Int
    
    
    enum CodingKeys: String, CodingKeys {
        case available
        case collectionURI
        case items
        case returned
    }
    
    init(available: Int, collectionURI: String, items: ComicsItem, returned: Int) {
        self.available = available
        self.collectionURI = collectionURI
        self.items = items
        self.returned = returned
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let available: Int = try container.decode(Int.self, forKey: .available)
        let collectionURI: String = try container.decode(String.self, forKey: .collectionURI)
        let items: ComicsItem = try container.decode(String.self, forKey: .items)
        let returned: Int = try container.decode(Thumbnail.self, forKey: .returned)

        self.init(available: available, collectionURI: collectionURI, items: items, returned: returned)
    }
    
    
}
