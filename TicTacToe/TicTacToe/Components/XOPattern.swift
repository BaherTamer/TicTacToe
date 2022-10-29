//
//  XOPattern.swift
//  TicTacToe
//
//  Created by Baher Tamer on 27/10/2022.
//

import SwiftUI

struct XOPattern: View {
    var body: some View {
        Image("XO Pattern")
            .resizable()
            .scaledToFit()
            .ignoresSafeArea()
            .opacity(0.025)
            .scaleEffect(1.2)
    }
}

struct XOPattern_Previews: PreviewProvider {
    static var previews: some View {
        XOPattern()
    }
}
