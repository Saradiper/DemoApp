import SwiftUI

final class GameSettings: ObservableObject {
    @Published var multiplicationNumber = 1
    @Published var numberOfQuestions = 5
    
    @Published var randomMultiplicationInt: Int = 2
    @Published var answerNumber: String = ""
    @Published var disallowKeyboard: Bool = false
    
    @Published var countRound = 0
    @Published var correctAnswer = 0
    @Published var incorrectAnswer = 0
    @Published var scoreTitle = ""
    @Published var endGameTitle = ""
    
    @Published var alertShowingResult = false
    var alertMessage: String = ""
    @Published var alertEndGame = false
    
    
    func randomQuestion() -> String {
        return "\(multiplicationNumber) x \(randomMultiplicationInt)"
    }
    
    func buttonPressed(_ number: Int) {
        answerNumber.append(String(number))
    }
    
    func deletePressed() {
        if answerNumber != "" {
            answerNumber.removeLast()
            disallowKeyboard = false
        }
    }
    
    func checkTheAnswer () {
        if Int(answerNumber) == (multiplicationNumber * randomMultiplicationInt) {
            scoreTitle = "Correct"
            correctAnswer += 1
            answerNumber = ""
        } else {
            scoreTitle = "Wrong"
            incorrectAnswer += 1
            answerNumber = ""
        }
        countRound += 1
        alertShowingResult = true
        updateAlertMessage()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.randomMultiplicationNumber()
        }
        
    }
    
    func updateAlertMessage() {
        if scoreTitle == "Correct" {
            alertMessage = "Correct answer: \(correctAnswer), wrong answers: \(incorrectAnswer)"
        } else {
            alertMessage = "Correct answer: \(correctAnswer), wrong answers: \(incorrectAnswer). The correct answer was \(multiplicationNumber * randomMultiplicationInt)"
        }
        
    }
    
    func randomMultiplicationNumber() {
        randomMultiplicationInt = Int.random(in: 1...9)
    }
    
    func roundNumberCheck () {
        if countRound >= numberOfQuestions {
            alertEndGame = true
        }
    }
    
    func endOfGame() {
        endGameTitle = "End of the game"
        alertEndGame = true
        countRound = 0
    }
    
    func resteGame() {
        scoreTitle = ""
        correctAnswer = 0
        incorrectAnswer = 0
        countRound = 0
        randomMultiplicationNumber()
    }
}
