//
//  NetworkService.swift
//  FIlmJson
//
//  Created by Алексей on 02.04.2025.
//

import UIKit
import Alamofire
import CoreData

final class NetworkService {
    // MARK: – Set URL
    private let url = "https://newsapi.org/v2/everything"
    private let param: Parameters = [
        "q":"apple",
        "from":"2025-04-02",
        "to":"2025-04-02",
        "sortBy":"popularity",
        "apiKey":"f3c5a84e22bb4cfabad0cd31a6c89a8a"
    ]
    
    // MARK: – GET
    func getData(completion: @escaping (Result<[NewsDTO], Error>) -> ()) {
        AF.request(url, method: .get, parameters: param, headers: nil)
            .validate()
            .responseDecodable(of: ResponseAPI.self, queue: .global()) { response in
            switch response.result {
            case .success(let responseStruct):
                DispatchQueue.main.async {
                    completion(.success(responseStruct.articles))
                }
            case .failure(let error):
                print("❌ Error get data: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
    }
}
