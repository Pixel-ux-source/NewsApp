//
//  FilmCell.swift
//  FIlmJson
//
//  Created by Алексей on 01.04.2025.
//

import UIKit
import SnapKit

final class FilmCell: UITableViewCell {
    // MARK: – UI Elements
    private lazy var mainImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Image")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 1
        label.text = "Заголовок"
        return label
    }()
    
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .lightGray
        label.numberOfLines = 0
        label.text = "Сообщение Сообщение Сообщение Сообщение Сообщение Сообщение Сообщение Сообщение Сообщение СообщениеСообщение"
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .lightGray
        label.text = "01.02.2021 / 12:00:00"
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var stackViewText: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, messageLabel])
        stackView.spacing = 8
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    private lazy var stackViewDate: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [dateLabel, stackViewText])
        stackView.spacing = 4
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    private lazy var stackViewMain: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [mainImage, stackViewDate])
        stackView.spacing = 15
        stackView.axis = .horizontal
        stackView.alignment = .center
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
        mainImage.snp.makeConstraints { make in
            make.width.equalTo(160)
        }
        
        stackViewMain.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(14)
            make.bottom.equalToSuperview().inset(14)
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().inset(16)
        }
    }
    
}
