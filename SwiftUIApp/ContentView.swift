//
//  ContentView.swift
//  SwiftUIApp
//
//  Created by DAO QUAN on 2022/01/27.
//

import SwiftUI

struct ContentView: View {
    @State private var presentView: Bool = false
    @State private var pushView: Bool = false
    @State private var message: String = "Hello, world!"
    var body: some View {
        NavigationView {
        Text(message)
            .padding()
            .navigationBarTitle("トップ画面", displayMode: .large)
            .navigationBarHidden(false)
            .onAppear {
                let appearance = UINavigationBarAppearance()
                appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
                appearance.backgroundColor = UIColor(Color.orange.opacity(0.8))
                // Inline appearance (standard height appearance)
                UINavigationBar.appearance().standardAppearance = appearance
                // Large Title appearance
                UINavigationBar.appearance().scrollEdgeAppearance = appearance
            }
            .navigationBarItems(
                leading:
                    Button(action: {
                        self.presentView = true
                    }) {
                        Text("Present")
                    }.sheet(isPresented: self.$presentView) {
                        Text("Present a view")
                    },
                trailing:
                    HStack {
                        Button(action: {
                            self.message = "Pushed trash button"
                        }) {
                            Image(systemName: "trash")
                        }
                        Button(action: {
                            self.pushView = true
                        }) {
                            Text("List")
                        }
                        NavigationLink(destination: SwiftUIListView(), isActive:$pushView) {
                        }
                    }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
