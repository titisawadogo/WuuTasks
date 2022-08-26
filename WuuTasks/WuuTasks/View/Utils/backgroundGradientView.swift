//
//  backgroundGradientView.swift
//  WuuTasks
//
//  Created by Tindwende Thierry Sawadogo on 8/19/22.
//

import SwiftUI

struct backgroundGradientView: View {
    var body: some View {
       
        LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
        
    }
}

struct backgroundGradientView_Previews: PreviewProvider {
    static var previews: some View {
        backgroundGradientView()
    }
}
