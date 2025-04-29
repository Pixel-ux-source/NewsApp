//
//  Films+CoreDataProperties.swift
//  FIlmJson
//
//  Created by Алексей on 02.04.2025.
//
//

import Foundation
import CoreData

@objc(News)
public class News: NSManagedObject {}

extension News {
    @NSManaged public var photo: String?
    @NSManaged public var descriptions: String?
    @NSManaged public var titleNews: String?
    @NSManaged public var date: String?
}

extension News: Identifiable {}
