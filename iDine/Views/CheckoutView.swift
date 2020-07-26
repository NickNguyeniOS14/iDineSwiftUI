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
  @State private var addLoyalDetails = false
  @State private var loyaltyNumber = ""
  
  
  static let paymentTypes = ["Cash","Credit Card","iDine Points"]
  var body: some View {
    Form {
      Section {
        Picker("How do you want to pay?",selection: $paymentType) {
          ForEach(0 ..< Self.paymentTypes.count) {
            Text(Self.paymentTypes[$0])
          }
        }
        Toggle(isOn: $addLoyalDetails) {
          Text("Add iDine loyalty card")
        }
        if addLoyalDetails {
          TextField("Enter your iDine ID",text:$loyaltyNumber)
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
