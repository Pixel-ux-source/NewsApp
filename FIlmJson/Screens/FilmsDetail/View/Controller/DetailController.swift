//
//  DetailController.swift
//  FIlmJson
//
//  Created by Алексей on 04.04.2025.
//

import UIKit
import SnapKit

final class DetailController: UIViewController {
    // MARK: – UI Element
    private lazy var titleImage: UIImageView = TitleImage()
    private lazy var dateLabel: UILabel = DateLabel()
    private lazy var titleLabel: UILabel = TitleLabel()
    private lazy var descLabel: UILabel = DescLabel()
    
    // MARK: – Presenter
    public var presenter: PresenterDetail!
    
    // MARK: – Coordinator
    public var coordinator: AppCoordinator?
    
    // MARK: – Lyfe Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setupUI()
    }
    
    // MARK: – Configure View
    private func configureView() {
        view.backgroundColor = .filmsTable
        
        let apperance = UINavigationBarAppearance()
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = apperance
    }
    
    // MARK: – Setup UI
    private func setupUI() {
        view.addSubviews(titleImage, dateLabel, titleLabel, descLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        titleImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(14)
            make.height.equalTo(200)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(titleImage.snp_bottomMargin).offset(10)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(20)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp_bottomMargin).offset(15)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        descLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp_bottomMargin).offset(25)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
    }
}

extension DetailController: DetailControllerProtocol {
    
}

extension DetailController: FilmsDelegateProtocol {
    func didSelect(_ image: UIImage?, _ date: String?, _ title: String?, _ description: String?) {
        titleImage.image = image
        dateLabel.text = date
        titleLabel.text = title
        descLabel.text = description
    }
}
