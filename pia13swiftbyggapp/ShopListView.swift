//
//  ShopListView.swift
//  pia13swiftbyggapp
//
//  Created by BillU on 2025-01-15.
//

import SwiftUI

struct ShopListView: View {
    
    /*
    @Query(filter: #Predicate<ShopItem> { shopitem in
        shopitem.store!.name == "IKEA"
    }) var shopitems: [ShopItem]
    */
        
    @Binding var shopmodel : ShoppingModel
    
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
                ForEach(shopmodel.shopitems) { shopitem in
                    ShopRowView(shopitem: shopitem, favItem: {
                        shopmodel.favoriteItem(item: shopitem)
                    }, delItem: {
                        shopmodel.deleteItem(item: shopitem)
                    }, addItem: {})
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
        
        shopmodel.addShop(shopname: addshopName, amount: addAmountNumber!)
        
        addshopName = ""
        addshopAmount = ""
    }
    
}

#Preview {
    ShopListView(shopmodel: .constant(ShoppingModel()))
}
