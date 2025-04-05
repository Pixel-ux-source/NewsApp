//
//  CoreDataManager.swift
//  FIlmJson
//
//  Created by Алексей on 02.04.2025.
//

import UIKit
import CoreData

public final class CoreDataManager {
    // MARK: – Single Tone
    static let shared = CoreDataManager()
    private init() {}
    
    // MARK: – AppDelegate
    private var appDelegate: AppDelegate {
        UIApplication.shared.delegate as! AppDelegate
    }
    
    // MARK: – Context
    private var context: NSManagedObjectContext {
        appDelegate.persistentContainer.viewContext
    }
    
    // MARK: – Create Data
    func createData(title: String, descriptions: String, image: String, date: String) {
        guard let userEntityDescription = NSEntityDescription.entity(forEntityName: "News", in: context) else { return }
        let news = News(entity: userEntityDescription, insertInto: context)
        news.titleNews = title
        news.descriptions = descriptions
        news.photo = image
        news.date = date
        appDelegate.saveContext()
    }
    
    // MARK: – FetchData
    func fetchData() -> [News] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "News")
        do {
            return try context.fetch(fetchRequest) as! [News]
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return []
    }
}
