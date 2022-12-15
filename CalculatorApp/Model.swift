//
//  Model.swift
//  CalculatorApp
//
//  Created by Erick Roy Fernandez Terrel on 14/12/22.
//

import Foundation
import SwiftUI

struct KeyboardButton : Hashable{
    let title: String
    let textColor:Color
    let background:Color
    let isDobleWith:Bool
    let type:ButtonType
}

enum ButtonType : Hashable{
    case number(Int)
    case operation(OperationType)
    case result
    case reset
}

enum OperationType : Hashable{
    case sum
    case multiplication
}
