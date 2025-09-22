//
//  AppleLoginButton.swift
//  AuthUI
//
//  Created by Balaji K S on 22/09/25.
//


import SwiftUI

@available(iOS 13.0.0, *)
public struct AppleLoginButton: View {
    var action: () -> Void
    
    public init(action: @escaping () -> Void) { self.action = action }
    
    public var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: "applelogo")
                Text("Continue with Apple")
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
    }
}

@available(iOS 13.0.0, *)
public struct GoogleLoginButton: View {
    var action: () -> Void
    
    public init(action: @escaping () -> Void) { self.action = action }
    
    public var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: "globe")
                Text("Continue with Google")
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.red.opacity(0.9))
            .foregroundColor(.white)
            .cornerRadius(8)
        }
    }
}

@available(iOS 13.0.0, *)
public struct FacebookLoginButton: View {
    var action: () -> Void
    
    public init(action: @escaping () -> Void) { self.action = action }
    
    public var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: "f.circle.fill")
                Text("Continue with Facebook")
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
    }
}
