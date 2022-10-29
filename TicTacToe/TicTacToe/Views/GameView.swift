//
//  GameView.swift
//  TicTacToe
//
//  Created by Baher Tamer on 27/10/2022.
//

import SwiftUI

struct GameView: View {
    @Environment(\.dismiss) var dismiss

    private var threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    @State private var gameBoard: [Move] = Array(repeating: Move.empty, count: 9)

    @State private var isPlayerOneTurn = true
    @Binding var playerOne: Player
    @Binding var playerTwo: Player

    @State private var alertTitle: String = ""
    @State private var showingRoundAlert: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                XOPattern()

                VStack {
                    Score(playerOne: $playerOne, playerTwo: $playerTwo)

                    Text((isPlayerOneTurn ? playerOne.name : playerTwo.name) + "'s Turn")
                        .font(.title3.weight(.semibold))
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(isPlayerOneTurn ? .blue : .cyan)
                        .cornerRadius(12)
                        .padding(.vertical)

                    Spacer()

                    LazyVGrid(columns: threeColumnGrid, spacing: 10) {
                        ForEach(0 ..< 9, id: \.self) { index in
                            Button {
                                buttonTapped(index: index)
                            } label: {
                                Image(systemName: gameBoard[index].icon)
                                    .foregroundColor(gameBoard[index].color)
                                    .font(.largeTitle.weight(.heavy))
                                    .frame(width: 100, height: 100)
                                    .background(Color(UIColor.systemGray6))
                                    .cornerRadius(12)
                            }
                        }
                    }

                    Spacer()
                }
                .padding()
            }
            .toolbar(.hidden)
            .alert(alertTitle, isPresented: $showingRoundAlert) {
                Button("Continue", role: .cancel) {
                    resetBoard()
                }

                Button("Exit", role: .destructive) {
                    dismiss()
                }
            }
        }
    }

    func buttonTapped(index: Int) {
        if gameBoard[index] == .empty {
            if isPlayerOneTurn {
                gameBoard[index] = .x
            } else {
                gameBoard[index] = .o
            }

            isPlayerOneTurn.toggle()
            checkWinner()
        }
    }

    func checkWinner() {
        if (gameBoard[0] == .x && gameBoard[1] == .x && gameBoard[2] == .x) || (gameBoard[3] == .x && gameBoard[4] == .x && gameBoard[5] == .x) || (gameBoard[6] == .x && gameBoard[7] == .x && gameBoard[8] == .x) || (gameBoard[0] == .x && gameBoard[4] == .x && gameBoard[8] == .x) || (gameBoard[2] == .x && gameBoard[4] == .x && gameBoard[6] == .x) || (gameBoard[0] == .x && gameBoard[3] == .x && gameBoard[6] == .x) || (gameBoard[1] == .x && gameBoard[4] == .x && gameBoard[7] == .x) || (gameBoard[2] == .x && gameBoard[5] == .x && gameBoard[8] == .x) {
            playerOne.score += 1
            roundScore("\(playerOne.name) Wins!")
        }

        if (gameBoard[0] == .o && gameBoard[1] == .o && gameBoard[2] == .o) || (gameBoard[3] == .o && gameBoard[4] == .o && gameBoard[5] == .o) || (gameBoard[6] == .o && gameBoard[7] == .o && gameBoard[8] == .o) || (gameBoard[0] == .o && gameBoard[4] == .o && gameBoard[8] == .o) || (gameBoard[2] == .o && gameBoard[4] == .o && gameBoard[6] == .o) || (gameBoard[0] == .o && gameBoard[3] == .o && gameBoard[6] == .o) || (gameBoard[1] == .o && gameBoard[4] == .o && gameBoard[7] == .o) || (gameBoard[2] == .o && gameBoard[5] == .o && gameBoard[8] == .o) {
            playerTwo.score += 1
            roundScore("\(playerTwo.name) Wins!")
        }

        if !gameBoard.contains(.empty) {
            roundScore("Draw!")
        }
    }

    func roundScore(_ title: String) {
        alertTitle = title
        showingRoundAlert.toggle()
    }

    func resetBoard() {
        gameBoard = Array(repeating: Move.empty, count: 9)
    }

    init(playerOne: Binding<Player>, playerTwo: Binding<Player>) {
        self._playerOne = playerOne
        self._playerTwo = playerTwo
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(
            playerOne: .constant(Player(name: "Baher", score: 0)),
            playerTwo: .constant(Player(name: "Tamer", score: 0))
        )
    }
}
