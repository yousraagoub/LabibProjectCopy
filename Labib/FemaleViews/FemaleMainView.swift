//
//  MainPage.swift
//  ToCopy
//
//  Created by Yousra Abdelrahman on 10/04/1447 AH.
//
//
import SwiftUI
struct FemaleMainView: View {
    //🟩 total score
    @AppStorage("totalScore") var totalScore: Int = 0
    var body: some View {
        //NavigationStack to keep track of navigation history.
        NavigationStack {
            //ZStack for the background.
            ZStack  {
                Color("ColorBackground").ignoresSafeArea()
                //VStack for the TItle.
                //alignment: .trailing adjust the elements to the right.
                VStack (alignment: .trailing) {
                    Text("رحلتك مع موزة")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                    //HStack for the Lines.
                    HStack () {
                        //VStack for the Topics.
                        //alignment: .trailing adjust the elements to the right.
                        VStack(alignment: .trailing) {
                            Text("المواضيع")
                            Text("1")
                        }
                        Image("ImgScoreTopicsLines")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 10, height: 60)
                        //VStack for the Points.
                        //alignment: .trailing adjust the elements to the right.
                        VStack(alignment: .trailing) {
                            Text("نقاطك")
                            Text("\(totalScore)")
                        }
                        //.padding(.leading, 90) seperates between Points and Topics.
                        .padding(.leading, 110)
                        Image("ImgScoreTopicsLines") //editname
                            .resizable()
                            .scaledToFit()
                            .frame(width: 10, height: 60)
                    }
                    //ZStack for the Card and Card Frame.
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color("ColorRedCard"))
                            .frame(width: 350, height: 550)
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color("ColorBackground"), lineWidth: 2)
                            .frame(width: 300, height: 500)
                        //VStack for the Card Decor, Male Character, and Buttons.
                        VStack() {
                            Image("ImgCardDecor")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 250, height: 50)
                                .padding(.bottom, 20)
                            Image("ImgFemaleMain")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 250, height: 250)
                            
                            //Replaced Button with NavigationLink to navigate to the inteded page.
                            NavigationLink(destination: TopicsView()) {
                                Text("تعلم")
                                    .frame(width: 260, height: 40)
                                    .background(Color("ColorMainButton"))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.black)
                                    .cornerRadius(10)
                            }
                            
                            NavigationLink(destination: QuizView()) {
                                Text("تحدي نفسك")
                                    .frame(width: 260, height: 40)
                                    .background(Color("ColorMainButton"))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.black)
                                    .cornerRadius(10)
                            }
                           
                            
                            
                            Image("ImgCardDecor")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 250, height: 50)
                                .padding(.top, 20)
                        }
                        
                    }
                    
                    
                }
                
                
            }.navigationBarBackButtonHidden(true) // hides default back button
        }
        
        }
    }


#Preview {
    FemaleMainView()
}
