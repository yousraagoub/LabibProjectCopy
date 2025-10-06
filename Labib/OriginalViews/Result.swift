//
//  Result.swift
//  Labib_ADA_project
//  Created by nouransalah on 13/04/1447 AH.
//

import SwiftUI

struct ResultView: View {
    var score: Int = 0
    var character: String = "moza"
    var totalQuestions: Int = 3

    @State private var navigateToQuiz = false
    @State private var useSecondSet = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()

                VStack(spacing: 30) {
                    Spacer()

                    // MARK: - Result Card
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color("ColorChooseButton"))
                            .frame(width: 376, height: 310)
                            .shadow(radius: 10)

                        Image("red") //What is this for ⁉️
                            .resizable()
                            .scaledToFit()
                            .frame(width: 350, height: 280)

                        VStack(spacing: 8) {
                            Spacer(minLength: 10)

                            Image("ImgCardDecor")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 310, height: 25)

                            Text("\(score)/\(totalQuestions)")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.black)

                            Image(characterImage)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 130, height: 130)
                                .padding(.vertical, 2)

                            Text(messageText)
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(messageColor)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 10)

                            Image("ImgCardDecor")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 310, height: 25)

                            Spacer(minLength: 10)
                        }
                    }

                    // MARK: - Buttons
                    VStack(spacing: 16) {
                        // ✅ Primary Button (Retry / Next Challenge)
                        Button(action: {
                            // ✅ If user passed, move to the next challenge (second set)
                            if score >= passThreshold {
                                useSecondSet = true
                            } else {
                                // ❌ If user failed, retry the same first set
                                useSecondSet = false
                            }
                            
                            // 🔍 Debug print to verify which set will be loaded
                               print("useSecondSet before navigate:", useSecondSet)
                            
                            // trigger navigation after updating the flag
                            navigateToQuiz = true
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color("ColorButtonRed"))
                                    .frame(width: 230, height: 55)
                                Text(primaryButtonText)
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.white)
                            }
                        }

                        // ✅ Hidden navigation to QuizView (destination built lazily so it reads useSecondSet at navigation time)
                       
                        
                        //////////88888888888888888
                        NavigationLink(isActive: $navigateToQuiz) {
                            QuizView(useSecondSet: useSecondSet)
                                .id(useSecondSet)
                        } label: {
                            EmptyView()
                        }
                        
                        

                        // ✅ Secondary Button (Home)
                        NavigationLink(destination: FemaleMainView()) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color("ColorChooseButton"))
                                    .frame(width: 230, height: 55)
                                Text("الصفحة الرئيسية")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(Color("ColorButtonRed"))
                            }
                        }.navigationBarBackButtonHidden(true)
                    }

                    Spacer()
                }
            }
        }
    }

    // dynamic pass threshold (e.g. for 3-question sets this becomes 2)
    private var passThreshold: Int {
        max(1, Int(ceil(Double(totalQuestions) * 0.66)))
    }

    private var characterImage: String {
        if score < passThreshold {
            return character == "moza" ? "ImgFemaleSad" : "ImgMaleSad"
        } else {
            return character == "moza" ? "ImgFemaleHappy" : "ImgMaleHappy"
        }
    }

    private var messageText: String {
        if score >= passThreshold {
            return character == "moza" ? "جبتيها صح كفو !" : "جبتها صح كفو !"
        } else {
            return character == "moza" ? "شدي حيلك وجربي مره ثانيه" : "شد حيلك وجرب مره ثانيه"
        }
    }

    private var messageColor: Color {
        score >= passThreshold ? Color("ColorButtonGreen") : Color("ColorButtonRed")
    }

    private var primaryButtonText: String {
        score >= passThreshold ? "التحدي اللي عقبه" : "حاول من جديد"
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ResultView(score: 2, character: "moza", totalQuestions: 3)
            ResultView(score: 1, character: "moza", totalQuestions: 3)
        }
        .padding()
        .background(Color.black)
    }
}
