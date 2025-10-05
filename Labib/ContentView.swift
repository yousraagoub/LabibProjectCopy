//
//  ContentView.swift
//  Labib
//
//  Created by Yousra Abdelrahman on 09/04/1447 AH.
//
import SwiftUI
struct ContentView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
                Text("Hello, world!")
            }
            .padding()
            .navigationBarBackButtonHidden(true) // hides default back button
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(
                        action:{
                            presentationMode.wrappedValue.dismiss()
                        }
                    ) {
                        Image(systemName: "chevron.left") // just the arrow
                            .foregroundColor(Color("ColorRedCard")) // your custom color
                    }
                }
                
            }
            
        }
    }
}

#Preview {
    ContentView()
}
