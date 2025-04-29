//
//  CoreDataManager.swift
//  FIlmJson
//
//  Created by Алексей on 02.04.2025.
//

import UIKit
import CoreData

public final class CoreDataManager {
    // MARK: – Singleton
    static let shared = CoreDataManager()
    private init() {}
    
    private let network = NetworkService()
    
    // MARK: – AppDelegate
    private var appDelegate: AppDelegate {
        UIApplication.shared.delegate as! AppDelegate
    }
    
    // MARK: – Context
    private var context: NSManagedObjectContext {
        appDelegate.persistentContainer.viewContext
    }
    
    // MARK: – Create Data
    func createData(from dtos: [NewsDTO]) {
        dtos.forEach { dto in
            let news = News(context: context)
            news.photo = dto.urlToImage
            news.date = dto.publishedAt
            news.titleNews = dto.title
            news.descriptions = dto.description
        }
        appDelegate.saveContext()
    }
    
    // MARK: – Read Data
    func fetchData() -> [News] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "News")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "date", ascending: true)]
        
        do {
            return try context.fetch(fetchRequest) as! [News]
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return []
    }
}
