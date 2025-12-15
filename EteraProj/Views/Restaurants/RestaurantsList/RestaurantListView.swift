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
                VStack(alignment: .leading, spacing: 10) {
                    Text("Over 300 restaurants")
                        .font(.headline)
                        .foregroundColor(.white).opacity(0.7)
                        .padding(.horizontal)
                    
                    // Top restaurant
                    if let topRestaurant = viewModel.selectedRestaurant ?? viewModel.restaurants.first {
                        RestaurantCardView(restaurant: topRestaurant)
                        
                        // Add separator after top restaurant
                        Divider()
                            .background(Color.white.opacity(0.3))
                            .padding(.horizontal)
                    }
                    
                    // Other restaurants
                    ForEach(Array(viewModel.restaurants.enumerated()), id: \.element.id) { index, restaurant in
                        if restaurant.id != (viewModel.selectedRestaurant?.id ?? viewModel.restaurants.first?.id) {
                            RestaurantCardView(restaurant: restaurant)
                            
                            // Add separator after each except the last one
                            if index != viewModel.restaurants.count - 1 {
                                Divider()
                                    .background(Color.white.opacity(0.3))
                                    .padding(.horizontal)
                            }
                        }
                    }
                    
                    // Extra space at bottom
                    Color.clear
                        .frame(height: 100)
                }
                .padding(.top, 10)
            }
            .frame(height: geometry.size.height) // Fill available height
            .simultaneousGesture(
                DragGesture(minimumDistance: 5)
                    .onChanged { value in
                        if viewModel.sheetState == .peeking {
                            let dragDistance = abs(value.translation.height)
                            
                            // Use the container height instead of screen height
                            if value.translation.height < 0 && dragDistance > geometry.size.height / 3 {
                                viewModel.expandSheet()
                            }
                        }
                    }
            )
        }
    }
}
