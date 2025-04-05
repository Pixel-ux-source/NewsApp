//
//  TitleImage.swift
//  FIlmJson
//
//  Created by Алексей on 04.04.2025.
//

import UIKit

final class TitleImage: UIImageView {
    
    // MARK: – Life Cycle
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: – 
    private func setupConstraints() {
        contentMode = .scaleAspectFit
        
    }
}
