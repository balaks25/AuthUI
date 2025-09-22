//
//  SignUpView.swift
//  AuthUI
//
//  Created by Balaji K S on 22/09/25.
//


import SwiftUI

@available(iOS 13.0, *)
public struct SignUpView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    let theme: AuthTheme
    var onSignUp: (String, String, String) -> Void
    var onBackToSignIn: () -> Void
    var onAppleLogin: () -> Void
    var onGoogleLogin: () -> Void
    var onFacebookLogin: () -> Void
    
    public init(
        theme: AuthTheme = AuthTheme(),
        onSignUp: @escaping (String, String, String) -> Void,
        onBackToSignIn: @escaping () -> Void,
        onAppleLogin: @escaping () -> Void,
        onGoogleLogin: @escaping () -> Void,
        onFacebookLogin: @escaping () -> Void
    ) {
        self.theme = theme
        self.onSignUp = onSignUp
        self.onBackToSignIn = onBackToSignIn
        self.onAppleLogin = onAppleLogin
        self.onGoogleLogin = onGoogleLogin
        self.onFacebookLogin = onFacebookLogin
    }
    
    public var body: some View {
        VStack(spacing: 16) {
            Text("Sign Up")
                .font(.largeTitle).bold()
            
            TextField("Full Name", text: $name)
                .textFieldStyle(.roundedBorder)
            
            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.emailAddress)
            
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
            
            SecureField("Confirm Password", text: $confirmPassword)
                .textFieldStyle(.roundedBorder)
            
            Button("Create Account") {
                guard Validator.isValidEmail(email),
                      Validator.isValidPassword(password),
                      password == confirmPassword else { return }
                onSignUp(name, email, password)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(theme.primaryColor)
            .foregroundColor(.white)
            .cornerRadius(theme.buttonCornerRadius)
            
            Divider().padding(.vertical, 8)
            
            VStack(spacing: 10) {
                AppleLoginButton(action: onAppleLogin)
                GoogleLoginButton(action: onGoogleLogin)
                FacebookLoginButton(action: onFacebookLogin)
            }
            
            Spacer()
            
            Button("Already have an account? Sign In") {
                onBackToSignIn()
            }
            .font(.footnote)
            .foregroundColor(theme.secondaryColor)
        }
        .padding()
    }
}

struct SignUpView_Previews: PreviewProvider {
    @available(iOS 13.0, *)
    static var previews: some View {
        SignUpView(
            onSignUp: { name, email, password in
                print("Preview SignUp: \(name) / \(email) / \(password)")
            },
            onBackToSignIn: {
                
            }, onAppleLogin: { print("Preview Apple Login") },
            onGoogleLogin: { print("Preview Google Login") },
            onFacebookLogin: { print("Preview Facebook Login") }
        )
        .previewDisplayName("Sign Up View")
    }
}
