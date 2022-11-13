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
    
    @State var offset: CGFloat = 0
    @State var lastStoredOffset: CGFloat = 0
    
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
                        Home(showMenu: $showMenu)
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
                // BG when menu is showing
                .overlay(
                    Rectangle()
                        .fill(
                            // When showing menu =          300   /     300       / 5 = 0.2
                            // When hiding  menu =           0    /      0        / 5 = 0
                            Color.primary.opacity( Double((offset / sideBarWidth) / 5) )
                        )
                        .ignoresSafeArea(.container, edges: .vertical)
                        .onTapGesture {
                            withAnimation {
                                showMenu.toggle()
                            }
                        }
                )
                
                
            }
            // Max Width
            .frame(width: sideBarWidth + getRect().width)
            .offset(x: -sideBarWidth / 2)
            .offset(x: offset)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
        .animation(.easeOut, value: offset == 0)
        .onChange(of: showMenu) { newValue in
            
            print("newValue: \(newValue)")
            
            if showMenu && offset == 0 {
                offset = sideBarWidth
                lastStoredOffset = sideBarWidth
            }
            
            if !showMenu && offset == sideBarWidth {
                offset = 0
                lastStoredOffset = 0
            }
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
