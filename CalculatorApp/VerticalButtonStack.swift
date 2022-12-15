//
//  VerticalButtonStack.swift
//  CalculatorApp
//
//  Created by Erick Roy Fernandez Terrel on 14/12/22.
//

import SwiftUI

struct VerticalButtonStack: View {
    
    @ObservedObject var viewmodel: ViewModel
    
    let data : [KeyboardButton]
    let columms : [GridItem]
    let width : CGFloat

    init(viewmodel: ViewModel, data : [KeyboardButton], columms:[GridItem], width : CGFloat){
        self.data = data
        self.columms = columms
        self.width = width
        self.viewmodel = viewmodel
    }
    
    
    var body: some View {
        LazyVGrid(columns: columms, spacing: 12){
            ForEach(data, id: \.self) { model in
                Button(action: { viewmodel.logic(key: model) }, label: {
                    if model.isDobleWith {
                        Rectangle()
                            .foregroundColor(model.background)
                            .overlay(
                                Text(model.title)
                                    .font(.largeTitle)
                                    .offset(x : width * 0.22 * 0.5)
                            ).frame(width : width * 2 * 0.22, height: width * 0.22)
                        
                    }else{
                        Text(model.title)
                            .font(.largeTitle)
                            .frame(width : width * 0.22, height: width * 0.22)
                            
                    }
                })
                .foregroundColor(model.textColor)
                .background(model.background)
                .cornerRadius(width * 0.25)
            }
        }.frame(width : width)
    }
}

struct VerticalButtonStack_Previews: PreviewProvider {
    static var previews: some View {
        VerticalButtonStack(viewmodel:ViewModel(), data: Matrix.firstSectionData, columms: Matrix.firstSectionGrid(390 * 0.25), width: 390)
            .previewLayout(.sizeThatFits)
    }
}
