//
//  PlayerNameTextfield.swift
//  TicTacToe
//
//  Created by Baher Tamer on 27/10/2022.
//

import SwiftUI

struct PlayerNameTextfield: View {
    @Binding var playerOneName: String
    @Binding var playerTwoName: String

    var body: some View {
        VStack {
            TextField("Player One Name", text: $playerOneName)
                .playerTextFieldStyle(color: .blue)

            TextField("Player Two Name", text: $playerTwoName)
                .playerTextFieldStyle(color: .cyan)
        }
        .autocorrectionDisabled()
    }
}

struct PlayerTextfield: ViewModifier {
    let color: Color

    func body(content: Content) -> some View {
        content
            .font(.headline)
            .padding()
            .background(Color(UIColor.systemGray6))
            .cornerRadius(12)
            .foregroundColor(color)
    }
}

extension View {
    func playerTextFieldStyle(color: Color) -> some View {
        modifier(PlayerTextfield(color: color))
    }
}

struct PlayerNameTextfield_Previews: PreviewProvider {
    static var previews: some View {
        PlayerNameTextfield(playerOneName: .constant(""), playerTwoName: .constant(""))
    }
}
