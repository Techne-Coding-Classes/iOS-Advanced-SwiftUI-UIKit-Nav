//
//  DataLayer.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created by Robert Barber on 3/14/25.
//

import Foundation

class DataLayer {
    
    let database: Database
    
    init(database: Database) {
        self.database = database
    }
    
}

// MARK: - Utils
extension DataLayer {
    
    func logout() {
        database.clearAllDBData()
    }
    
}
