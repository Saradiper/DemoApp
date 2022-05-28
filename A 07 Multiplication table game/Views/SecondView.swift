import SwiftUI


struct SecondView: View {
    @EnvironmentObject var settings: GameSettings
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(spacing: 8) {
                    Text("Multiplication table")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .shadow(color: .white, radius: 2)
                    
                    Text("x \(settings.multiplicationNumber)")
                        .font(.title2)
                        .fontWeight(.bold)
                        .shadow(color: .white, radius: 2)
                }
                .modifier(TitleBackground())
                .padding(.bottom, 8)
           
                HStack(spacing: 48) {
                    Text("Question \(settings.countRound) /\(settings.numberOfQuestions)")
                    Text("Score: \(settings.correctAnswer)")
                }
                .modifier(BoxSecondViewBackground())
                .padding(.bottom, 40)
                
                VStack(spacing: 8) {
                    Text("What is \(settings.randomQuestion())?")
                        .font(.title3)
            
                    Text(settings.answerNumber == "" ? "Enter your answer" : "\(settings.answerNumber)")
                        .foregroundColor(settings.answerNumber == "" ? Color.gray : Color.black)
                }
                .modifier(BoxSecondViewBackground())
                .padding(.bottom, 32)
                
                VStack {
                    HStack(spacing: 16)  {
                        KeyboardGameButton(number: 1)
                        KeyboardGameButton(number: 2)
                        KeyboardGameButton(number: 3)
                    }
                    .padding(.bottom, 8)
                    
                    HStack(spacing: 16)  {
                        KeyboardGameButton(number: 4)
                        KeyboardGameButton(number: 5)
                        KeyboardGameButton(number: 6)
                    }
                    .padding(.bottom, 8)
                    
                    HStack(spacing: 16) {
                        KeyboardGameButton(number: 7)
                        KeyboardGameButton(number: 8)
                        KeyboardGameButton(number: 9)
                    }
                    .padding(.bottom, 8)
                    
                    HStack(spacing: 16) {
                        Button("Delete") {
                            settings.deletePressed()
                        }
                        .frame(maxWidth: 128, maxHeight: 56)
                        .background(.ultraThickMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(color: .black, radius: 3)
                        
                        KeyboardGameButton(number: 0)
                    }
                    .padding(.bottom, 32)
                    
                    HStack {
                        Button("Check!") {
                            settings.checkTheAnswer()
                        }
                        .frame(maxWidth: 128, maxHeight: 56)
                        .background(.ultraThickMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(color: .black, radius: 2)
                    }
                    .padding(.bottom, 152)
                }
                .font(.title)
                
            }
            .background(
                Image("river")
                    .renderingMode(.original)
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: 550, height: 620)
            )
            .foregroundColor(.black)
            .onAppear(perform: settings.randomMultiplicationNumber)
            
            .alert(settings.scoreTitle, isPresented: $settings.alertShowingResult) {
                Button("Continue", action: settings.roundNumberCheck)
            } message: {
                if settings.scoreTitle == "Correct" {
                    Text("Correct answer: \(settings.correctAnswer), wrong answers: \(settings.incorrectAnswer)")
                        .foregroundColor(.white)
                        .font(.title.bold())
                } else {
                    Text("The correct answer was \(settings.multiplicationNumber * settings.randomMultiplicationInt)")
                        .foregroundColor(.white)
                        .font(.title.bold())
                }
            }
            
            .alert(settings.endGameTitle, isPresented: $settings.alertEndGame) {
                Button("Restart the game", action: settings.resteGame)
            } message: {
                Text("Final score: \(settings.correctAnswer)")
            }
        }
    }
}


struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView().environmentObject(GameSettings())
    }
}
