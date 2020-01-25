//
//  NewsAPISerive.swift
//  judiciousHeadlines
//
//  Created by Wesley Espinoza on 1/25/20.
//  Copyright © 2020 Erick Espinoza. All rights reserved.
//

import Foundation
class MovieServiceAPI {
    
    public static let shared = MovieServiceAPI()
    private init() {}
    private let urlSession = URLSession.shared
    private let baseURL = URL(string: "https://newsapi.org/v2/")!
    private let apiKey = "PUT_API KEY HERE"
    private let jsonDecoder: JSONDecoder = {
       let jsonDecoder = JSONDecoder()
       jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
       let dateFormatter = DateFormatter()
       dateFormatter.dateFormat = "yyyy-mm-dd"
       jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
       return jsonDecoder
    }()
    // Enum Endpoint
    enum Endpoint: String, CustomStringConvertible, CaseIterable {
        case nowPlaying = "now_playing"
        case upcoming
        case popular
        case topRated = "top_rated"
    }
}
