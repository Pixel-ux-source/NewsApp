//
//  FilmsDataSource.swift
//  FIlmJson
//
//  Created by Алексей on 01.04.2025.
//

import UIKit
import SDWebImage

final class NewsDataSource: NSObject, UITableViewDataSource {
    var model: [News] = []
    private let network = NetworkService()
    private let imageCache = NSCache<NSString, NSData>()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewCell.id) as? NewCell else { fatalError("ERROR_FILM_CELL_ID") }
        
        let item = model[indexPath.row]
        cell.set(item.titleNews, item.descriptions, item.date)

        // Добавить многопоточку в сервис и кор дату менеджер
        let url = URL(string: item.photo)
        cell.mainImage.sd_setImage(with: url,
                                   placeholderImage: UIImage(systemName: "photo"),
                                   options: .fromCacheOnly,
                                   context: nil)
        
        return cell
    }
}
