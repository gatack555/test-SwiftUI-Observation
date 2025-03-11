//
//  Item.swift
//  test-SwiftUI-Observation
//
//  Created by Omata Masaki on 2025/03/11.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
