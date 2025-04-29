//
//  FilmCell.swift
//  FIlmJson
//
//  Created by Алексей on 01.04.2025.
//

import UIKit
import SnapKit

final class NewCell: UITableViewCell {
    // MARK: – UI Elements
    private lazy var mainImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.tintColor = .white
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .lightGray
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .lightGray
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var stackViewText: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var stackViewDate: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [dateLabel, stackViewText])
        stackView.spacing = 0
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    private lazy var stackViewMain: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [mainImage, stackViewDate])
        stackView.spacing = 15
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    // MARK: – Cell ID
    static var id: String {
        String(describing: self)
    }
    
    // MARK: – Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        configureView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: – Configure View
    private func configureView() {
        contentView.backgroundColor = .filmsTable
    }
    
    // MARK: – Setup's
    private func setupUI() {
        contentView.addSubviews(stackViewMain)
        setupConstraints()
    }
    
    private func setupConstraints() {
        stackViewMain.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(14)
            make.bottom.equalToSuperview().inset(14)
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().inset(16)
        }
        
        mainImage.snp.makeConstraints { make in
            make.height.equalTo(160)
        }
    }
    
    // MARK: – Getter
    func getImage() -> UIImage?{
        return mainImage.image
    }
    
    func getMainImageView() -> UIImageView {
        return mainImage
    }

    func getTitle() -> String? {
        return titleLabel.text
    }

    func getDescription() -> String? {
        return descriptionLabel.text
    }

    func getDate() -> String? {
        return dateLabel.text
    }
    
    // MARK: – Set UI
    func set(_ titleL: String?, _ desc: String?, _ date: String?) {
        titleLabel.text = titleL
        descriptionLabel.text = desc
        dateLabel.text = date
    }
}
