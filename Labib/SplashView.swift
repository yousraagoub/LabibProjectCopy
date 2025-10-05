//
//  SplashView.swift
//  Labib
//
//  Created by nouransalah on 06/04/1447 AH.
//
import SwiftUI
struct SplashView: View {
    //isActive tracks whether show Splash or Main/Choose Views.
    @State private var isActive = false
    //Saves the chosen character
    @AppStorage("selectedCharacter") private var selectedCharacter: String?
    //CLEAR CHACHE FROM CHARACTER....MUST BE DELETED LATER
    init() {
              UserDefaults.standard.removeObject(forKey: "selectedCharacter")
            }
    var body: some View {
        if isActive {
            if let choice = selectedCharacter {
                //Switches to different main views depending on the chosen character.
                switch choice {
                case "ImgChooseMale":
                    MaleMainView()
                case "ImgChooseFemale":
                    FemaleMainView()
                default:
                    //Fallback view, just in case.
                    IntroView()
                }
            } else {
                //Goes to Choose view for First-Time user.
                IntroView()
            }
        } else {
            ZStack {
                //Splash Backgrounds and Images
                Color("ColorBackground").ignoresSafeArea()
                ZStack {
                 
                    Image("ImgSplashHighCloud")
                        .resizable()
                        .frame(width: 350, height: 150)
                        .position(x: 150, y: 180)
                    
                    Image("ImgSplashSun")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .position(x: 330, y: 190)
                    
                    Image("ImgSplashLowCloud")
                        .resizable()
                        .frame(width: 200, height: 150)
                        .position(x: 300, y: 370)
                    
                    Image("ImgSplashLabib")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .position(x: 270, y: 390)
                    
                    Image("ImgSplashMaontain")
                        .resizable()
                        .frame(width: 430, height: 200)
                        .position(x: 200, y: 760)
                }//ZStack
            }//ZStack
            .onAppear {
                //Delay before switching to main screen
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }//ZStack
    }//body
}//struct


#Preview { SplashView() }

