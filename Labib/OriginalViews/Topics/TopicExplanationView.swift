//
//  TopicExplanationView.swift
//  Labib_ADA_project_1
//
//  Created by nouransalah on 10/04/1447 AH.
//

import SwiftUI

struct TopicExplanationView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var navigateToQuiz = false
    
    

    // MARK: - State for paging
    @State private var currentPage = 0
    
    // MARK: - Example descriptions
    private let descriptions = [
        
        //text1
        " عندما تكون في محادثة ويستجيب الطرف الآخر لكلمة قلتها بقول «أوووه»، فهذا يعني أنك أثرت اهتمامه وأمسكت شرارة الحديث.",
        //text 2
        "ابتسامتك هي افتتاحية المحادثة، فهي تكسر الجليد مع الناس وتجعلهم يفكرون: أوه، هذا الشخص ودّي ويريد التحدث معي.",
        //text3
        " سوف ترى أو تلاحظ الاشمئزاز عندما يحاول شخص ما أن يجد طريقة مهذّبة للكذب."
    ]
    
    //
    
    var body: some View {

        NavigationStack {
            
            // 🔸 NavigationLink مخفي ينتقل إلى QuizView
            NavigationLink(destination: QuizView(), isActive: $navigateToQuiz) {
                EmptyView()
            }.navigationBarBackButtonHidden(true)
            
            
            
            
            ZStack {
                //VSTACK CONATIN ALL SCREEN ELEMN I GIVE IT COLOR AND IGONRE SAFE SO ALL OF IT CAN BE SAFE
                //Background Color
                Color("ColorBackground").ignoresSafeArea()
                
                //
                VStack(spacing: 24) {
                    
                    //💠
                    VStack(spacing: 24) {
                        
                        // 1💠 nav + main title no space
                        VStack{
                            //1HEADER
                            //headerView
                            //2 MAIN TITLE
                            HStack(){
                                Spacer()
                                Text("العيون")
                                    .font(.system(size: 34, weight: .bold))
                                    .foregroundColor(Color.black)
                                
                            }//HSTACK FOR MAIN TITLE
                        }//1 v 💠 nav + main title no space
                        
                        // 2 💠 card+ description + paage indicator
                        VStack(spacing: 24){
                            //3 MAIN CARD
                            imageCard
                            
                            // 3💠 description + page indicator
                            VStack(spacing: 40) {
                                //4 SUB TEXT WITH SWIPE
                                TabView(selection: $currentPage) {
                                    ForEach(descriptions.indices, id: \.self) { index in
                                        descriptionSection(text: descriptions[index])
                                            .tag(index)
                                        //for move text to up
                                            .offset( y: -23)

                                    }
                                }
                                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // hide default dots
                                
                                //5 PAGEINDICATOR
                                pageIndicator
                            }// v space 40 3 💠 escription + paage indicator
                            
                            
                        }//v space 24 2💠 card+ description + paage indicator
                        
                        
                        
                    }//v24 between main titleand nav 1 + 2 card and description and page indicator
                    
                    Spacer()
                    //6BUTTON
                    CustomButtons.continueButton {navigateToQuiz = true }
                }//vstack
                // .frame(maxWidth:.infinity)
                //EVERY ELEmNT INSIDE HAVE PADDING 16
                .padding()
                
            }//Z for the screen
        }.navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(
                    action:{
                        presentationMode.wrappedValue.dismiss()
                    }
                ) {
                    Image(systemName: "chevron.left") // just the arrow
                        .foregroundColor(Color("ColorBrownCard")) // your custom color
                }
            }
            
        }
        //nav
    }//body

                        
             
//    // MARK: - Header
//    private var headerView: some View {
//        HStack {
//            Button(
//                action: {
//                // Handle back action
//            }
//                
//            )
//            {
//                //icon arrow donot forget to change color
//                Image(systemName: "chevron.backward")
//                    .foregroundColor(Color("textBrownDark"))
//                    .font(.title3)
//            }
//            Spacer()
//            
//            
//            Image(systemName: "chevron.backward")
//                .opacity(0) // Balancer
//        }//HStack
//    }//var headerView
//------------------------------------------------
    // MARK: - Image Card
    private var imageCard: some View {
        ZStack {
            
            //color of card
            RoundedRectangle(cornerRadius: 16)
                .fill(Color("ColorChooseButton"))
                .overlay(
                    RoundedRectangle(cornerRadius: 28)
                        .inset(by: 16)
                        .stroke(Color("ColorBrownCard"), lineWidth: 1)
                )
            
            VStack {
                //صوره المثلثات
                // Top decorative arrows
                Image("ImgCardDecorRed")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 20)
                
                Spacer()
                
                // Main image صوره الشخصيه وحجم الفريم
                Image("ImgFemaleOh")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 188)
                
                Spacer()
                
                //صوره المثلثات
                // Bottom decorative arrows
                Image("ImgCardDecorRed")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 20)
            }//VStack for card explination
            //        .padding(24) // ensures all images stay inside the red frame
            .padding(24)
        }//zstack
        
    }//method

//------------------------------------------------------
    // MARK: - Description (dynamic version)
    private func descriptionSection(text: String) -> some View {
        VStack(alignment: .trailing, spacing: 12) {
            
            Text("الشرح")
                .font(.system(size: 28, weight: .bold))
                .font(.headline)
                .foregroundColor(Color.black)
            
            Text(text)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(Color.black)
                .multilineTextAlignment(.trailing) // for Arabic, aligns right
                .fixedSize(horizontal: false, vertical: true) // makes it wrap
        }
       .frame(maxWidth: .infinity, alignment: .trailing)
    }//func descriptionSection

    // MARK: - Page Indicator
    private var pageIndicator: some View {
        HStack(spacing: 16) {
            
            ForEach(descriptions.indices,id:\.self)
            { index in Circle()
                    .fill(index == currentPage ? Color("ColorBrownCard") : Color("ColorBrownCard").opacity(0.4))
                    .frame(width: 8, height: 8)
            }//for each
        }//H
    }//var pageIndicator

    // MARK: - Continue Button it is in another file

}//struct TopicExplanationView

#Preview {
    TopicExplanationView()
}
