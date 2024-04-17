//
//  BluetoothView.swift
//  Weight-It
//
//  Created by Roman Meshkov on 4/17/24.
//

import Foundation

import SwiftUI

struct BluetoothView: View {
    @ObservedObject private var bluetoothViewModel = BluetoothViewModel()

    var body: some View {
        NavigationView {
            List(bluetoothViewModel.peripheralNames, id: \.self) { peripheral in
                Text(peripheral)
            }
            .navigationTitle("Peripherals")
        }
    }
}

struct CBluetoothView_Previews: PreviewProvider {
    static var previews: some View {
        BluetoothView()
    }
}
