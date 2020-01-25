//
//  Headlines.swift
//  judiciousHeadlines
//
//  Created by Wesley Espinoza on 1/25/20.
//  Copyright © 2020 Erick Espinoza. All rights reserved.
//

import Foundation

public struct Headline: Codable{
    public let source: Source
    public let author: String
    public let title: String
    public let description: String
    public let url: String
    public let urlImage: String
    public let publishedAt: String
    public let content: String
}

