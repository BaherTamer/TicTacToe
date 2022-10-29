//
//  Score.swift
//  TicTacToe
//
//  Created by Baher Tamer on 28/10/2022.
//

import SwiftUI

struct Score: View {

    @Binding var playerOne: Player
    @Binding var playerTwo: Player
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            PlayerScore(name: playerOne.name, score: $playerOne.score, color: .blue)
            Divider()
            PlayerScore(name: playerTwo.name, score: $playerTwo.score, color: .cyan)
        }
        .padding()
        .background(Color(UIColor.systemGray6))
        .cornerRadius(12)
    }
}

struct PlayerScore: View {
    let name: String
    @Binding var score: Int
    let color: Color

    var body: some View {
        HStack {
            Text(name)
                .font(.title.weight(.semibold))

            Spacer()

            Text("\(score)")
                .font(.largeTitle)
                .foregroundColor(color)
                .fontWeight(.heavy)
        }
    }
}

struct Score_Previews: PreviewProvider {
    static var previews: some View {
        Score(
            playerOne: .constant(Player(name: "Baher", score: 0)),
            playerTwo: .constant(Player(name: "Tamer", score: 0))
        )
    }
}
