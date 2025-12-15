//
//  TopBarView.swift
//  EteraProj
//
//  Created by Hirra on 15/12/2025.
//
import SwiftUI

struct TopBarView: View {
    @Binding var searchText: String
    
    var body: some View {
        VStack(spacing: 8) {
            HStack(spacing: 12) {
                Image("back")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .padding(.leading, 15)
                
                HStack(spacing: 8) {
                    Image("magnifyingglass")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.gray)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        TextField("Search", text: $searchText)
                            .foregroundColor(.white)
                            .font(.system(size: 16))
                        
                        Text("London - United Kingdom")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .frame(height: 32)
                }
                .frame(height: 48)
                .padding(.horizontal, 16)
                // Add the custom styling for the neon/inset effect
                                .background(
                                    // 1. The dark background of the search bar
                                    Color(white: 0.1, opacity: 1.0) // A slightly lighter black for the search bar background
                                        .cornerRadius(24) // Half of the height (48) for a pill shape
                                )
                                .overlay(
                                    // 2. The glowing border effect (simulated inner/outer glow)
                                    RoundedRectangle(cornerRadius: 24)
                                        .stroke(Color.glowPurple.opacity(0.3), lineWidth: 0) // A light inner border
                                )
                                // 3. The main shadow to create the glow
                                .shadow(color: Color.glowPurple.opacity(0.6), radius: 3, x:0, y: 3)
                
                                .padding(.trailing, 16) // Added a trailing padding for the search bar
            }
            
            FilterBarView(searchText: $searchText).padding([.top, .bottom], 10)
        }           

        .background(
            Color.black
                .ignoresSafeArea(edges: .top)
        )
    }
}
