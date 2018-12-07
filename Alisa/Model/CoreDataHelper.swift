//
//  CoreDataHelper.swift
//  Alisa
//
//  Created by Sergii Lisnyi on 11/22/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataHelper {
    
    static let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    static func getDataFromFile() {
        let fetchRequest: NSFetchRequest<Test> = Test.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "question != nil")
        
        var records = 0
        do {
            let count = try context.count(for: fetchRequest)
            records = count
        } catch {
            print(error.localizedDescription)
        }
        
        guard records == 0 else { print("records != 0"); return }
        let pathToFile = Bundle.main.path(forResource: "tests", ofType: "plist")
        let dataArray = NSArray(contentsOfFile: pathToFile!)!
        
        for dictionary in dataArray {
            let entity = NSEntityDescription.entity(forEntityName: "Test", in: context)
            let test = NSManagedObject(entity: entity!, insertInto: context) as! Test
            
            let testDictionary = dictionary as! NSDictionary
            test.question = testDictionary["question"] as? String
            test.answers = testDictionary["answers"] as? NSArray
            test.correctAnswer = testDictionary["correctAnswer"] as? NSNumber
            test.level = testDictionary["level"] as? NSNumber
            
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    static func deleteEntityFromDB(_ entity: EntityName) {
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: entity.description) //TO DO lowerCase
        let request = NSBatchDeleteRequest(fetchRequest: fetch)
        do {
            try context.execute(request)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    
    //    func saveLevels(name: String) {
    //
    //        let entity = NSEntityDescription.entity(forEntityName: "Level", in: context)
    //        let newLevel = NSManagedObject(entity: entity!, insertInto: context)
    //        newLevel.setValue(name, forKey: "name")
    //
    //        do {
    //            try context.save()
    //        } catch {
    //            print(error.localizedDescription)
    //        }
    //    }
    
    
    //    func getLevels() {
    //
    //        let fetchRequest: NSFetchRequest<Level> = Level.fetchRequest()
    //        do {
    //            levName = try context.fetch(fetchRequest)
    //        } catch {
    //            print(error.localizedDescription)
    //        }
    //    }
    
    

    
}

enum EntityName: String {
    case Result
    case Test
  
    var description: String {
        return self.rawValue
    }
}
