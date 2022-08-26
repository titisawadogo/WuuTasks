//
//  LoginView.swift
//  WuuTasks
//
//  Created by Tindwende Thierry Sawadogo on 8/19/22.
//

import SwiftUI

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                backgroundGradientView()
                
                VStack {
                    LogoView()
                        .padding(.bottom, 25)
                    
                    VStack(spacing: 20) {
                        EmailTextField(text: $email)
                        PasswordSecureField(text: $password, placeholder: "Password")
                    }
                    .padding(.horizontal, 28)
                    
                    
                    
                    HStack {
                        
                        Spacer()
                        
                        NavigationLink(
                            destination: ResetPasswordView()
                                .navigationBarHidden(true),
                            
                         label: {
                            Text("Forgot Password?")
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .semibold))
                                .padding(.top)
                                .padding(.trailing, 28)
                        }
                        )
                        
                    }
                    
                    
                    Button {
                        
                        viewModel.login(withEmail: email, password: password)
                        
                    } label: {
                        AuthenticateButtonView(text: "Sign In")
                            .padding()
                    }

                    
                    
                    Spacer()
                    
                    //Button to go to Sign Up View
                    NavigationLink(
                        destination: SignupView()
                            .navigationBarHidden(true),
                        label: {
                            HStack {
                                Text("Don't have an account?")
                                    .font(.system(size: 14))
                                Text("Sign Up")
                                    .font(.system(size: 14, weight: .semibold))
                            }
                            .foregroundColor(.white)
                        }
                    )
                    .padding(.bottom, 16)
                     
                }
                .padding(.top, -44)
            }
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
