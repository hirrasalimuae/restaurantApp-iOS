//
//  FilterBarView.swift
//  EteraProj
//
//  Created by Hirra on 15/12/2025.
//
import SwiftUI



// MARK: - 2. Filter Bar View
struct FilterBarView: View {
    @Binding var searchText: String
    
    // State to track the currently selected filter, initialized to "brunch"
    @State private var selectedFilter: String = "brunch"
    
    // Sample data structured to match the reference image and layout requirements
    private let filterItems: [FilterItem] = [
        FilterItem(title: "Filter", systemImage: "slider.horizontal.3", layout: .iconOnly, isSelected: false),
        FilterItem(title: "Sort", systemImage: "line.3.horizontal.decrease.circle", layout: .iconLeading, isSelected: false),
        FilterItem(title: "Cuisines", systemImage: "chevron.down", layout: .iconTrailing, isSelected: false),
        FilterItem(title: "brunch", systemImage: "chevron.down", layout: .iconTrailing, isSelected: true), // Selected by default
        FilterItem(title: "Dist.", systemImage: "map", layout: .iconLeading, isSelected: false),
        // Adding a hypothetical next item for completeness
        FilterItem(title: "Rating", systemImage: nil, layout: .iconLeading, isSelected: false)
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) { // Reduced spacing for a tighter look
                ForEach(filterItems) { item in
                    FilterButtonView(
                        item: item,
                        selectedFilter: $selectedFilter
                    )
                }
            }
            .padding(.horizontal)
            // Removed padding(.bottom, 8) for a cleaner fit
        }
    }
}

