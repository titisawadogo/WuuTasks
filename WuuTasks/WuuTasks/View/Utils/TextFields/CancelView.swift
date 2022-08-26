//
//  CancelView.swift
//  WuuTasks
//
//  Created by Tindwende Thierry Sawadogo on 8/26/22.
//

import SwiftUI

struct CancelView: View {
    
    let text: String
    
    var body: some View {
        Text(text)
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 360, height: 50)
            .background(Color.red.opacity(0.8))
            .clipShape(Capsule())
    }
}

struct CancelView_Previews: PreviewProvider {
    static var previews: some View {
        CancelView(text: "Cancel")
    }
}
