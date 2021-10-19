//
//  ContentView.swift
//  SwiftUI-Form
//
//  Created by Ethan on 19/10/2021.
//

import SwiftUI

struct ContentView: View {

    @State var username: String = ""
    @State var isPassphraseOn: Bool = true {
        didSet {
            print("Toggle: Private Account ON")
        }
    }
    @State var pushEnabled: Bool = false
    @State private var pickerIndex = 0
    var pushTypes = ["Badge", "Sound", "Silent"]

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("PROFILE")) {
                    TextField("Username", text: $username)
                    Toggle(isOn: $isPassphraseOn) {
                        Text("Requires Password")
                    }
                }
                
                Section(header: Text("LIVE UPDATES")) {
                    Toggle(isOn: $pushEnabled) {
                        Text("Push Notifications")
                    }
                    Picker(selection: $pickerIndex, label: Text("Show Previews")) {
                        ForEach(0 ..< pushTypes.count) {
                            Text(self.pushTypes[$0])
                        }
                    }
                }
                
                Section(header: Text("ABOUT")) {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("1.2.3")
                    }
                }
                
                Section {
                    Button(action: {
                        print("Reset All Settings Pressed")
                        isPassphraseOn = true
                        pushEnabled = false
                        pickerIndex = 0
                    }) {
                        Text("Reset All Settings")
                    }
                }
            }
            .navigationBarTitle("Settings")
        }
    }
}
 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
