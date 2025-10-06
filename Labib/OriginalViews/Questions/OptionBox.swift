
//
//  OptionBox.swift
//  Labib_ADA_project
//
//  Created by nouransalah on 13/04/1447 AH.
//

import SwiftUI

struct OptionBox: View {
    let title: String
    @ObservedObject var viewModel: QuizViewModel

    var body: some View {
        optionButton()
    }//body

    private func optionButton() -> some View {
        ZStack {
            Rectangle()
                .fill(boxColor())
                .frame(width: 142, height: 68)
                .cornerRadius(12)
                .onTapGesture {
                    viewModel.selectOption(title)
                }
            
            Text(title)
                .font(.custom("PlaypenSansArabic-Bold", size: 22))
                .foregroundColor(.white)
                .frame(width: 120)
                .multilineTextAlignment(.center)
        }
    }

    private func boxColor() -> Color {
        
        //class QuizViewModel inside it func i created called selectedOption
        guard let selected = viewModel.selectedOption else { return Color("ColorButtonAnswers") }
        
        
        if selected == viewModel.currentQuestion.correctAnswer {
            return title == viewModel.currentQuestion.correctAnswer ? Color("ColorButtonGreen") : Color("ColorButtonAnswers")
        } else {
            if title == selected {
                return Color("ColorButtonRed")
            } else if title == viewModel.currentQuestion.correctAnswer {
                return Color("ColorButtonGreen")
            } else {
                return Color("ColorButtonAnswers")
            }
        }
    }//func
}
