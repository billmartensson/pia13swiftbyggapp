//
//  ShoppingModel.swift
//  pia13swiftbyggapp
//
//  Created by BillU on 2025-01-15.
//

import Foundation
import SwiftData

@Observable class ShoppingModel {
    
    var modelContext : ModelContext?
    
    var storeitems : [StoreItem] = []
    var shopitems : [ShopItem] = []
    
    var currentStore : StoreItem?
    
    /*
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    */
    
    func loadShopItems() {
        do {
            let fetchDescriptor = FetchDescriptor<ShopItem>(predicate: #Predicate { sitem in
                sitem.store!.id == currentStore!.id
            })
            
            shopitems = try modelContext!.fetch(fetchDescriptor)
        } catch {
            
        }
    }
    
    func loadStoreItems() {
        do {
            let fetchDescriptor = FetchDescriptor<StoreItem>()
            var savedstores = try modelContext!.fetch(fetchDescriptor)
            
            if savedstores.count == 0 {
                var newStore = StoreItem(name: "Standard store")
                modelContext!.insert(newStore)
                currentStore = newStore
                storeitems = try modelContext!.fetch(fetchDescriptor)

            } else {
                storeitems = savedstores
                currentStore = savedstores.first
            }
            
        } catch {
            
        }
        
    }
    
    func selectStore(store : StoreItem) {
        currentStore = store
        loadStoreItems()
    }
    
    func saveStore(storename : String, storeitem : StoreItem?) {
        if storeitem == nil {
            // Ny
            let newStore = StoreItem(name: storename)
            modelContext!.insert(newStore)
        } else {
            // Edit
            storeitem!.name = storename
            modelContext!.insert(storeitem!)
        }
        loadStoreItems()

    }

    func addShop(shopname : String, amount: Int) {
        let newShopitem = ShopItem(name: shopname, amount: amount)
        newShopitem.store = currentStore
        modelContext!.insert(newShopitem)
        loadShopItems()
    }
    
    func favoriteItem(item : StoreItem) {
        
    }
    
    func deleteItem(item : StoreItem) {
        
    }
    
    
    
}
