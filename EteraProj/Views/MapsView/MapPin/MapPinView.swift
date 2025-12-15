//
//  Untitled.swift
//  EteraProj
//
//  Created by Hirra on 15/12/2025.
//
import SwiftUI
import MapKit
struct MapPinView: View {
    let restaurant: Restaurant
    let isSelected: Bool
    
    var body: some View {
        VStack(spacing: 4) {
              
                Image(restaurant.imageNames.first ?? "placeholder")
                    .resizable()
                    .frame(width: isSelected ? 65 : 50, height: isSelected ?  65 : 50)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(isSelected ? Color.glowPurple : Color.white, lineWidth: 3)  // ← Correct syntax
                    )
                    .shadow(radius: 3)
           
        }
    }
}
