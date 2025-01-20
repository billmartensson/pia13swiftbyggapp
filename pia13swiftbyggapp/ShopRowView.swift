//
//  ShopRowView.swift
//  pia13swiftbyggapp
//
//  Created by BillU on 2025-01-15.
//

import SwiftUI

struct ShopRowView: View {
    
    var shopitem : ShopItem
    
    var favItem : () -> Void
    var delItem : () -> Void
    var addItem : () -> Void
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                if shopitem.favorite == false {
                    Text("F")
                        .onTapGesture {
                            favItem()
                        }
                }
                
                Text("D")
                .onTapGesture {
                    delItem()
                }
                .padding(.trailing)
                
                if shopitem.favorite == true {
                    Text("ADD")
                        .onTapGesture {
                            addItem()
                        }
                        .padding(.trailing)
                }
                
            }
            HStack {
                Text(shopitem.name)
                
                if shopitem.store == nil {
                    Text("NO STORE")
                } else {
                    Text(shopitem.store!.name)
                }
                
                Spacer()
                
                if shopitem.favorite == false {
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
                }
                
                
                Spacer()
                Text("\(shopitem.amount)")
                
                
            }
        }
    }
}

#Preview {
    ShopRowView(shopitem: ShopItem(name: "Test", amount: 123), favItem: {}, delItem: {}, addItem: {})
}
