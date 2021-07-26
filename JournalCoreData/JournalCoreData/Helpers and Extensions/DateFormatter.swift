//
//  DatFormatter.swift
//  JournalCoreData
//
//  Created by Ben Erekson on 7/26/21.
//

import Foundation

extension Date {
    
    func dateAsString() -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .short
        
        return formatter.string(from: self)
    }
}
