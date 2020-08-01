//
//  BackgroundStyle.swift
//  TestCreateML
//
//  Created by Anmol singh on 2020-07-28.
//  Copyright © 2020 Swift Project. All rights reserved.
//


import SwiftUI

struct BlueBackgroundModifer: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color(UIColor.systemBlue))
            .clipShape(RoundedRectangle(cornerRadius: 3))
            .shadow(color: Color(UIColor.darkGray), radius: 2, x: 0, y: 1)
            .padding([.top,.leading,.trailing])
        
    }
}

struct GreenBackgroundModifer: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color(UIColor.systemGreen))
            .clipShape(RoundedRectangle(cornerRadius: 3))
            .shadow(color: Color(UIColor.darkGray), radius: 2, x: 0, y: 1)
            .padding([.top,.leading,.trailing])
        
    }
}

struct PinkBackgroundModifer: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color(UIColor.systemPink))
            .clipShape(RoundedRectangle(cornerRadius: 3))
            .shadow(color: Color(UIColor.darkGray), radius: 2, x: 0, y: 1)
            .padding([.top,.leading,.trailing])
        
    }
}

struct RedBackgroundModifer: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color(UIColor.systemRed))
            .clipShape(RoundedRectangle(cornerRadius: 3))
            .shadow(color: Color(UIColor.darkGray), radius: 2, x: 0, y: 1)
            .padding([.top,.leading,.trailing])
        
    }
}
extension View{
    func addBlueBackgroundStyle() -> some View{
        self.modifier(BlueBackgroundModifer())
    }
    
    func addGreenBackgroundStyle() -> some View{
          self.modifier(GreenBackgroundModifer())
      }
    func addPinkBackgroundStyle() -> some View{
          self.modifier(PinkBackgroundModifer())
      }
    func addRedBackgroundStyle() -> some View{
        self.modifier(RedBackgroundModifer())
    }
}
