//
//  Facade.swift
//  test-SwiftUI-Observation
//
//  Created by Omata Masaki on 2025/03/11.
//

import Foundation
import Observation
import SwiftUI
import SwiftData

@Observable
final class Facade: AnyObject {
    var count:Int = 0
    
    func increment() {
        count += 1
    }
    
    func addItem(modelContext: ModelContext) {
        let newItem = Item(name: "hoge facade")
        modelContext.insert(newItem)
    }
}
