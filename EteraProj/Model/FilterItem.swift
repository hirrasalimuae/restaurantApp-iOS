//
//  FilterItem.swift
//  EteraProj
//
//  Created by Hirra on 15/12/2025.
//
import Foundation
// MARK: - 1. Data Structure for Filters
struct FilterItem: Identifiable {
    let id = UUID()
    let title: String
    let systemImage: String? // Optional icon name
    let layout: FilterLayout // Defines icon position
    let isSelected: Bool // Property to check if it matches the selected state
    
    // Enum to specify the layout type
    enum FilterLayout {
        case iconOnly       // e.g., Filter
        case iconLeading    // e.g., Sort, Dist.
        case iconTrailing   // e.g., Cuisines, Brunch
    }
}
