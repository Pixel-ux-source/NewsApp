//
//  AppDelegate.swift
//  FIlmJson
//
//  Created by Алексей on 01.04.2025.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        return true
    }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "NewsDataModel")
        container.loadPersistentStores { desc, error in
            if let error {
                print(error.localizedDescription)
            } else {
                print("DB url -->", desc.url ?? "empty")
            }
        }
        return container
    }()
    
    func saveContext() {
        let context = persistentContainer.viewContext
        guard context.hasChanges else { return }
        do {
            try context.save()
            print("✅ Данные успешно сохранены в Core Data")
        } catch let error as NSError {
            print("❌ Ошибка сохранения в Core Data: \(error.localizedDescription)")
        }
    }

}

