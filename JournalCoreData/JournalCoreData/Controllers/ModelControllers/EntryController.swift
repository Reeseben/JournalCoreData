//
//  EntryController.swift
//  JournalCoreData
//
//  Created by Ben Erekson on 7/26/21.
//

import CoreData

class EntryController {
    static var shared = EntryController()
    
    ///Source of Truth
    var entries: [Entry] = []
    
   //MARK: - CRUD Functions
    
    func createEntry(title: String, body: String){
        let newEntry = Entry(title: title, bodyText: body)
        entries.append(newEntry)
        CoreDataStack.saveContext()
    }
    
    func fetchEntries(){
        let entries = (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
        self.entries = entries
    }
    
    func updateEntry(entry: Entry, title: String, body: String){
        entry.title = title
        entry.bodyText = body
        
        CoreDataStack.saveContext()
    }
    
    func deleteEntry(entry: Entry){
        CoreDataStack.context.delete(entry)
        
        CoreDataStack.saveContext()
    }
    
    
    //MARK: - CoreData
    private lazy var fetchRequest: NSFetchRequest<Entry> = {
     let request = NSFetchRequest<Entry>(entityName: "Entry")
     request.predicate = NSPredicate(value: true)
     return request
    }()
    
}
