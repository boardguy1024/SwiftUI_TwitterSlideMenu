//
//  Home.swift
//  SwiftUI_TwitterSlideMenu
//
//  Created by park kyung seok on 2022/11/13.
//

import SwiftUI

struct Home: View {
    
    @Binding var showMenu: Bool

    var body: some View {
        
        Button(action: {
            withAnimation {
                showMenu.toggle()
            }
        }, label: {
            
            Text("Show Menu")
        })
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
