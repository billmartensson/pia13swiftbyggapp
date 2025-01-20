//
//  FavoriteView.swift
//  pia13swiftbyggapp
//
//  Created by BillU on 2025-01-15.
//

import SwiftUI

struct FavoriteView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @Binding var shopmodel : ShoppingModel
    
    var body: some View {
        VStack {
            
            Button(action: {
                dismiss()
            }) {
                Image(systemName: "xmark")
            }

            Text("FAVORITE")

            
            List {
                ForEach(shopmodel.favitems) { shopitem in
                    ShopRowView(shopitem: shopitem, favItem: {}, delItem: {
                        shopmodel.deleteItem(item: shopitem)
                    }, addItem: {
                        shopmodel.addShop(favitem: shopitem)
                    })
                }
            }
            
        } // vstack
        .onAppear() {
            shopmodel.loadFavorites()
        }
    }
}

#Preview {
    FavoriteView(shopmodel: .constant(ShoppingModel()))
}
