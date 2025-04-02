//
//  FilmsDataSource.swift
//  FIlmJson
//
//  Created by Алексей on 01.04.2025.
//

import UIKit

final class FilmsDataSource: NSObject, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FilmCell.id) as? FilmCell else { fatalError("ERROR_FILM_CELL_ID") }
        
        return cell
    }
    
    
}
