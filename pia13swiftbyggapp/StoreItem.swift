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
    @Relationship(deleteRule: .cascade, inverse: \ShopItem.store) var shopitems: [ShopItem] = []
    
    var name: String
    
    var posLat : Double?
    var posLng : Double?

    init(name: String) {
        self.name = name
    }
}
