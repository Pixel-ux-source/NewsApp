//
//  FilmsDataSource.swift
//  FIlmJson
//
//  Created by Алексей on 01.04.2025.
//

import UIKit

final class NewsDataSource: NSObject, UITableViewDataSource {
    var model: [News] = CoreDataManager.shared.fetchData()
    private let network = NetworkService()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewCell.id) as? NewCell else { fatalError("ERROR_FILM_CELL_ID") }
        // Разобраться с @escaping
        // Понять где create
        
        let item = model[indexPath.row]
        
        // Как работать с кешем?
        cell.set(item.titleNews, item.descriptions, item.date)
 
        network.readUrl(item.photo) { data in
            guard let data else { return }
            cell.setImage(data)
        }
        return cell
    }
}
