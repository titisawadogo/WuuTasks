//
//  CreateTODOView.swift
//  WuuTasks
//
//  Created by Tindwende Thierry Sawadogo on 8/25/22.
//

import SwiftUI

struct CreateTODOView: View {
    
    let user: AppUser
    
    @State var title: String = ""
    @State var TODODescription: String = ""
    @State var TODOType: String = ""
    @State var completed: Bool = false
    
    @ObservedObject var viewModel: TODOViewModel
    
    var body: some View {
        
        VStack {
            
            TODOButtonStack(viewModel: viewModel)
                .padding()
                .padding(.top)
            
            TODOTextField(text: $title, placeholder: "Task")
                .padding([.horizontal, .bottom])
            
            CustomTextEditor(text: $TODODescription, placeholder: Text("Description"), imageName: "line.3.horizontal", foregroundColor: .gray)
                .padding([.horizontal, .bottom])
            
            HStack {
                
                Button {
                    viewModel.uploadTODO(todo: TODO(ownerUid: user.id ?? "", title: title, description: TODODescription, TODOType: viewModel.filterTODOSelected == .all ? "Other(s)" : viewModel.filterTODOSelected.rawValue, completed: false))
                    viewModel.showCreateTODOView = false
                } label: {
                    CreateTODOButton()
                }
                
                Button {
                    viewModel.showCreateTODOView = false
                } label: {
                    CancelTODOButton()
                }

            }
            Spacer()
            
        }
        .frame(width: UIScreen.main.bounds.size.width - 100, height: 360)
        .background(Color(.systemGray5))
        .cornerRadius(25)
        
    }
}

struct CreateTODOView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTODOView(user: appUser01, viewModel: TODOViewModel())
    }
}

struct CreateTODOButton: View {
    var body: some View {
        Text("Create")
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 150, height: 40)
            .background(Color.blue.opacity(0.6))
            .clipShape(Capsule())
    }
}


struct CancelTODOButton: View {
    var body: some View {
        Text("Cancel")
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 100, height: 40)
            .background(Color.red.opacity(0.6))
            .clipShape(Capsule())
    }
}
