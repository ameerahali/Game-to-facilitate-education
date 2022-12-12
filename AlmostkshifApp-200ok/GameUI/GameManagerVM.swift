//
//  GameManagerVM.swift
//  AKQuiz
//
//

import Foundation
import SwiftUI

class GameManagerVM : ObservableObject {

    static var currentIndex = 0
    
    static func createGameModel(i:Int) -> Quiz {
        return Quiz(currentQuestionIndex: i, quizModel: quizData[i])
    }
    
    @Published var model = GameManagerVM.createGameModel(i: GameManagerVM.currentIndex)
    
    
    var timer = Timer()
    var maxProgress = 15
    @Published var progress = 0
    
    init() {
        self.start()
    }
    
    func verifyAnswer(selectedOption: QuizOption) {
        for index in model.quizModel.optionsList.indices {
            model.quizModel.optionsList[index].isMatched = false
            model.quizModel.optionsList[index].isSelected = false
            
        }
        if let index = model.quizModel.optionsList.firstIndex(where: {$0.optionId == selectedOption.optionId}) {
            if selectedOption.optionId ==  model.quizModel.answer {
                model.quizModel.optionsList[index].isMatched = true
                model.quizModel.optionsList[index].isSelected = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    if (GameManagerVM.currentIndex < 2) {
                        GameManagerVM.currentIndex = GameManagerVM.currentIndex + 1
                        self.model = GameManagerVM.createGameModel(i: GameManagerVM.currentIndex)
                    } else {
                        self.model.quizCompleted = true
                        self.model.quizWinningStatus = true
                        self.reset()
                    }
                }
            } else {
                model.quizModel.optionsList[index].isMatched = false
                model.quizModel.optionsList[index].isSelected = true
            }

        }
    }
    
    func restartGame() {
        GameManagerVM.currentIndex = 0
        model = GameManagerVM.createGameModel(i: GameManagerVM.currentIndex)
        self.start()
    }
    
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats:true, block: { time in
            if self.progress == self.maxProgress {
                self.model.quizCompleted = true
                self.model.quizWinningStatus = false
                self.reset()
            } else {
                self.progress += 1
            }
        })
    }
                                     
    func reset () {
        timer.invalidate()
        self.progress = 0
    }
    
                                     
                                     
                                     
                                

}

extension GameManagerVM
{
    static var quizData: [QuizModel] {
        [
            QuizModel(question: "ماهو ترتيب كوكب الارض في المجموعة الشمسية؟",
                      answer: "ب",
                      optionsList: [QuizOption(id: 11, optionId: "ا", option: "الثاني", color: Color.yellow),
                                    QuizOption(id: 12,optionId: "ب", option: "الثالث", color: Color.red),
                                    QuizOption(id: 13,optionId: "ج", option: "الاول", color: Color.green),
                                    QuizOption(id: 14,optionId: "د", option: "الخامس", color: Color.purple)]),
            
            QuizModel(question: "بماذا يلقب كوكب الأرض؟",
                      answer: "ج",
                      optionsList: [QuizOption(id: 21,optionId: "ا", option: "كوكب الأمل", color: Color.yellow),
                                    QuizOption(id: 22,optionId: "ب", option: "كوكب الاحلام", color: Color.red),
                                    QuizOption(id: 23,optionId: "ج", option: "كوكب الحياة", color: Color.green),
                                    QuizOption(id: 24,optionId: "د", option: "كوكب المغامرات", color: Color.purple)]),
            
            QuizModel(question: "ماهو الكوكب الذي يمكن للكائنات الحية العيش فيه؟",
                      answer: "ب",
                      optionsList: [QuizOption(id: 31,optionId: "ا", option: "كوكب زحل", color: Color.yellow),
                                    QuizOption(id: 32,optionId: "ب", option: "كوكب الأرض", color: Color.red),
                                    QuizOption(id: 33,optionId: "ج", option: "كوكب المريخ", color: Color.green),
                                    QuizOption(id: 34,optionId: "د", option: "كوكب المشتري", color: Color.purple)])
        ]
    }
}
