import SwiftUI

struct KeyboardGameButton: View {
    @EnvironmentObject var gameSetting: GameSettings
    var number: Int
    
    var body: some View {
        Button("\(number)") {
            if gameSetting.answerNumber.count < 4 {
                gameSetting.buttonPressed(number)
            } else {
                gameSetting.disallowKeyboard =  true
            }
        }
        .modifier(BoxKeyboardBackground())
        .disabled(gameSetting.disallowKeyboard)
    }
}

struct KeyboardGameButton_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardGameButton(number: 1)
    }
}

