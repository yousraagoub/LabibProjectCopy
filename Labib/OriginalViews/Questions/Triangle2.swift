
//
//  Triangle2.swift
//  Labib_ADA_project
//
//  Created by nouransalah on 13/04/1447 AH.
//
//

//part 1
import SwiftUI

struct Triangle2: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.closeSubpath()
        return path
    }
}

//import SwiftUI
//
//struct Triangle2: Shape {
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
//        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
//        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
//        path.closeSubpath()
//        return path
//    }
//}
//
//struct Triangle2_Previews: PreviewProvider {
//    static var previews: some View {
//        Triangle2()
//            .fill(Color.red)
//            .frame(width: 50, height: 50)
//    }
//}
