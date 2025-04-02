//
//  FilmsTable.swift
//  FIlmJson
//
//  Created by Алексей on 01.04.2025.
//

import UIKit

final class FilmsTable: UITableView {
    
    // MARK: – Lyfe Cycle
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        registerCell()
        configureTableView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: – Configure Table View
    private func configureTableView() {
        backgroundColor = .filmsTable
    }
    
    // MARK: – Register Cell
    private func registerCell() {
        register(FilmCell.self, forCellReuseIdentifier: FilmCell.id)
    }
    
}
