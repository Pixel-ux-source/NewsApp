//
//  FilmDelegate.swift
//  FIlmJson
//
//  Created by Алексей on 01.04.2025.
//

import UIKit

final class NewsDelegate: NSObject, UITableViewDelegate {
    public var coordinator: AppCoordinator?
    weak var delegate: FilmsDelegateProtocol?
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        340
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let cell = tableView.cellForRow(at: indexPath) as? NewCell else { return }
        let image: UIImage? = cell.getImage()
        let date: String? = cell.getDate()
        let title: String? = cell.getTitle()
        let desc: String? = cell.getDescription()
        
        coordinator?.openToDetail(image, date, title, desc)
    }
}
