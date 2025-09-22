//
//  SignInView.swift
//  AuthUI
//
//  Created by Balaji K S on 22/09/25.
//


import SwiftUI

@available(iOS 13.0, *)
public struct SignInView: View {
    @State private var email = ""
    @State private var password = ""
    
    let theme: AuthTheme
    var onSignIn: (String, String) -> Void
    var onSignUpTap: () -> Void
    var onAppleLogin: () -> Void
    var onGoogleLogin: () -> Void
    var onFacebookLogin: () -> Void
    
    public init(
        theme: AuthTheme = AuthTheme(),
        onSignIn: @escaping (String, String) -> Void,
        onSignUpTap: @escaping () -> Void,
        onAppleLogin: @escaping () -> Void,
        onGoogleLogin: @escaping () -> Void,
        onFacebookLogin: @escaping () -> Void
    ) {
        self.theme = theme
        self.onSignIn = onSignIn
        self.onSignUpTap = onSignUpTap
        self.onAppleLogin = onAppleLogin
        self.onGoogleLogin = onGoogleLogin
        self.onFacebookLogin = onFacebookLogin
    }
    
    public var body: some View {
        VStack(spacing: 16) {
            Text("Sign In")
                .font(.largeTitle).bold()
            
            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.emailAddress)
            
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
            
            Button("Sign In") {
                guard Validator.isValidEmail(email),
                      Validator.isValidPassword(password) else { return }
                onSignIn(email, password)
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
            
            Button("Don't have an account? Sign Up") {
                onSignUpTap()
            }
            .font(.footnote)
            .foregroundColor(theme.secondaryColor)
        }
        .padding()
    }
}

struct SignInView_Previews: PreviewProvider {
    @available(iOS 13.0, *)
    static var previews: some View {
        SignInView(
            onSignIn: { email, password in
                print("Preview SignIn: \(email) / \(password)")
            },
            onSignUpTap: {
                
            }, onAppleLogin: { print("Preview Apple Login") },
            onGoogleLogin: { print("Preview Google Login") },
            onFacebookLogin: { print("Preview Facebook Login") }
        )
        .previewDisplayName("Sign In View")
    }
}
