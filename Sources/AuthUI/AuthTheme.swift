//
//  AuthTheme.swift
//  AuthUI
//
//  Created by Balaji K S on 22/09/25.
//


import SwiftUI

@available(iOS 13.0, *)
public struct AuthTheme {
    public var primaryColor: Color
    public var secondaryColor: Color
    public var buttonCornerRadius: CGFloat
    
    public init(
        primaryColor: Color = .blue,
        secondaryColor: Color = .gray,
        buttonCornerRadius: CGFloat = 12
    ) {
        self.primaryColor = primaryColor
        self.secondaryColor = secondaryColor
        self.buttonCornerRadius = buttonCornerRadius
    }
}
