//
//  OrderView.swift
//  iDine
//
//  Created by Nick Nguyen on 7/26/20.
//

import SwiftUI

struct OrderView: View {
  
  @EnvironmentObject var order: Order
  
    var body: some View {
      NavigationView {
        List {
          Section {
            ForEach(order.items) { item in
              HStack {
                Text(item.name)
                Spacer()
                Text("$\(item.price)")
              }
            }
          }
          Section {
            NavigationLink(destination: CheckoutView()) {
              Text("Place Order")
            }
          }
        }
        .navigationBarTitle("Order")
        .listStyle(GroupedListStyle())
      }
    }
}

struct OrderView_Previews: PreviewProvider {
  
  static let order = Order()
  
    static var previews: some View {
      OrderView().environmentObject(order)
    }
}
