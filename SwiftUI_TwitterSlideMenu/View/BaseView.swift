//
//  BaseView.swift
//  SwiftUI_TwitterSlideMenu
//
//  Created by park kyung seok on 2022/11/13.
//

import SwiftUI

struct BaseView: View {
    
    @State var showMenu: Bool = false
    
    @State var currentTab = "Home"

    // 透明のUItabBarを隠す(見えないが押せちゃうので)
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
       
        let sideBarWidth = getRect().width - 90
    
       
        NavigationView {
            
            HStack(spacing: 0) {
                SideMenu(showMenu: $showMenu)
                
                // Main Tab View
                VStack(spacing: 0) {
                    
                    TabView(selection: $currentTab) {
                        Text("Home")
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("Home")
                        
                        Text("Search")
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("Search")
                        
                        Text("Notifications")
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("Notifications")
                        
                        Text("Message")
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("Message")
                    }
                    
                    // Custom TabBar
                    
                    VStack(spacing: 0) {
                        
                        Divider()
                        HStack(spacing: 0) {
                            TabButton(image: "Home")
                            
                            TabButton(image: "Search")
                            
                            TabButton(image: "Notifications")
                            
                            TabButton(image: "Message")
                        }
                        .padding(.top, 15)
                    }
                  
                }
                .frame(width: getRect().width)
            }
            // Max Width
            .frame(width: sideBarWidth + getRect().width)
            .offset(x: -sideBarWidth / 2)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
    }
    
    @ViewBuilder
    func TabButton(image: String) -> some View {
        Button(action: {
            withAnimation {
                currentTab = image
            }
        }, label: {
            Image(image)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 23, height: 22)
                .foregroundColor(currentTab == image ? .primary : .gray)
                .frame(maxWidth: .infinity)
        })
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
