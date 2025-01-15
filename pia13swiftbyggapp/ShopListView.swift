//
//  ShopListView.swift
//  pia13swiftbyggapp
//
//  Created by BillU on 2025-01-15.
//

import SwiftUI
import SwiftData

struct ShopListView: View {
    
    @Environment(\.modelContext) private var modelContext
    //@Query private var shopitems: [ShopItem]
    @Query(filter: #Predicate<ShopItem> { shopitem in
        shopitem.store!.name == "IKEA"
    }) var shopitems: [ShopItem]
    
    @Binding var currentstore : StoreItem?
    
    var shopmodel : ShoppingModel
    
    @State var addshopName = ""
    @State var addshopAmount = ""

    var body: some View {
        
        VStack {
            
            HStack {
                TextField("Name", text: $addshopName)
                TextField("Amount", text: $addshopAmount)
                    .frame(width: 70)
                
                Button("Add") {
                    addShop()
                }
            }
            .padding(.horizontal)
            
            List {
                ForEach(shopitems) { shopitem in
                    ShopRowView(shopitem: shopitem)
                }
            }
        } // vstack
    } // body
    
    func addShop() {
        let addAmountNumber = Int(addshopAmount)
        
        if addAmountNumber == nil {
            // Visa fel
            return
        }
        if addshopName == "" {
            // Visa fel
            return
        }
        
        let newItem = ShopItem(name: addshopName, amount: addAmountNumber!)
        
        newItem.store = currentstore
        
        modelContext.insert(newItem)
        
        addshopName = ""
        addshopAmount = ""
    }
    
}

#Preview {
    ShopListView(currentstore: .constant(StoreItem(name: "TESTSTORE")), shopmodel: ShoppingModel())
        .modelContainer(for: [ShopItem.self, StoreItem.self], inMemory: true)
}
