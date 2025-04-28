//
//  File.swift
//  FIlmJson
//
//  Created by Алексей on 05.04.2025.
//

import UIKit

protocol FilmsDelegateProtocol: AnyObject {
    func didSelect(_ image: UIImage?, _ date: String?, _ title: String?, _ description: String?)
}
