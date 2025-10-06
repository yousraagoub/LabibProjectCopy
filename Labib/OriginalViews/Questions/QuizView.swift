//
//  QuizView.swift
//  Labib_ADA_project
//  Created by nouransalah on 13/04/1447 AH.
//
//class ui

import SwiftUI

struct QuizView: View {

    @StateObject private var viewModel: QuizViewModel
    // @Environment(\.dismiss) private var dismiss
    @State private var navigateToTopics = false
    @State private var navigateToResult = false
    @State private var selectedCharacter = "moza"

    // initialize viewModel with the desired question set
    init(useSecondSet: Bool = false) {
        _viewModel = StateObject(wrappedValue: QuizViewModel(useSecondSet: useSecondSet))
    }

    var body: some View {
        NavigationStack {
            // hidden link to TopicsView
            NavigationLink(destination: TopicsView(), isActive: $navigateToTopics) {
                EmptyView()
            }.navigationBarBackButtonHidden(true)

            // when quiz ends, open ResultView and pass totalQuestions
            NavigationLink(destination: ResultView(score: viewModel.score, character: selectedCharacter, totalQuestions: viewModel.currentQuestions.count),
                           isActive: $navigateToResult) {
                EmptyView()
            }.navigationBarBackButtonHidden(true)

            //==========================================
            ZStack {
                //Background Color
                Color("ColorBackground").ignoresSafeArea()

                VStack {
                    // 1💠 nav + main title no space
                    VStack {
                        //1HEADER
                        // headerView
                        //2 MAIN TITLE
                        HStack {
                            Spacer()
                            Text("العيون")
                                .font(.custom("PlaypenSansArabic-Bold", size: 34))
                                //.font(.system(size: 34, weight: .bold))
                                .foregroundColor(Color.black)
                        } // HSTACK FOR MAIN TITLE
                    } // 1 v 💠 nav + main title no space

                    //===================================================================================
                    // Question card
                    VStack(spacing: 42) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color("ColorBrownCard"))
                                .frame(width: 360, height: 260)
                                .cornerRadius(12)

                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.white, lineWidth: 1.5)
                                .frame(width: 329, height: 227)
                                .cornerRadius(12)

                            Text(viewModel.currentQuestion.text)
                                .font(.custom("PlaypenSansArabic-Bold", size: 28))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .padding()
                        } // z

                        // Options
                        VStack(spacing: 10) {
                            ForEach(viewModel.currentQuestion.options.chunked(into: 2), id: \.self) { row in
                                HStack(spacing: 50) {
                                    ForEach(row, id: \.self) { option in
                                        OptionBox(title: option, viewModel: viewModel)
                                    }
                                }
                            }
                        } // v10
                    } // v 24

                    Spacer()

                    // ✅ Next Question / Result Button
                    Button(action: {
                        if viewModel.currentIndex < viewModel.currentQuestions.count - 1 {
                            viewModel.nextQuestion()
                        } else {
                            navigateToResult = true
                        }
                    }) {
                        HStack {
                            Spacer()
                            ZStack {
                                Circle()
                                    .fill(Color("ColorChooseButton"))
                                    .frame(width: 55, height: 55)
                                Triangle2()
                                    .fill(Color("ColorButtonRed"))
                                    .frame(width: 29, height: 30)
                                    .offset(x: 4)
                            }
                        }
                    }

                }
                .padding(.horizontal)
            }
        }.navigationBarBackButtonHidden(true) // nav
    }

} // body

// Helper for arranging options in two columns
extension Array {
    func chunked(into size: Int) -> [[Element]] {
        stride(from: 0, to: count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, count)])
        }
    }
}

//=================================================================================
#Preview {
    QuizView()
}
