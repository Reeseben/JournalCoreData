//
//  Entry+Convenience.swift
//  JournalCoreData
//
//  Created by Ben Erekson on 7/26/21.
//

import CoreData

extension Entry {
    convenience init(title: String, bodyText: String, timeStamp: Date = Date(), context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.title = title
        self.bodyText = bodyText
        self.timeStamp = timeStamp
    }
}
