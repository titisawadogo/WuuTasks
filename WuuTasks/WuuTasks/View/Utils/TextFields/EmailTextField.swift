//
//  EmailTextField.swift
//  WuuTasks
//
//  Created by Tindwende Thierry Sawadogo on 8/19/22.
//

import SwiftUI

struct EmailTextField: View {
    
    @Binding var text: String
    
    var body: some View {
        
        CustomTextField(text: $text, placeholder: Text("Email"), imageName: "envelope")
            .padding()
            .background(Color(.init(white: 1, alpha: 0.15)))
            .cornerRadius(10)
            .foregroundColor(.white)
        
    }
}

struct EmailTextField_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            backgroundGradientView()
            
            EmailTextField(text: .constant("Email"))
        }
    }
}
