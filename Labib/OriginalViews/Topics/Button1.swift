//
//  Button1.swift
//  Labib_ADA_project
//
//  Created by nouransalah on 11/04/1447 AH.
//

import SwiftUI

// MARK: - Continue Button


struct CustomButtons {
    // A method that builds your button
    static func continueButton(action: @escaping () -> Void)
    -> some View
    {
        Button(action: action) {
            Text("تحدى")
                .font(.system(size: 24, weight: .regular))
                .foregroundColor(Color.black)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color("ColorChooseButton"))
                .cornerRadius(12)
        }//button
    }
}//struct CustomButtons

//action is a function (closure) that:

// action expects a method/function i give it. () -> Void this function/closure doesn’t expect any input and return void.

//   Normally, Swift expects a closure to run immediately inside the function.  But in SwiftUI (and buttons), the closure is stored and called later, when the user taps the button. @escaping tells Swift: “Hey, this closure will be used after the function ends, not right now, so it needs to escape the function’s scope.”
 
//   The function returns a SwiftUI view, specifically a Button.  some View is SwiftUI’s way of saying “I will return a view, but you don’t need to know the exact type”.
