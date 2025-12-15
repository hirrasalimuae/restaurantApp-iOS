//
//  BottomGrabberView.swift
//  EteraProj
//
//  Created by Hirra on 15/12/2025.
//
import SwiftUI
struct BottomGrabberView: View {
    @State private var isPressed = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                // The Grabber
                Capsule()
                    .fill(Color.glowPurple)
                    .frame(width: 35, height: 3)
                    .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 1)
                    .padding(.top, 20)
                    .padding(.bottom, 10)
                
                // The Text
                Text("Over 300 restaurants")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.bottom, 20)
                // Optional: Add some spacing or additional content
                Spacer().frame(height: 50) // Use remaining space to reach total 60 height
            }
            .frame(width: geometry.size.width, height: 120)
            .background(Color("black101219"))
            .cornerRadius(24)
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
            )
            .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: -4)
            .scaleEffect(isPressed ? 0.98 : 1.0)
            .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isPressed)
        }
        .frame(height: 120)
        .simultaneousGesture(
            TapGesture()
                .onEnded {
                    withAnimation {
                        isPressed = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        withAnimation {
                            isPressed = false
                        }
                    }
                }
        )
    }
}
