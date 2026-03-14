//
//  MoodEntry+CoreDataProperties.swift
//  MindMateAIApp
//
//  Created by Kasidej jangkedtong on 22/04/2025.
//
//

import Foundation
import CoreData


extension MoodEntry {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MoodEntry> {
        return NSFetchRequest<MoodEntry>(entityName: "MoodEntry")
    }

    @NSManaged public var moodName: String?
    @NSManaged public var emoji: String?
    @NSManaged public var message: String?
    @NSManaged public var timestamp: Date?

}

extension MoodEntry : Identifiable {

}
