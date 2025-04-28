//
//  NetworkService.swift
//  FIlmJson
//
//  Created by Алексей on 02.04.2025.
//

import UIKit
import Alamofire
import ObjectMapper

final class NetworkService {
    // MARK: – Set URL
    private let param: Parameters = [
        "q":"apple",
        "from":"2025-04-02",
        "to":"2025-04-02",
        "sortBy":"popularity",
        "apiKey":"f3c5a84e22bb4cfabad0cd31a6c89a8a"
    ]
    
    // MARK: – GET
    func getData<T: News>(_ type: T.Type, completion: @escaping ([String: Any]) -> ())
    where T: Mappable, T: NewsModelProtocol {
        AF.request(type.urlAPI(), method: .get, parameters: param, headers: nil).validate().responseData(queue: .global()) { (response) in
            switch response.result {
            case .success(let data):
                guard let res = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return }
                DispatchQueue.main.async {
                    completion(res)
                }
            case .failure(let error):
                print("❌Error: \(error.localizedDescription)")
            }
        }
    }
}


//"https://newsapi.org/v2/everything?q=apple&from=2025-04-02&to=2025-04-02&sortBy=popularity&apiKey=f3c5a84e22bb4cfabad0cd31a6c89a8a"
