//
//  KeyChainError.swift
//  iOS Auth Handling
//
//  Created by Robert Barber on 12/3/23.
//

import Foundation

enum KeyChainError: Error {
    
    case saveFailed
    case retrieveFailed
    case deleteFailed
    
}
