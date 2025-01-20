//
//  ContentView.swift
//  pia13swiftbyggapp
//
//  Created by BillU on 2025-01-13.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    @Environment(\.modelContext) private var modelContext
        
    @State var shopmodel = ShoppingModel()
    
    @State var showList = true
    @State var showFav = false
    @State var showShopdetail = false

    @State var showShopSelect = false
    
    var body: some View {
        VStack {
            
            HStack {
                Button(showList ? "MAP" : "LIST") {
                    showList.toggle()
                }
                .padding(.leading)
                
                Spacer()
                
                if shopmodel.currentStore != nil {
                    Text(shopmodel.currentStore!.name)
                }
                
                Button("O") {
                    showShopSelect.toggle()
                }
                
                
                Spacer()
                
                Button("FAV") {
                    showFav.toggle()
                }
                .padding(.trailing)
                
            }
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(Color.yellow)
            
            ZStack(alignment: .top) {
                VStack {
                    if showList {
                        ShopListView(shopmodel: $shopmodel)
                    } else {
                        ShopMapView()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                if showShopSelect && showList {
                    VStack {
                        
                        HStack {
                            Spacer()
                            Button("+") {
                                showShopdetail.toggle()
                            }
                        }
                        .padding(.trailing)
                        
                        List {
                            ForEach(shopmodel.storeitems) { storeitem in
                                Text(storeitem.name)
                                    .onTapGesture {
                                        shopmodel.selectStore(store: storeitem)
                                        
                                        showShopSelect = false
                                    }
                            }
                        }
                        .listStyle(.plain)
                    }
                    .frame(height: 200)
                    .frame(maxWidth: .infinity)
                    .background(Color.cyan)
                }
                
                
            } // zstack
            
        } // vstack
        .onAppear() {
            shopmodel.modelContext = modelContext
            shopmodel.loadStoreItems()
            shopmodel.loadShopItems()
        }
        .fullScreenCover(isPresented: $showFav) {
            FavoriteView(shopmodel: $shopmodel)
        }
        .fullScreenCover(isPresented: $showShopdetail) {
            ShopDetailView(shopmodel: $shopmodel)
        }

        
    } // body

}

#Preview {
    ContentView()
        .modelContainer(for: [ShopItem.self, StoreItem.self], inMemory: true)
}




/*


 struct ContentView: View {
     @Environment(\.modelContext) private var modelContext
     @Query private var items: [Item]

     var body: some View {
         NavigationSplitView {
             List {
                 ForEach(items) { item in
                     NavigationLink {
                         Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                     } label: {
                         Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                     }
                 }
                 .onDelete(perform: deleteItems)
             }
             .toolbar {
                 ToolbarItem(placement: .navigationBarTrailing) {
                     EditButton()
                 }
                 ToolbarItem {
                     Button(action: addItem) {
                         Label("Add Item", systemImage: "plus")
                     }
                 }
             }
         } detail: {
             Text("Select an item")
         }
     }

     private func addItem() {
         withAnimation {
             let newItem = Item(timestamp: Date())
             modelContext.insert(newItem)
         }
     }

     private func deleteItems(offsets: IndexSet) {
         withAnimation {
             for index in offsets {
                 modelContext.delete(items[index])
             }
         }
     }
 }



*/
