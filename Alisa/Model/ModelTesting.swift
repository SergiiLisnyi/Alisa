//
//  ModelTesting.swift
//  Alisa
//
//  Created by Sergii Lisnyi on 11/23/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation
import CoreData

struct ModelTesting {
    
    
    // MARK: - Internal Properties
    
    internal var tests: [TestEntity] = []
    internal var current: TestEntity? = nil
    
    // MARK: - Object Lifecycle
    
//    public init(testEntity: TestEntity) {
//        let array = Array<Int>.generateNumbers(repetitions: 1, maxValue: 1)
//
//        self.model = array.map{ (index) -> Test in
//            Test(id: index, question: levelEntity.questions[index], answer: levelEntity.answers[index], correctAnswer: levelEntity.correctAnswers[index])
//        }
//    }
    
    public init(level: LevelName) {
        let allTests = getTestsBy(level: level) ?? []
   
        let randomNumbers = Array<Int>.generateNumbers(repetitions: 4, maxValue: allTests.count)
        
        print(randomNumbers)
        
        self.tests = randomNumbers.map { (id) -> TestEntity in allTests[id] }
        
        
        //        let array = Array<Int>.generateNumbers(repetitions: 1, maxValue: 1)
        //
        //        self.model = array.map{ (index) -> Test in
        //            Test(id: index, question: levelEntity.questions[index], answer: levelEntity.answers[index], correctAnswer: levelEntity.correctAnswers[index])
        //        }
    }
    
    
    
    
    // MARK: - Public Properties

    
    /// Use a subscript to get the test at a given index.
    ///
    /// - parameter index: The index
    ///
    /// - returns: The `Test` for the `index`
    public subscript(index: Int) -> TestEntity {
        return tests[index]
    }
    
    /// Use this method to get all tests from the db.
    ///
    func getAllTests() -> [TestEntity]? {
        let context = CoreDataHelper.context
        let fetchRequest: NSFetchRequest<Test> = Test.fetchRequest()
        var testEntity: [TestEntity]?
        do {
            let results = try context.fetch(fetchRequest)
            testEntity = results.map { test in TestEntity(testCore: test)! }
        } catch {
            print(error.localizedDescription)
        }
        return testEntity
    }
    
    /// Use this method to get all tests from the db.
    ///
    func getTestsBy(level: LevelName) -> [TestEntity]? {
        let context = CoreDataHelper.context
        let fetchRequest: NSFetchRequest<Test> = Test.fetchRequest()
         fetchRequest.predicate = NSPredicate(format: "level <= %@", String(level.rawValue)) // OR ==
        var testEntity: [TestEntity]?
        do {
            let results = try context.fetch(fetchRequest)
            testEntity = results.map { test in TestEntity(testCore: test)! }
        } catch {
            print(error.localizedDescription)
        }
        return testEntity
    }
    
    
}


extension Array {
    static func generateNumbers(repetitions: Int, maxValue: Int) -> [Int] {
                guard maxValue >= repetitions else { return [] }
                var numbers: [Int] = []
        
                for _ in 1...repetitions { // 0..<
                    var n: Int
                    repeat {
                        n = Int.random(in: 0..<maxValue)
                    } while numbers.contains(n)
                    numbers.append(n)
                }
                return numbers
            }

}

