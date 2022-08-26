//
//  AddTODOLogo.swift
//  WuuTasks
//
//  Created by Tindwende Thierry Sawadogo on 8/24/22.
//

import SwiftUI

struct AddTODOLogo: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        VStack {
//            Image("LoginLogo")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 150, height: 150)
//                .background(colorScheme == .dark ? .clear : .black)
//                .cornerRadius(80)
            
            Text("No Tasks")
                .foregroundColor(colorScheme == .dark ? .white : .black)
                .font(.system(size: 25))
                .fontWeight(.semibold)
        }
        
    }
}

struct AddTODOLogo_Previews: PreviewProvider {
    static var previews: some View {
        AddTODOLogo()
    }
}
