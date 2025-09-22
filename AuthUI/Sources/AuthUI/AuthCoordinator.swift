//
//  AuthCoordinator.swift
//  AuthUI
//
//  Created by Balaji K S on 22/09/25.
//


import SwiftUI

@available(iOS 13.0, *)
public struct AuthCoordinator: View {
    @State private var showingSignIn = true
    let theme: AuthTheme
    
    var onSignIn: (String, String) -> Void
    var onSignUp: (String, String, String) -> Void
    var onAppleLogin: () -> Void
    var onGoogleLogin: () -> Void
    var onFacebookLogin: () -> Void
    
    public init(
        theme: AuthTheme = AuthTheme(),
        onSignIn: @escaping (String, String) -> Void,
        onSignUp: @escaping (String, String, String) -> Void,
        onAppleLogin: @escaping () -> Void,
        onGoogleLogin: @escaping () -> Void,
        onFacebookLogin: @escaping () -> Void
    ) {
        self.theme = theme
        self.onSignIn = onSignIn
        self.onSignUp = onSignUp
        self.onAppleLogin = onAppleLogin
        self.onGoogleLogin = onGoogleLogin
        self.onFacebookLogin = onFacebookLogin
    }
    
    public var body: some View {
        if showingSignIn {
            SignInView(
                theme: theme,
                onSignIn: onSignIn,
                onSignUpTap: { showingSignIn = false },
                onAppleLogin: onAppleLogin,
                onGoogleLogin: onGoogleLogin,
                onFacebookLogin: onFacebookLogin
            )
        } else {
            SignUpView(
                theme: theme,
                onSignUp: onSignUp,
                onBackToSignIn: { showingSignIn = true },
                onAppleLogin: onAppleLogin,
                onGoogleLogin: onGoogleLogin,
                onFacebookLogin: onFacebookLogin
            )
        }
    }
}

struct AuthCoordinator_Previews: PreviewProvider {
    @available(iOS 13.0, *)
    static var previews: some View {
        AuthCoordinator(
            onSignIn: { email, password in
                print("Preview SignIn: \(email) / \(password)")
            },
            onSignUp: { name, email, password in
                print("Preview SignUp: \(name), \(email)")
            },
            onAppleLogin: { print("Preview Apple Login") },
            onGoogleLogin: { print("Preview Google Login") },
            onFacebookLogin: { print("Preview Facebook Login") }
        )
        .previewDisplayName("Auth Flow Preview")
    }
}
