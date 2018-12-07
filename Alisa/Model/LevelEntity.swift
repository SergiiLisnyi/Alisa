//
//  JuniorLevel.swift
//  Alisa
//
//  Created by Sergii Lisnyi on 11/15/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation
import CoreData




class LevelEntity {
    
    var levelName: LevelName?
    var questions: [String]?
    var answers: [[String]]?
    var correctAnswers: [Int]?
    
    
    // MARK: - Object Lifecycle
    
//    init?(levelCore: Level) {
//        guard let name = levelCore.name,
//        let questions = levelCore.questions,
//        let answers = levelCore.answers,
//        let correctAnswers = levelCore.correctAnswers,
//        let levelName = LevelName(rawValue: name),
//        let levelQuestion = questions as? [String],
//        let levelAnswer = answers as? [[String]],
//        let levelCorrectAnswers = correctAnswers as? [Int]
//        else { return nil }
//        
//        self.levelName = levelName
//        self.questions = levelQuestion
//        self.answers = levelAnswer
//        self.correctAnswers = levelCorrectAnswers
//    }
    
    // MARK: - Public Properties
    
    /// Get the number of questions in the level
//    public var count: Int {
//        return questions.count
//    }
    
    /// Use a subscript to get the question at a given index.
    ///
    /// - parameter index: The index
    ///
    /// - returns: The `Question` for the `index`
//    public subscript(index: Int) -> Test {
//        return Test(id: index, question: questions[index], answer: answers[index], correctAnswer: correctAnswers[index])
//    }
    
    
    /// Use this method to get the level from the db.
    ///
    /// - parameter levelName: The level name
//    static func getLevel(_ levelName: LevelName) -> LevelEntity? {
//        let context = CoreDataHelper.context
//        let fetchRequest: NSFetchRequest<Level> = Level.fetchRequest()
//        fetchRequest.predicate = NSPredicate(format: "name == %@", levelName.description)
//        var levelEntity: LevelEntity?
//        do {
//            let results = try context.fetch(fetchRequest)
//            levelEntity = LevelEntity(levelCore: results[0]) //TO DO ??
//        } catch {
//            print(error.localizedDescription)
//        }
//        return levelEntity
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

