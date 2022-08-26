//
//  LogoView.swift
//  WuuTasks
//
//  Created by Tindwende Thierry Sawadogo on 8/19/22.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        
        VStack {
            Image("LoginLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            
            Text("WuuTasks")
                .foregroundColor(.white)
                .font(.system(size: 25))
                .fontWeight(.bold)
        }
        
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            backgroundGradientView()
            LogoView()
        }
    }
}
