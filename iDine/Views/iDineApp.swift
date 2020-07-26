//
//  iDineApp.swift
//  iDine
//
//  Created by Nick Nguyen on 7/25/20.
//

import SwiftUI

@main
struct iDineApp: App {
  var order = Order()
  
    var body: some Scene {
        WindowGroup {
          AppView().environmentObject(order)
        }
    }
}
