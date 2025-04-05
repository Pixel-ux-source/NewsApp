//
//  NetworkService.swift
//  FIlmJson
//
//  Created by Алексей on 02.04.2025.
//

import UIKit

final class NetworkService {
    
    private let url = URL(string: "https://newsapi.org/v2/everything?q=apple&from=2025-04-02&to=2025-04-02&sortBy=popularity&apiKey=f3c5a84e22bb4cfabad0cd31a6c89a8a")
    private let session = URLSession(configuration: .default)
    
    func getData() {
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
                    guard let descriptions = unwrpNews["description"] as? String else { return }
                    guard let urlToImage = unwrpNews["urlToImage"] as? String else { return }
                    guard let publishedAt = unwrpNews["publishedAt"] as? String else { return }

                    DispatchQueue.main.async {
                        CoreDataManager.shared.createData(title: titleNews, descriptions: descriptions, image: urlToImage, date: publishedAt)
                    }
                }
            }
        }
        task.resume()
    }
    
    func readUrl(_ urlImage: String?, _ completion: @escaping (Data?) -> ()) {
        guard let urlImage else { return }
        guard let url = URL(string: urlImage) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("❌ Error from task \(error.localizedDescription)")
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else { return }
            print("✅ Request success: \(response.statusCode)")
            
            completion(data)
        }
        task.resume()
    }
}

