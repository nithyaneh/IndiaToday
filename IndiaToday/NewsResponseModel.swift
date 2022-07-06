//
//  NewsResponseModel.swift
//  IndiaToday
//
//  Created by Nithya Nehru on 06/07/22.
//

import Foundation

struct NewsSourcesResponse: Codable {
    let articles: [Article]
}

struct Article: Codable {
    
    let title: String
    let description: String?
    let url: String?
    let imageURL: String?
    let sourceName: String
    
    private enum ArticleKeys: String, CodingKey {
        case title
        case description
        case url
        case imageURL = "urlToImage"
        case source
    }
    
    private enum SourceKeys: String, CodingKey {
        case name
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ArticleKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try? container.decode(String.self, forKey: .description)
        self.url = try? container.decode(String.self, forKey: .url)
        self.imageURL = try? container.decode(String.self, forKey: .imageURL)
        
        let sourceContainer = try container.nestedContainer(keyedBy: SourceKeys.self, forKey: .source)
        self.sourceName = try sourceContainer.decode(String.self, forKey: .name)
    }
}

