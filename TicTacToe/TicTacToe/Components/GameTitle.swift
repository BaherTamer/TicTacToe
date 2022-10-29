//
//  GameTitle.swift
//  TicTacToe
//
//  Created by Baher Tamer on 27/10/2022.
//

import SwiftUI

struct GameTitle: View {
    var body: some View {
        Text("Tic Tac Toe")
            .multilineTextAlignment(.center)
            .font(.largeTitle.weight(.heavy))
            .foregroundColor(.black)
            .padding(.vertical)
    }
}

struct GameTitle_Previews: PreviewProvider {
    static var previews: some View {
        GameTitle()
    }
}
