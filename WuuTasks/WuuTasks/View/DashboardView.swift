//
//  DashboardView.swift
//  WuuTasks
//
//  Created by Tindwende Thierry Sawadogo on 8/23/22.
//

import SwiftUI

struct DashboardView: View {
    
    let user: AppUser
    
    @State var searchText: String = ""
    
    @ObservedObject var viewModel = TODOViewModel()
    
    var body: some View {
        
        ZStack {
            
            VStack {
                HStack {
                    Spacer()
                    Text("WuuTasks")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                    Spacer()
                }
                .overlay {
                    HStack {
                        Spacer()
                        Button {
                            AuthViewModel.shared.signOut()
                        } label: {
                            Text("Log Out")
                                .foregroundColor(Color(.systemGray))
                        }
                        .padding(.trailing)

                    }
                } // end overlay
                
                SearchBarView(searchText: $searchText)
                    .padding()
                
                TODOButtonStack(viewModel: viewModel)
                    .padding(.horizontal)
                    .padding(.bottom)
                
                if viewModel.todosFiltered.isEmpty {
                    AddTODOLogo()
                        .padding(.top)
                }
                
                ScrollView {
                    
                    VStack(spacing: 15) {
                        
                        ForEach(viewModel.todosFiltered, id: \.id) { todo in
                            
                            if searchText == "" {
                                
                                TODOView(todo: TODO(ownerUid: todo.ownerUid, title: todo.title, description: todo.description, TODOType: todo.TODOType, completed: todo.completed, documentID: todo.documentID), viewModel: viewModel)
                                
                            } else {
                                
                                if todo.title.lowercased().contains(searchText.lowercased()) || todo.description.lowercased().contains(searchText.lowercased()) {
                                    
                                    TODOView(todo: TODO(ownerUid: todo.ownerUid, title: todo.title, description: todo.description, TODOType: todo.TODOType, completed: todo.completed, documentID: todo.documentID), viewModel: viewModel)
                                    
                                }
                                
                            }
                            
                        }
                        
                    }
                    
                }
                
            } // end Vstack
            .overlay(
                VStack {
                    
                    Spacer()
                    HStack {
                        
                        Spacer()
                        Button {
                            viewModel.showCreateTODOView = true
                        } label: {
                            Image(systemName: "plus")
                                .padding()
                                .foregroundColor(.white)
                                .font(.system(size: 30))
                                .frame(width: 60, height: 60)
                                .background(Color("lightBlue"))
                                .cornerRadius(30)
                        }
                        .padding(20)
                        
                    }
                    
                }
            )
            
            if viewModel.showCreateTODOView {
                BlankView()
                CreateTODOView(user: user, viewModel: viewModel)
            }
            
        } // end Zstack
        
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(user: appUser01)
    }
}
