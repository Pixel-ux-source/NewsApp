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
        presesnter.showData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBarScrolled()
    }

    // MARK: – Configure View
    private func configureView() {
        view.backgroundColor = .white
        configureNavigationBarStatic()
    }
    
    // MARK: – Configure Nav Bar
    private func configureNavigationBarScrolled() {
        self.title = "News"
        let apperance = UINavigationBarAppearance()
        apperance.configureWithOpaqueBackground()
        apperance.backgroundColor = .darkGray
        apperance.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 25, weight: .black)
        ]
        
        navigationController?.navigationBar.standardAppearance = apperance
    }
    
    private func configureNavigationBarStatic() {
        let scrolledApperance = UINavigationBarAppearance()
        scrolledApperance.configureWithOpaqueBackground()
        scrolledApperance.backgroundColor = .darkGray
        scrolledApperance.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 25, weight: .black)
        ]
        
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

// MARK: – Extension's
extension NewsController: NewsControllerProtocol {
    func setupData(_ model: [News]) {
        if model.isEmpty {
            network.getData { result in
                switch result {
                case .success(let dtoList):
                    CoreDataManager.shared.createData(from: dtoList)
                    let newModel = CoreDataManager.shared.fetchData()
                    self.dataSource.model = newModel
                    self.tableView.reloadData()
                case .failure(let error):
                    print("❌ Error: \(error.localizedDescription)")
                }
            }
        } else {
            dataSource.model = model
            tableView.reloadData()
        }
    }
}
