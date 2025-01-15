//
//  ShopRowView.swift
//  pia13swiftbyggapp
//
//  Created by BillU on 2025-01-15.
//

import SwiftUI

struct ShopRowView: View {
    
    var shopitem : ShopItem
    
    var body: some View {
        HStack {
            Text(shopitem.name)
            Spacer()
            Text("\(shopitem.amount)")
        }
    }
}

#Preview {
    ShopRowView(shopitem: ShopItem(name: "Test", amount: 123))
}
