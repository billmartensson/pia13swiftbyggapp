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
    var favitems : [ShopItem] = []

    var currentStore : StoreItem?
    
    /*
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    */
    
    func loadShopItems() {
        let currshopid = currentStore!.id
        do {
            let fetchDescriptor = FetchDescriptor<ShopItem>(predicate: #Predicate { sitem in
                //sitem.store!.id == currshopid
                sitem.favorite == false
            })
            
            shopitems = try modelContext!.fetch(fetchDescriptor)
        } catch {
            
        }
    }
    
    func loadFavorites() {
        do {
            let fetchDescriptor = FetchDescriptor<ShopItem>(predicate: #Predicate { sitem in
                sitem.favorite == true
            })
            
            favitems = try modelContext!.fetch(fetchDescriptor)
        } catch {
            
        }
    }
    
    func loadStoreItems() {
        do {
            let fetchDescriptor = FetchDescriptor<StoreItem>(sortBy: [SortDescriptor(\.name)])
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
        loadShopItems()
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

    func addShop(favitem : ShopItem) {
        let newShopitem = ShopItem(name: favitem.name, amount: favitem.amount)
        newShopitem.store = currentStore
        modelContext!.insert(newShopitem)
        loadShopItems()
    }
    
    func addShop(shopname : String, amount: Int) {
        let newShopitem = ShopItem(name: shopname, amount: amount)
        newShopitem.store = currentStore
        modelContext!.insert(newShopitem)
        loadShopItems()
    }

    func favoriteItem(item : ShopItem) {
        let newShopitem = ShopItem(name: item.name, amount: item.amount)
        newShopitem.favorite = true
        modelContext!.insert(newShopitem)
        loadShopItems()
    }
    
    func deleteItem(item : ShopItem) {
        modelContext!.delete(item)
        loadShopItems()
    }
    
    
    
}
