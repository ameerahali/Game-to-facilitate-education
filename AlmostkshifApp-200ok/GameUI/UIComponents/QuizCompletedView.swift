//
//  QuizCompletedView.swift
//  AKQuiz
//
//  Created by richa.e.srivastava on 16/11/2021.
//

import Foundation
import SwiftUI

struct QuizCompletedView: View {
    var gameManagerVM: GameManagerVM
    var body: some View {
        VStack {
            Image(systemName: "gamecontroller.fill")
                .foregroundColor(Color.yellow)
                .font(.system(size: 60))
                .padding()
            
            ReusableText(text: gameManagerVM.model.quizWinningStatus ?
                         "نهاية الاسئلة" :
                            "إنتهت اللعبة",
                         size: 30)
                .padding()
            
            ReusableText(text: gameManagerVM.model.quizWinningStatus
                         ? "شكرًا لك على اللعب!!"
                         : "حظًا اوفر في المرة القادمة",
                         size: 30)
                .padding()
            
            Button {
                gameManagerVM.restartGame()
            } label: {
                HStack {
                    Image(systemName: "play.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                        .padding()
                    
                    Text("العب مرة اخرى!")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                }
            }.frame(width: 300, height: 60, alignment: .center)
                .background(.purple.opacity(0.7))
                .cornerRadius(30)
                .padding()
            
        }
    }
}
