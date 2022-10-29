//
//  Move.swift
//  TicTacToe
//
//  Created by Baher Tamer on 28/10/2022.
//

import Foundation
import SwiftUI

enum Move {
    case x, o, empty
}

extension Move {
    var color: Color {
        switch self {
        case .x:
            return .blue
        case .o:
            return .cyan
        case .empty:
            return Color(UIColor.systemGray6)
        }
    }
}

extension Move {
    var icon: String {
        switch self {
        case .x:
            return "xmark"
        case .o:
            return "circle"
        case .empty:
            return "minus"
        }
    }
}
