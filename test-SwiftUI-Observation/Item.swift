//
//  Item.swift
//  test-SwiftUI-Observation
//
//  Created by Omata Masaki on 2025/03/11.
//

import Foundation
import SwiftData

@Model
final class Item: Identifiable {
    var id: UUID = UUID()
    var name: String
    var timestamp = Date()
    
    init(name:String) {
        self.name = name
    }
}
