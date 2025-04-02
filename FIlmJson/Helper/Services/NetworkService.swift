//
//  NetworkService.swift
//  FIlmJson
//
//  Created by Алексей on 02.04.2025.
//

import UIKit

final class NetworkService {
    
    let url = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2025-03-02&sortBy=publishedAt&apiKey=f3c5a84e22bb4cfabad0cd31a6c89a8a")
    let session = URLSession(configuration: .default)
    
    func getData(_ completion: @escaping ([Films]) -> Void) {
        guard let url else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = session.dataTask(with: request) { data, response, error in
            do {
                guard let data else { return }
                let json = try? JSONSerialization.jsonObject(with: data)
                guard let jsonData = json as? [String: Any] else { return }
                
                guard let arrayNews = jsonData["articles"] as? NSArray else { return }
                
                arrayNews.forEach { news in
                    guard let unwrpNews = news as? [String:Any] else { return }
                    guard let titleNews = unwrpNews["title"] as? String else { return }
                    
                    DispatchQueue.main.async {
                        print(titleNews)
                    }
                }
                
                arrayNews.forEach { news in
                    guard let unwrpNews = news as? [String:Any] else { return }
                    guard let descriptions = unwrpNews["description"] as? String else { return }
                    
                    DispatchQueue.main.async {
                        print(descriptions)
                    }
                }
                
                arrayNews.forEach { news in
                    guard let unwrpNews = news as? [String:Any] else { return }
                    guard let urlToImage = unwrpNews["urlToImage"] as? String else { return }
                    DispatchQueue.main.async {
                        print(urlToImage)
                    }
                }
                
                arrayNews.forEach { news in
                    guard let unwrpNews = news as? [String:Any] else { return }
                    guard let publishedAt = unwrpNews["publishedAt"] as? String else { return }
                    DispatchQueue.main.async {
                        print(publishedAt)
                    }
                }
            }
        }
        task.resume()
    }
}
