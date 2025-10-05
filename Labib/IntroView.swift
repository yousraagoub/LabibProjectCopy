//
//  IntroView.swift
//  Labib
//
//  Created by Yousra Abdelrahman on 13/04/1447 AH.
//
import SwiftUI

struct IntroView: View {
    let cards: [(text: String, color: String, img: String)] = [
        ("إن اللبيب \n بالإشارة  يفهم", "ColorRedCard", "ImgIntroCard"),
        ("ولأننا نبغاك تصير لبيب هذا العصر، سوينا لبيب عشان يساعدك", "ColorBrownCard", "ImgFemaleCard"),
        ("لبيب  بيعلمك عن لغة الجسد وكمان  بيخليك تختبر مهاراتك وتطورها", "ColorOrangeCard", "ImgMaleCard")
        ]
    @State private var currentIndex = 0
    @State private var dragOffset: CGFloat = 0

    var body: some View {
        NavigationStack {
            ZStack {
                //Background Color
                Color("ColorBackground").ignoresSafeArea()
                VStack(){
                    NavigationLink(destination: ChooseView()) {
                        Image(systemName: "chevron.right") // just the arrow
                            .foregroundColor(Color("ColorBrownCard")) // your custom color
                        
                    } .padding(.leading, 350).padding(.top, 20)
                    Spacer()
                    ZStack {
                        ForEach(0..<cards.count, id: \.self) { index in
                            let isActive = index == currentIndex
                        
                            CardView(text: cards[index].text, colorName: cards[index].color, img: cards[index].img)
                            
                                .scaleEffect(isActive ? 1.0 : 0.9) // smaller if in background
                                .rotationEffect(.degrees(rotation(for: index)))
                                .offset(x: offset(for: index) + dragOffset)
                                .zIndex(isActive ? 1 : 0)
                                .animation(.spring(), value: currentIndex)
                        }
                    }
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                dragOffset = value.translation.width
                            }
                            .onEnded { value in
                                let threshold: CGFloat = 100
                                if value.translation.width < -threshold {
                                    currentIndex = min(currentIndex + 1, cards.count - 1)
                                } else if value.translation.width > threshold {
                                currentIndex = max(currentIndex - 1, 0)
                                }
                                withAnimation(.spring()) {
                                    dragOffset = 0
                                }
                            }
                    )
                    .frame(height: 250)
                    .padding(.horizontal, 24)
                    Spacer()
                    // Page indicator
                    HStack(spacing: 8) {
                        ForEach(0..<cards.count, id: \.self) { index in
                            Circle()
                                .fill(index == currentIndex ? Color("ColorBrownCard") : Color("ColorBrownCard").opacity(0.4))
                                .frame(width: 10, height: 10)
                        }
                    }
                }
            }
        }//NavigationStack End...
        
    }

    
    // Helper: tilt cards depending on position
    private func rotation(for index: Int) -> Double {
        if index == currentIndex { return 0 }
        if index < currentIndex { return -8 } // left tilt
        return 8 // right tilt
    }

    // Helper: slight side offset for stacked feel
    private func offset(for index: Int) -> CGFloat {
        if index == currentIndex { return 0 }
        if index < currentIndex { return -40 } // shift left
        return 40 // shift right
    }


}//struct IntroView End...

//The Cards and its' images
struct CardView: View {
    let text: String
    let colorName: String
    let img: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(colorName))
                .frame(width: 350, height: 550)
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color("ColorBackground"))
                .frame(width: 300, height: 500)
            VStack(){
                Image("ImgCardDecor")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 50)
                    .padding(.top, 30)
                Image(img)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                    .position(x: 180, y: 110)
                Text(text)
                    .font(.custom("PlaypenSansArabic-Bold", size: 29))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                Image("ImgCardDecor")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 50)
                    .padding([.top, .bottom], 30)
            }
                
            
           
        }
        .frame(height: 550)
    }
}

#Preview {
IntroView()
}
