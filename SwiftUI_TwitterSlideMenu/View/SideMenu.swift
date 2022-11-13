//
//  SideMenu.swift
//  SwiftUI_TwitterSlideMenu
//
//  Created by park kyung seok on 2022/11/13.
//

import SwiftUI

struct SideMenu: View {
    
    @Binding var showMenu: Bool
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            // Header Profiles
            VStack(alignment: .leading, spacing: 10) {
                
                Image("Pic")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 65, height: 65)
                    .clipShape(Circle())
                
                Text("iJustine")
                    .font(.title2.bold())
                
                Text("@ijustine")
                    .font(.callout)
                
                // Following Buttons
                HStack(spacing: 12) {
                    
                    Button(action: {}, label: {
                        Label {
                            Text("Followers")
                        } icon: {
                            Text("189")
                                .fontWeight(.bold)
                        }
                    })
                    
                    Button(action: {}, label: {
                        Label {
                            Text("Following")
                        } icon: {
                            Text("1.2M")
                                .fontWeight(.bold)
                        }
                    })
                }
                .foregroundColor(.primary)
            }
            .padding(.horizontal)
            .padding(.leading)
            
            // TabButtons
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack {
                    // TabButtons
                    VStack(alignment: .leading, spacing: 45) {
                        TabButton(title: "Profile", image: "Profile")
                        TabButton(title: "Lists", image: "Lists")
                        TabButton(title: "Topics", image: "Topics")
                        TabButton(title: "Bookmarks", image: "Bookmarks")
                        TabButton(title: "Moments", image: "Moments")
                        TabButton(title: "Purchases", image: "Purchases")
                        TabButton(title: "Monetization", image: "Monetization")
                    }
                    .padding()
                    .padding(.leading)
                    .padding(.top, 35)
                    
                    Divider()
                    
                    TabButton(title: "Twitter Ads", image: "Ads")
                        .padding()
                        .padding(.leading)
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 30) {
                        
                        Button(action: {}, label: {
                            Text("Settings And Privacy")
                        })
                        
                        Button(action: {}, label: {
                            Text("Help Center")
                        })
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.primary)
                    .padding()
                    .padding(.leading)
                }
             
            }
            
            VStack(spacing: 0) {
                
                Divider()
                
                HStack {
                    Button(action: {}, label: {
                        Image("Light")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 22, height: 22)
                    })
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        Image("QR")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 22, height: 22)
                    })
                }
                .padding([.horizontal, .top], 15)
            }
        }
        .padding(.top)
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(width: getRect().width - 90)
        .frame(maxHeight: .infinity)
        .background(
            
            Color.primary
                .opacity(0.04)
                .ignoresSafeArea(.container, edges: .vertical)
        )
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    @ViewBuilder
    func TabButton(title: String, image: String) -> some View {
        
        Button(action: {}, label: {
            HStack(spacing: 14) {
                
                Image(image)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 22, height: 22)
                
                Text(title)
            }
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
        })
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Extenting view to get Screen Rect.
extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}
