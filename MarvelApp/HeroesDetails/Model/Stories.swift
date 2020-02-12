//
//  Stories.swift
//  MarvelApp
//
//  Created by Pamela Ianovalli on 09/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import Foundation

struct Stories: Decodable {
    let available: Int
    let collectionURI: String
    let items: [StoriesItem]
    let returned: Int
    
    enum CodingKeys: String, CodingKey {
        case available
        case collectionURI
        case items
        case returned
    }
    
    init(available: Int, collectionURI: String, items: [StoriesItem], returned: Int) {
        self.available = available
        self.collectionURI = collectionURI
        self.items = items
        self.returned = returned
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let available: Int = try container.decode(Int.self, forKey: .available)
        let collectionURI: String = try container.decode(String.self, forKey: .collectionURI)
        let items: [StoriesItem] = try container.decode([StoriesItem].self, forKey: .items)
        let returned: Int = try container.decode(Int.self, forKey: .returned)

        self.init(available: available, collectionURI: collectionURI, items: items, returned: returned)
    }
    
}
