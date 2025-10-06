//
//  QuizViewModel.swift
//  Labib_ADA_project
//  Created by nouransalah on 13/04/1447 AH.
//

import SwiftUI

// ObservableObject any update on eny value this class will be affected
class QuizViewModel: ObservableObject {
    //🟩 total score
    @AppStorage("totalScore") var totalScore: Int = 0
    //@Published var questions MEANS ENY UPDATE ON VARIABLE WILL NOTFY ALL UI ELEMNTS
    //arr take objects type is  Questions
    @Published var questions: [Question] = [
        Question(text: "ذا تُظهر استجابة «أوووه»؟ ",
                 options: ["بدا شراره الحديث", "الملل", "عدم الاتفاق", "فقد الانتباه"],
                 correctAnswer: "بدا شراره الحديث"),
        Question(text: "ماذا تفعل الابتسامة في بداية المحادثة؟ ",
                 options: ["تجاهل", "تغلق التفاعل", "تفتح التفاعل", "تربك الناس"],
                 correctAnswer: "تفتح التفاعل"),
        Question(text: "ما العلاقة بين الكذب المهذّب والاشمئزاز؟ ",
                 options: ["مؤقتة", "غير موجودة", "مباشرة", "عكسية"],
                 correctAnswer: "مباشرة"),
    ] // variable 1 arr

    @Published var questions2: [Question] = [
        Question(text: "كيف تعرف إن الابتسامة حقيقية؟",
                 options: ["يطالع للاسفل", "يضحك", "تواصل الاعين", "ظهور الاسنان"],
                 correctAnswer: "تواصل الاعين"),
        Question(text: "ماذا تعني وضعية اليد المقلوبة للأعلى؟",
                 options: ["ضعف", "ارتباك", "سيطرة", "ثقة وقوة"],
                 correctAnswer: "ضعف"),
        Question(text: "ماذا تعنى تعابير الاحتقار؟",
                 options: ["اعجاب", "سعادة", "ازدراء", "رضا"],
                 correctAnswer: "ازدراء"),
    ] // variable 1 arr

    // Current active question set (single source of truth)
    @Published var currentQuestions: [Question] = []

    // Make currentIndex published so UI updates when it changes
    @Published var currentIndex: Int = 0

    // nil means user did not select any thing so variable can be empty so we add ?
    @Published var selectedOption: String? = nil
    @Published var score: Int = 0

    init(useSecondSet: Bool = false) {
        currentQuestions = useSecondSet ? questions2 : questions
    }

    // bring qustuin based on selected creen based on index
    var currentQuestion: Question {
        currentQuestions[currentIndex]
    }

    //if user did not select
    func selectOption(_ option: String) {
        guard selectedOption == nil else { return }
        // save selected option
        selectedOption = option

        // currentQuestion inside it qustion from arr
        if option == currentQuestion.correctAnswer {
            // increase score
            score += 1
            //🟩 total score
            totalScore += 1
        }
    }

    func nextQuestion() {
        // use currentQuestions count (not the original questions array)
        if currentIndex < currentQuestions.count - 1 {
            currentIndex += 1
            selectedOption = nil
        }
    }

    func previousQuestion() {
        if currentIndex > 0 {
            currentIndex -= 1
            selectedOption = nil
        }
    }

    // Reset (useful if you want to reuse the same viewModel)
    func reset(useSecondSet: Bool = false) {
        currentQuestions = useSecondSet ? questions2 : questions
        currentIndex = 0
        selectedOption = nil
        score = 0
    }

    // Computed Property (خاصية محسوبة)
    var isLastQuestion: Bool {
        currentIndex == currentQuestions.count - 1
    }
}

// Note about headerView kept in QuizView (because it needs @StateObject access).
