//
//  ContentView.swift
//  pia13swiftbyggapp
//
//  Created by BillU on 2025-01-13.
//

import SwiftUI
import SwiftData

struct ContentView: View {

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
                
                Text("AFFÄR X")
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
            
            ZStack {
                
                
                VStack {
                    if showList {
                        ShopListView()
                    } else {
                        ShopMapView()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                if showShopSelect {
                    VStack {
                        Button("Affär A") {
                            showShopdetail.toggle()
                        }
                        Button("Affär B") {
                            showShopdetail.toggle()
                        }
                    }
                    .frame(height: 100)
                    .frame(maxWidth: .infinity)
                    .background(Color.gray)
                }
            } // zstack
            
        } // vstack
        .fullScreenCover(isPresented: $showFav) {
            FavoriteView()
        }
        .fullScreenCover(isPresented: $showShopdetail) {
            ShopDetailView()
        }

        
    } // body

}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
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
