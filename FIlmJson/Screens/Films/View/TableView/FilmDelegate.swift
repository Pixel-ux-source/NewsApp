//
//  FilmDelegate.swift
//  FIlmJson
//
//  Created by Алексей on 01.04.2025.
//

import UIKit

final class FilmDelegate: NSObject, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        240
    }
}
