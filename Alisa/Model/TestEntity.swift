//
//  QuestionEntity.swift
//  Alisa
//
//  Created by Sergii Lisnyi on 11/15/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation
import CoreData

enum LevelName: Int, CaseIterable {
    case junior
    case middle
    case senior
    
    var description : String {
        get {
            switch(self) {
            case .junior:
                return "junior"
            case .middle:
                return "middle"
            case .senior:
                return "senior"
            }
        }
    }
}

struct TestEntity {
    let level: LevelName
    let question: String
    let answers: [String]
    let correctAnswer: Int
    
    // MARK: - Object Lifecycle
    
        init?(testCore: Test) {
            guard let level = testCore.level as? Int,
            let question = testCore.question,
            let answers = testCore.answers as? [String],
            let correctAnswer = testCore.correctAnswer,
            let levelName = LevelName(rawValue: level),
            let levelCorrectAnswer = correctAnswer as? Int
            else { return nil }
    
            self.level = levelName
            self.question = question
            self.answers = answers
            self.correctAnswer = levelCorrectAnswer
        }
    
    // MARK: - Public Properties
    
    /// Use this method to get the level from the db.
    ///
    /// - parameter levelName: The level name
//        static func getTest(_ levelName: LevelName) -> LevelEntity? {
//            let context = CoreDataHelper.context
//            let fetchRequest: NSFetchRequest<Test> = Test.fetchRequest()
//            fetchRequest.predicate = NSPredicate(format: "name == %@", levelName.description)
//            var levelEntity: LevelEntity?
//            do {
//                let results = try context.fetch(fetchRequest)
//                levelEntity = LevelEntity(levelCore: results[0]) //TO DO ??
//            } catch {
//                print(error.localizedDescription)
//            }
//            return levelEntity
//        }
    
    
//    /// Use this method to get all tests from the db.
//    ///
//    static func getAllTest() -> [TestEntity]? {
//        let context = CoreDataHelper.context
//        let fetchRequest: NSFetchRequest<Test> = Test.fetchRequest()
//        var testEntity: [TestEntity]?
//        do {
//            let results = try context.fetch(fetchRequest)
//            testEntity = results.map { test in TestEntity(testCore: test)!   }
//        } catch {
//            print(error.localizedDescription)
//        }
//        return testEntity
//    }

    
    /// Use this method to get the modelTesting from the level.
    ///
    /// - parameter levelName: The level name
    //    static func getModelTesting(_ levelName: LevelName) -> ModelTesting? {
    //        guard let level = getLevel(levelName) else { return nil }
    //        return ModelTesting(levelEntity: level)
    //    }
    //
    
    
    
    
}
