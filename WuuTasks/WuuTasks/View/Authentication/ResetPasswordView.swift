//
//  ResetPasswordView.swift
//  WuuTasks
//
//  Created by Tindwende Thierry Sawadogo on 8/26/22.
//

import SwiftUI

struct ResetPasswordView: View {
    
    @State var email = ""
    @State var showAlert = false
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        
        ZStack {
            
            backgroundGradientView()
            
            VStack {
                LogoView()
                    .padding(.bottom, 25)
                
                EmailTextField(text: $email)
                    .padding(.horizontal, 28)
                
                Button  {
                    // reset password function
                    viewModel.resetPassword(withEmail: email)
                    showAlert = true
                } label: {
                    AuthenticateButtonView(text: "Reset Password")
                        .padding()
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Alert"), message: Text("The reset password link has been sent"))
                }
                
                Button {
                    // cancel button
                    mode.wrappedValue.dismiss()
                } label: {
                    CancelView(text: "Cancel")
                       // .padding()
                }

                

                
            }
            
            
        }
        
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
