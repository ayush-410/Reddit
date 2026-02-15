//
//  Post.swift
//  Reddit
//
//  Created by Cody Robertson on 5/20/19.
//  Copyright © 2019 Cody Robertson. All rights reserved.
//

import Foundation


struct Post: Decodable, Equatable, Hashable, Identifiable {
    
    /// id of the post
    let id: String
    
    /// The title of the post.
    let title: String

    /// The subreddit the post belongs to.
    let subreddit: String

    /// The URL the post lives at.
    let url: String?

}


// MARK: -
// MARK: Decodable

extension Post {

    enum CodingKeys: String, CodingKey {
        case data = "data"
        case title = "title"
        case subreddit = "subreddit"
        case url = "url"
        case id = "id"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let data = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)

        title = try data.decode(String.self, forKey: .title)
        subreddit = try data.decode(String.self, forKey: .subreddit)
        url = try? data.decode(String.self, forKey: .url)
        id = try data.decode(String.self, forKey: .id)
    }

}
