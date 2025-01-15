//
//  ShopItem.swift
//  pia13swiftbyggapp
//
//  Created by BillU on 2025-01-15.
//

import Foundation
import SwiftData

@Model
final class ShopItem {
    var name: String
    var amount: Int
    var done: Bool = false

    init(name: String, amount : Int) {
        self.name = name
        self.amount = amount
    }
}
