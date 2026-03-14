//
//  func.swift
//  MindMateAIApp
//
//  Created by Kasidej jangkedtong on 22/04/2025.
//


import Foundation
import CoreData

extension JournalEntry: Identifiable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<JournalEntry> {
        return NSFetchRequest<JournalEntry>(entityName: "JournalEntry")
    }

    @NSManaged public var text: String?
    @NSManaged public var timestamp: Date?
}
