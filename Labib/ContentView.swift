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
            ZStack {
                Color.gray.ignoresSafeArea().opacity(0.5)
                VStack {
                    Text("قريباً...")
                        .font(.largeTitle)
                        .foregroundStyle(.black)
                    
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
                                .foregroundColor(Color.black) // your custom color
                        }
                    }
                    
                }
            }
            
            
        }
    }
}

#Preview {
    ContentView()
}
