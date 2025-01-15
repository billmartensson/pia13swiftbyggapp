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
    @Environment(\.modelContext) private var modelContext
    
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
            }
        }
        .onAppear() {
            if storeitem != nil {
                shopname = storeitem!.name
            }
        }
    }
    
    func saveStore() {
        if storeitem == nil {
            // Ny
            var newStore = StoreItem(name: shopname)
            modelContext.insert(newStore)
        } else {
            // Edit
            storeitem?.name = shopname
            modelContext.insert(storeitem!)
        }
    }
}

#Preview {
    ShopDetailView()
}
