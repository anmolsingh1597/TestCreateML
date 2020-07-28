//
//  BackgroundStyle.swift
//  TestCreateML
//
//  Created by Anmol singh on 2020-07-28.
//  Copyright © 2020 Swift Project. All rights reserved.
//


import SwiftUI

struct BackgroundModifer: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color(UIColor.systemGroupedBackground))
            .clipShape(RoundedRectangle(cornerRadius: 3))
            .shadow(color: Color(UIColor.systemGray), radius: 2, x: 0, y: 1)
            .padding([.top,.leading,.trailing])
        
    }
}
extension View{
    func addBackgroundStyle() -> some View{
        self.modifier(BackgroundModifer())
    }
}
