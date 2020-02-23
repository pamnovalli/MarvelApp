//
//  Result.swift
//  MarvelApp
//
//  Created by Pamela Ianovalli on 09/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import Foundation

struct Result: Decodable {
    let id: Int
    let name: String
    let resultDescription: String
    let modified: Date
    let thumbnail: Thumbnail
    let resourceURI: String
    let comics, series: Comics
    let stories: Stories
    let events: Comics
    let urls: [URLElement]
    
    enum CodingKeys: String, CodingKey  {
        case id, name
        case resultDescription = "description"
        case modified, thumbnail, resourceURI, comics, series, stories, events, urls
    }
    
    init(id: Int, name: String, resultDescription: String, modified: Date, thumbnail: Thumbnail, resourceURI: String, comics: Comics, series: Comics, stories: Stories, events: Comics, urls: [URLElement]) {
        self.id = id
        self.name = name
        self.modified = modified
        self.thumbnail = thumbnail
        self.resourceURI = resourceURI
        self.comics = comics
        self.series = series
        self.stories = stories
        self.events = events
        self.urls = urls
        self.resultDescription = resultDescription
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let id: Int = try container.decode(Int.self, forKey: .id)
        let name: String = try container.decode(String.self, forKey: .name)
        let resultDescription: String = try container.decode(String.self, forKey: .resultDescription)
        let strModified: String = try container.decode(String.self, forKey: .modified)
        
        let thumbnail: Thumbnail = try container.decode(Thumbnail.self, forKey: .thumbnail)
        let resourceURI: String = try container.decode(String.self, forKey: .resourceURI)
        let comics: Comics = try container.decode(Comics.self, forKey: .comics)
        let series: Comics = try container.decode(Comics.self, forKey: .series)
        let stories: Stories = try container.decode(Stories.self, forKey: .stories)
        let events: Comics = try container.decode(Comics.self, forKey: .events)
        let urls: [URLElement] = try container.decode([URLElement].self, forKey: .urls)
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let modified = (dateFormatter.date(from: strModified) as! Date)
        
        self.init(
            id: id,
            name: name,
            resultDescription : resultDescription,
            modified: modified,
            thumbnail: thumbnail,
            resourceURI: resourceURI,
            comics: comics,
            series : series,
            stories: stories,
            events: events,
            urls: urls
        )
    }
    
}
