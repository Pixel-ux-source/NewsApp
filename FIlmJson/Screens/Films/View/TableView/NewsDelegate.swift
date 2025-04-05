//
//  FilmDelegate.swift
//  FIlmJson
//
//  Created by Алексей on 01.04.2025.
//

import UIKit

final class NewsDelegate: NSObject, UITableViewDelegate {
    public var coordinator: AppCoordinator?
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        340
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        coordinator?.openToDetail()
    }
}
