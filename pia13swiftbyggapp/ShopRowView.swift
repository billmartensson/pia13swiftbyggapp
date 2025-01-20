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
        VStack {
            HStack {
                Spacer()
                Button("F") {
                    var newShopItem = ShopItem(name: shopitem.name, amount: shopitem.amount)
                    newShopItem.favorite = true
                    shopitem.modelContext?.insert(newShopItem)
                    
                }
                Button("E") {
                    
                }
                Button("D") {
                    
                }
                .padding(.trailing)
            }
            HStack {
                Text(shopitem.name)
                
                if shopitem.store == nil {
                    Text("NO STORE")
                } else {
                    Text(shopitem.store!.name)
                }
                
                Spacer()
                
                VStack {
                    if shopitem.done {
                        Text("[X]")
                    } else {
                        Text("[ ]")
                    }
                }
                .onTapGesture {
                    shopitem.done.toggle()
                }
                
                Spacer()
                Text("\(shopitem.amount)")
                
                
            }
        }
    }
}

#Preview {
    ShopRowView(shopitem: ShopItem(name: "Test", amount: 123))
}
