//
//  Films+CoreDataProperties.swift
//  FIlmJson
//
//  Created by Алексей on 02.04.2025.
//
//

import Foundation
import CoreData
import ObjectMapper

@objc(News)
public class News: NSManagedObject {
    static var managedObjectContext: NSManagedObjectContext?
    
    required convenience public init?(map: Map) {
        guard let context = News.managedObjectContext else { return nil }
        guard let entity = NSEntityDescription.entity(forEntityName: "News", in: context) else { return nil }
        self.init(entity: entity, insertInto: context)
    }
}

extension News {
    @NSManaged public var photo: String
    @NSManaged public var descriptions: String?
    @NSManaged public var titleNews: String?
    @NSManaged public var date: String?
}

extension News: Identifiable {}

extension News: Mappable, NewsModelProtocol {
    
    static func urlAPI() -> String {
        "https://newsapi.org/v2/everything"
    }
    
    public func mapping(map: ObjectMapper.Map) {
        photo <- map["urlToImage"]
        descriptions <- map["description"]
        titleNews <- map["title"]
        date <- map["publishedAt"]
    }
    
}



