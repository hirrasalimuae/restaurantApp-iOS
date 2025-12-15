//
//  RestaurantListView.swift
//  EteraProj
//
//  Created by Hirra on 15/12/2025.
//

import SwiftUI
import MapKit
struct RestaurantsListView: View {
    @ObservedObject var viewModel: RestaurantListViewModel
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 0) { // No spacing in parent
                    Text("Over 300 restaurants")
                        .font(.headline)
                        .foregroundColor(.white).opacity(0.7)
                        .padding(.horizontal)
                        .padding(.top, 10)
                    
                    // Top restaurant
                    if let topRestaurant = viewModel.selectedRestaurant ?? viewModel.restaurants.first {
                        RestaurantCardView(restaurant: topRestaurant)
                            .padding(.top, 10)
                        
                        customSeparator()
                    }
                    
                    // Other restaurants
                    ForEach(Array(viewModel.restaurants.enumerated()), id: \.element.id) { index, restaurant in
                        if restaurant.id != (viewModel.selectedRestaurant?.id ?? viewModel.restaurants.first?.id) {
                            VStack(spacing: 0) {
                                RestaurantCardView(restaurant: restaurant)
                                    .padding(.top, index == 0 ? 0 : 8)
                                
                                // Add separator if not the last item
                                if index != viewModel.restaurants.count - 1 {
                                    customSeparator()
                                }
                            }
                        }
                    }
                    
                    // Extra space at bottom
                    Color.clear
                        .frame(height: 100)
                }
            }
            .simultaneousGesture(
                DragGesture(minimumDistance: 5)
                    .onChanged { value in
                        if viewModel.sheetState == .peeking {
                            let dragDistance = abs(value.translation.height)
                            
                            if value.translation.height < 0 && dragDistance > geometry.size.height / 3 {
                                viewModel.expandSheet()
                            }
                        }
                    }
            )
        }
    }
    
    // Custom separator function
    private func customSeparator() -> some View {
        HStack {
            Rectangle()
                .fill(Color.white.opacity(0.3))
                .frame(height: 0.5)
                .padding(.leading)
            Spacer()
        }
        .padding(.top, 8)
    }
}
