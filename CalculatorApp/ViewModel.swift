//
//  ViewModel.swift
//  CalculatorApp
//
//  Created by Erick Roy Fernandez Terrel on 14/12/22.
//

import Foundation

final class ViewModel : ObservableObject{
    
    @Published var textFieldValue : String = "0"
    
    var textFieldSaveValue : String = "0"
    var curretOperationExecute : OperationType?
    var shouldRunOperation : Bool = false
    
    
    func logic(key : KeyboardButton ){
        
        switch key.type {
            
        case .number(let value) :
            if(shouldRunOperation){
                textFieldValue = "0";
            }
            textFieldValue = textFieldValue == "0" ? "\(value)" : textFieldValue + "\(value)"
            
        case .reset :
            textFieldValue = "0"
            textFieldSaveValue = "0"
            curretOperationExecute = nil
            shouldRunOperation = false
            
        case .result :
            guard let operation = curretOperationExecute else {
                return
            }
            
            switch operation {
            case .multiplication :
                textFieldValue = "\( Int(textFieldValue)! * Int(textFieldSaveValue)!)"
            case .sum :
                textFieldValue = "\( Int(textFieldValue)! + Int(textFieldSaveValue)!)"
            }
            
        case .operation(let type):
            textFieldSaveValue = textFieldValue
            curretOperationExecute = type
            shouldRunOperation = true
        }
    }
    
}
