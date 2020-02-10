//
//  NewsAPISerive.swift
//  judiciousHeadlines
//
//  Created by Wesley Espinoza on 1/25/20.
//  Copyright © 2020 Erick Espinoza. All rights reserved.
//

import Foundation
import UIKit
class NewsServiceAPI {
    let userdefaults = UserDefaults.standard
    public static let shared = NewsServiceAPI()
    private init() {}
    private let urlSession = URLSession.shared
    private let baseURLString = "https://newsapi.org/v2/"
    private let apiKey = Secret.api
    private var newsResponse: Article!
    
    
    
    
    private let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        return jsonDecoder
    }()
    
    func getTopHeadLines(completion: @escaping (_ article: Article) -> ()){
        let url = URL(string: "\(baseURLString)top-headlines?country=us&apiKey=\(apiKey)")
        let task = urlSession.dataTask(with: url!, completionHandler: { data, response, error in

           if error != nil {
                // OH NO! An error occurred...
            print(error as Any)
                return
            }
            
            
            let articles = try? JSONDecoder().decode(Article.self, from: data!)
            
            DispatchQueue.main.async {
                completion(articles!)
            }
           
            
        })
        task.resume()
    }
    
    func getForYouHeadlines(completion: @escaping (_ article: Article) -> ()){
        let categories: [String] = UserDefaults.standard.array(forKey: "SelectedCategories") as! [String]
        let categoriesString = categories.joined(separator: "&")
        let fix = categoriesString.replacingOccurrences(of: " ", with: "_")
        
        
        
        let url = URL(string: "\(baseURLString)everything?q=\(fix)&apiKey=\(apiKey)")
        let task = urlSession.dataTask(with: url!, completionHandler: { data, response, error in

           if error != nil {
                // OH NO! An error occurred...
            print(error as Any)
                return
            }
            
            let articles = try? JSONDecoder().decode(Article.self, from: data!)
            
            DispatchQueue.main.async {
                completion(articles!)
            }
           
            
        })
        task.resume()
    }
    
    
    func getImageFromURL(url: URL, completion: @escaping (_ image: UIImage) -> ()){
        
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() {
                completion(UIImage(data: data)!)
            }
        }
    }
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    
}

