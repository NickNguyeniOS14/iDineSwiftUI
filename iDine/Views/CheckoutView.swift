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
  @State private var tipAmount = 1
  @State private var showingPaymentAlert = false
  static let tipAmounts = [10,15,20,25,0]
  
  var totalPrice: Double {
    let total = Double(order.total)
    let tipValue = total / 100 * Double(Self.tipAmounts[tipAmount])
    return total + tipValue
  }
  
  static let paymentTypes = ["Cash","Credit Card","iDine Points"]
  var body: some View {
    Form {
      Section {
        Picker("How do you want to pay?",selection: $paymentType) {
          ForEach(0 ..< Self.paymentTypes.count) {
            Text(Self.paymentTypes[$0])
          }
        }
        Toggle(isOn: $addLoyalDetails.animation()) {
          Text("Add iDine loyalty card")
        }
        if addLoyalDetails {
          TextField("Enter your iDine ID",text:$loyaltyNumber)
        }
      }
      
      Section(header:Text("Add a tip?")) {
        Picker("Percentage:",selection: $tipAmount) {
          ForEach(0 ..< Self.tipAmounts.count) {
            Text("\(Self.tipAmounts[$0])%")
          }
        }
        .pickerStyle(SegmentedPickerStyle())
      }
      
      Section(header: Text("TOTAL: $\(totalPrice, specifier: "%.2f")")) {
        Button("Confirm order") {
          self.showingPaymentAlert.toggle()
        }
      }
      
    }
    .alert(isPresented: $showingPaymentAlert) {
      Alert(title: Text("Order confirmed"), message: Text("Your total was $\(totalPrice, specifier: "%.2f") - thank you!"), dismissButton: .default(Text("OK")))
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
