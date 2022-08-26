//
//  SignupView.swift
//  WuuTasks
//
//  Created by Tindwende Thierry Sawadogo on 8/19/22.
//

import SwiftUI

struct SignupView: View {
    
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    @State var showAlert = false
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        
        ZStack {
            
            backgroundGradientView()
            
            VStack {
                LogoView()
                    .padding(.bottom, 25)
                
                VStack(spacing: 20) {
                    
                    UserTextField(text: $firstName, placeholder: "First Name")
                    UserTextField(text: $lastName , placeholder: "Last Name")
                    EmailTextField(text: $email)
                    PasswordSecureField(text: $password, placeholder: "Password")
                    PasswordSecureField(text: $confirmPassword, placeholder: "Confirm Password")
                    
                }
                .padding(.horizontal, 28)
                
                Button {
                    
                    viewModel.register(withEmail: email, password: password, firstname: firstName, lastName: lastName)
                    
                    showAlert = true
                    
                } label: {
                    AuthenticateButtonView(text: "Sign Up")
                        .padding()
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Alert"), message: Text("Account has been created successfully"))}
                
                Spacer()
                
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    HStack {
                        Text("Already have an account?")
                            .font(.system(size: 14))
                        Text("Sign In")
                            .font(.system(size: 14, weight: .semibold))
                    }
                    .foregroundColor(.white)
                }
                .padding(.bottom, 16)


            }
            .padding(.top, 20)
            
            
        }
        
    }
}



struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
