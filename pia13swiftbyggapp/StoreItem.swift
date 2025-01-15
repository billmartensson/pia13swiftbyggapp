//
//  StoreItem.swift
//  pia13swiftbyggapp
//
//  Created by BillU on 2025-01-15.
//

import Foundation
import SwiftData

@Model
final class StoreItem {
    var name: String

    init(name: String) {
        self.name = name
    }
}
