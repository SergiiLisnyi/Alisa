//
//  Test+CoreDataProperties.swift
//  Alisa
//
//  Created by Sergii Lisnyi on 11/23/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//
//

import Foundation
import CoreData


extension Test {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Test> {
        return NSFetchRequest<Test>(entityName: "Test")
    }

    @NSManaged public var answers: NSObject?
    @NSManaged public var correctAnswer: NSNumber?
    @NSManaged public var level: NSNumber?
    @NSManaged public var question: String?

}
