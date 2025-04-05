//
//  ViewController.swift
//  FIlmJson
//
//  Created by Алексей on 01.04.2025.
//

import UIKit
import SnapKit

final class NewsController: UIViewController {
    var presesnter: PresenterProtocol!
    
    // MARK: – Instances
    private let network = NetworkService()
    private let tableView = NewsTable()
    private let dataSource = NewsDataSource()
    private let delegate = NewsDelegate()
    
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
        // Прибить к левому краю?
        self.title = "News"
        let apperance = UINavigationBarAppearance()
        apperance.configureWithOpaqueBackground()
        apperance.backgroundColor = .darkGray
        apperance.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 25, weight: .black)
        ]
        
        let scrolledApperance = UINavigationBarAppearance()
        scrolledApperance.configureWithOpaqueBackground()
        scrolledApperance.backgroundColor = .darkGray
        scrolledApperance.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 25, weight: .black)
        ]
        
        navigationController?.navigationBar.standardAppearance = apperance
        navigationController?.navigationBar.scrollEdgeAppearance = scrolledApperance
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
        delegate.coordinator = coordinator
    }
}

extension NewsController: NewsControllerProtocol {
    func setupData(_ model: [News]) {
        dataSource.model = model
    }
}
