//
//  ContentView.swift
//  CalculatorApp
//
//  Created by Erick Roy Fernandez Terrel on 14/12/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewmodel = ViewModel()
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            GeometryReader {
                proxy in VStack {
                    VStack{
                        Spacer()
                        HStack{
                            Spacer()
                            Text(viewmodel.textFieldValue)
                                .foregroundColor(.white)
                                .font(.system(size: 100, weight: .regular))
                                .frame(height: 100)
                                .padding(.trailing, 20)
                        }
                    }
                    VerticalButtonStack(
                        viewmodel: viewmodel,
                        data: Matrix.firstSectionData, columms: Matrix.firstSectionGrid(proxy.size.width * 0.25), width: proxy.size.width)
                    
                    VerticalButtonStack(
                        viewmodel: viewmodel,
                        data: Matrix.secondSectionData, columms: Matrix.secondSectionGrid(proxy.size.width * 0.25), width: proxy.size.width)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
