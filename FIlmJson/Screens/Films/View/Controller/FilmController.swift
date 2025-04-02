//
//  ViewController.swift
//  FIlmJson
//
//  Created by Алексей on 01.04.2025.
//

import UIKit
import SnapKit

protocol FilmControllerProtocol: AnyObject {
    
}

// https://newsapi.org/v2/everything?q=tesla&from=2025-03-02&sortBy=publishedAt&apiKey=f3c5a84e22bb4cfabad0cd31a6c89a8a

final class FilmController: UIViewController {
    // MARK: – Instances
    private let tableView = FilmsTable()
    private let dataSource = FilmsDataSource()
    private let delegate = FilmDelegate()
    
    // MARK: – Coordinator
    public var coordinator: AppCoordinator?
    
    // MARK: – Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureTV()
    }

    // MARK: – Configure View
    private func configureView() {
        view.backgroundColor = .white
        // Прибить к левому краю
        self.title = "Новости"
        
        let attributes: [NSAttributedString.Key : Any] = [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 25, weight: .black)
        ]
        
        navigationController?.navigationBar.titleTextAttributes = attributes
        navigationController?.navigationBar.largeTitleTextAttributes = attributes
    }
    
    // MARK: – configureTV
    private func configureTV() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(view.frame.height)
            make.width.equalTo(view.frame.width)
        }
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
}

