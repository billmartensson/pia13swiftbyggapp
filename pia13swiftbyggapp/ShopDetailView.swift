//
//  ShopDetailView.swift
//  pia13swiftbyggapp
//
//  Created by BillU on 2025-01-15.
//

import SwiftUI
import SwiftData

struct ShopDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var shopmodel : ShoppingModel
    
    var storeitem : StoreItem?
    
    @State var shopname = ""
    
    var body: some View {
        VStack {
            
            Button(action: {
                dismiss()
            }) {
                Image(systemName: "xmark")
            }

            Text("SHOP DETAIL")

            TextField("Shop Name", text: $shopname)
            
            Button("Save") {
                saveStore()
                dismiss()
            }
        }
        .onAppear() {
            if storeitem != nil {
                shopname = storeitem!.name
            }
        }
    }
    
    func saveStore() {
        
        shopmodel.saveStore(storename: shopname, storeitem: storeitem)
        
    }
}

#Preview {
    ShopDetailView(shopmodel: ShoppingModel())
}
