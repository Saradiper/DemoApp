import SwiftUI

struct FirstView: View {
    // inicializamos para asignar valores
    @StateObject var settings = GameSettings()
    
    var body: some View {
        NavigationView {
            ZStack{
                VStack{
                    VStack(spacing: 10) {
                        Text("Multiplications")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .shadow(color: .white, radius: 2)
                        
                        Text("Before the game, select your settings:")
                            .shadow(color: .white, radius: 2)
                    }
                    .modifier(TitleBackground())
                    .padding(.bottom, 32)
                    
                    VStack {
                        Text("Table:")
                            .font(.title3)
                        Picker("Multiplication number", selection: $settings.multiplicationNumber) {

                            ForEach(1 ..< 10, id: \.self) { 
                                Text("x \($0)")
                                    .font(.title3)
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(width: 100, height: 150)
                    }
                    .modifier(BoxFirstViewBackground())
                    .padding(.bottom, 8)
                    
                    VStack(spacing: 12) {
                        Text("Number of questions:")
                            .font(.title3)
                        VStack{
                            Text("\(settings.numberOfQuestions)")
                                .foregroundColor(.black)
                                .font(.title3)
                                .fontWeight(.bold)
                            Stepper("", value: $settings.numberOfQuestions, in: 5...15)
                                .frame(width: 100, height: 50)
                                .shadow(radius: 4)
                        }
                    }
                    .modifier(BoxFirstViewBackground())
                    .padding(.bottom, 48)

                    
                    
                    VStack{
                        NavigationLink(destination: SecondView()) {
                            Text("Start game")
                                .font(.title3)
                                .fontWeight(.bold)
                        }
                        .padding(.horizontal, 48)
                        .padding(.vertical, 24)
                        .foregroundColor(.white)
                        .background(LinearGradient(gradient: Gradient(colors: [Color .blue, Color .brown]), startPoint: .leading, endPoint: .trailing))
                        .clipShape(Capsule())
                        .shadow(radius: 5)
                    }
                    .padding(.bottom, 72)
                }
            }
            .background(
                Image("forest")
                    .renderingMode(.original)
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: 1000, height: 670)
            )
            .foregroundColor(.black)
        }
        .environmentObject(settings)
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView().environmentObject(GameSettings())
    }
}

