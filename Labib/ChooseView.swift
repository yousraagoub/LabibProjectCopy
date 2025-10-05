//
//  ChooseView.swift
//  Labib_ADA_project
//
//  Created by Maram on 09/04/1447 AH.
//
//  Choose.swift
//  characters
//
//  Created by Maram on 05/04/1447 AH.
//
import SwiftUI
struct ChooseView: View {
    //Store selected character permenantly here.
    @AppStorage("selectedCharacter") private var selectedCharacter: String = ""
    //Store selected character temporarly here on tab.
    @State private var tempSelection: String = ""
    //To trigger navigation
    @State private var goToMain = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationStack {
          ZStack{
            //Background Color
            Color("ColorBackground").ignoresSafeArea()
            VStack {
                Text("اختار شخصيتك")
                    .font(.custom("PlaypenSansArabic-Bold", size: 34))
                    .foregroundColor(Color(.black))
                    .padding(60)
                HStack(spacing: 40) {
                          ZStack {
                              //Male Orange Cards.
                              RoundedRectangle(cornerRadius: 20)
                                  .fill(tempSelection == "ImgChooseMale" ? Color("ColorRedCard") : Color("ColorOrangeCard"))
                                  .frame(width: 170, height: 270)
                                  .onTapGesture { tempSelection = "ImgChooseMale" }
                              //Card Stroke
                              RoundedRectangle(cornerRadius: 20)
                                  .stroke(Color("ColorBackground"), lineWidth: 2)
                                  .frame(width: 150, height: 250)
                              //Male Image
                              Image("ImgChooseMale")
                                  .resizable()
                                  .scaledToFit()
                                  .frame(width: 150, height: 150)
                          }
                          
                          ZStack {
                              //Female Orange Cards.
                              RoundedRectangle(cornerRadius: 20)
                                  .fill(tempSelection == "ImgChooseFemale" ? Color("ColorRedCard"): Color("ColorOrangeCard"))
                                  .frame(width: 170, height: 270)
                                  .onTapGesture { tempSelection = "ImgChooseFemale" }
                              //Card Stroke
                              RoundedRectangle(cornerRadius: 20)
                                  .stroke(Color("ColorBackground"), lineWidth: 2)
                                  .frame(width: 150, height: 250)
                              
                              //Female Image
                              Image("ImgChooseFemale")
                                  .resizable()
                                  .scaledToFit()
                                  .frame(width: 150, height: 150)
                          }
                      }
                     //Characters' Names
                      HStack(spacing: 120) {
                          Text("مفلح")
                              .font(.custom("PlaypenSansArabic-Bold", size: 22))
                              .padding(.trailing, 30)
                          
                          Text("موزه")
                              .font(.custom("PlaypenSansArabic-Bold", size: 22))
                      }
                     
                      Spacer()
                      //Button
                      if tempSelection != ""{
                          Button(action: {
                              //Stores temporarly selected character permenantly
                              selectedCharacter = tempSelection
                              //Trigger navigation
                              goToMain = true
                          }) {
                              Text("كمل")
                                  .font(.custom("PlaypenSansArabic-regular", size: 24))
                                  .foregroundColor(Color.black)
                                  .frame(width: 199, height: 56)
                                  .background(Color("ColorChooseButton"))
                                  .cornerRadius(12)
                          }

                      }
                      
                      //Real navigation link (hidden but active when goToMain = true)
                    NavigationLink(
                        destination: Group {
                            if selectedCharacter == "ImgChooseMale" {
                                MaleMainView()
                            } else {
                                FemaleMainView()
                            }
                        },
                        isActive: $goToMain
                        ) {
                        }
                      
                }//VStack.padding()
                .navigationBarBackButtonHidden(true) // hides default back button
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
            }//ZStack
        }//NavigationStack
        
    }//body
}//stuct

#Preview {
    ChooseView()
}

