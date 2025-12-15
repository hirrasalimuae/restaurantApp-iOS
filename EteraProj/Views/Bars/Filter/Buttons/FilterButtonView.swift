//
//  FilterButtonView.swift
//  EteraProj
//
//  Created by Hirra on 15/12/2025.
//

import SwiftUI
struct FilterButtonView: View {
    let item: FilterItem
    @Binding var selectedFilter: String
    
    // Determine the background color based on selection and filter type
    var backgroundColor: Color {
        if item.title.lowercased() == selectedFilter.lowercased() {
            // Dark purple for selected filter
            return Color.purple362C6A
        } else if item.title.lowercased() == "filter" {
            // Dark background with a slight opacity for the "Filter" icon
            return Color.white.opacity(0.15)
        } else {
            // Darker gray for unselected text filters
            return Color.white.opacity(0.25)
        }
    }
    
    var foregroundColor: Color {
        // Gray for the "Filter" icon, white for everything else
        item.title.lowercased() == "filter" ? Color.gray : Color.white
    }
    
    var body: some View {
        HStack(spacing: item.layout == .iconOnly ? 0 : 6) {
            // Conditional rendering for Icon Leading or Icon Only
            if item.layout == .iconLeading || item.layout == .iconOnly {
                if let imageName = item.systemImage {
                    Image(systemName: imageName)
                        .foregroundColor(foregroundColor)
                        .font(item.layout == .iconOnly ? .title2 : .subheadline.bold()) // Larger icon for iconOnly
                }
            }
            
            // Text (Not rendered for iconOnly)
            if item.layout != .iconOnly {
                Text(item.title)
                    .font(.subheadline.bold())
                    .foregroundColor(foregroundColor)
            }
            
            // Conditional rendering for Icon Trailing
            if item.layout == .iconTrailing {
                if let imageName = item.systemImage {
                    Image(systemName: imageName)
                        .foregroundColor(foregroundColor)
                        .font(.subheadline.bold())
                }
            }
        }
        .padding(.horizontal, item.layout == .iconOnly ? 10 : 16)
        .padding(.vertical, item.layout == .iconOnly ? 10 : 8)
        .background(
            Capsule()
                .fill(backgroundColor)
        )
        // Add border only for the "Filter" icon button if needed, matching your original code logic.
        // .overlay(
        //     item.title.lowercased() == "filter" ? Capsule().stroke(Color.gray.opacity(0.6), lineWidth: 1) : nil
        // )
        .onTapGesture {
            withAnimation(.spring()) {
                selectedFilter = item.title
            }
        }
    }
}



