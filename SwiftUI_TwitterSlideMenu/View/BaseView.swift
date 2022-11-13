//
//  BaseView.swift
//  SwiftUI_TwitterSlideMenu
//
//  Created by park kyung seok on 2022/11/13.
//

import SwiftUI

struct BaseView: View {
    
    @State var showMenu: Bool = false
    
    var body: some View {
        
        NavigationView {
            
            HStack(spacing: 0) {
                SideMenu(showMenu: $showMenu)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
