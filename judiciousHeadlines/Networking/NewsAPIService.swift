//
//  NewsAPISerive.swift
//  judiciousHeadlines
//
//  Created by Wesley Espinoza on 1/25/20.
//  Copyright © 2020 Erick Espinoza. All rights reserved.
//

import Foundation
class NewsServiceAPI {
    
    public static let shared = NewsServiceAPI()
    private init() {}
    private let urlSession = URLSession.shared
    private let baseURL = URL(string: "https://newsapi.org/v2/")!
    private let jsonDecoder: JSONDecoder = {
       let jsonDecoder = JSONDecoder()
       jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
       let dateFormatter = DateFormatter()
       dateFormatter.dateFormat = "yyyy-mm-dd"
       jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
       return jsonDecoder
    }()
    
}
