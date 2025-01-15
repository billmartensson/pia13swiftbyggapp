//
//  ShopDetailView.swift
//  pia13swiftbyggapp
//
//  Created by BillU on 2025-01-15.
//

import SwiftUI

struct ShopDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        VStack {
            
            Button(action: {
                dismiss()
            }) {
                Image(systemName: "xmark")
            }

            Text("SHOP DETAIL")

        }
    }
}

#Preview {
    ShopDetailView()
}
