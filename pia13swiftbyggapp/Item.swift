//
//  Item.swift
//  pia13swiftbyggapp
//
//  Created by BillU on 2025-01-13.
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
