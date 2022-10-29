//
//  StartView.swift
//  TicTacToe
//
//  Created by Baher Tamer on 25/10/2022.
//

import SwiftUI

struct StartView: View {
    @State private var playerOne: Player = Player(name: "", score: 0)
    @State private var playerTwo: Player = Player(name: "", score: 0)

    var body: some View {
        NavigationStack {
            ZStack {
                XOPattern()

                VStack {
                    GameTitle()

                    PlayerNameTextfield(playerOneName: $playerOne.name, playerTwoName: $playerTwo.name)

                    NavigationLink(destination: GameView(playerOne: $playerOne, playerTwo: $playerTwo)
                        .navigationBarBackButtonHidden()) {
                        Text("Start")
                            .foregroundColor(.white)
                            .font(.title3.weight(.bold))
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.black)
                            .cornerRadius(12)
                            .padding(.vertical)
                    }
                        .disabled(playerOne.name.isEmpty && playerTwo.name.isEmpty)
                }
                .padding(.horizontal)
            }
            .onAppear(perform: resetTextFields)
        }
    }

    func resetTextFields() {
        playerOne = Player(name: "", score: 0)
        playerTwo = Player(name: "", score: 0)
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
