//
//  CheckoutView.swift
//  iDine
//
//  Created by Nick Nguyen on 7/26/20.
//

import SwiftUI

struct CheckoutView: View {
  @EnvironmentObject var order: Order
  @State private var paymentType = 0
  
  static let paymentTypes = ["Cash","Credit Card","iDine Points"]
  var body: some View {
    VStack {
      Section {
        Picker("How do you want to pay?",selection: $paymentType) {
          ForEach(Self.paymentTypes,id: \.self) {
            Text($0)
          }
        }
      }
    }
    .navigationBarTitle(Text("Payment"),displayMode: .inline)
  }
}

struct CheckoutView_Previews: PreviewProvider {
  static let order = Order()
  static var previews: some View {
    CheckoutView().environmentObject(order)
  }
}
