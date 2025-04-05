//
//  DetailController.swift
//  FIlmJson
//
//  Created by Алексей on 04.04.2025.
//

import UIKit

final class DetailController: UIViewController {
    // MARK: – UI Element
    private lazy var titleImage: UIImageView = TitleImage()
    
    // MARK: – Presenter
    public var presenter: PresenterDetail!
    
    // MARK: – Coordinator
    public var coordinator: AppCoordinator?
    
    // MARK: – Lyfe Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    // MARK: – Configure View
    private func configureView() {
        view.backgroundColor = .filmsTable
        
        let apperance = UINavigationBarAppearance()
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = apperance
    }
}

extension DetailController: DetailControllerProtocol {
    
}
