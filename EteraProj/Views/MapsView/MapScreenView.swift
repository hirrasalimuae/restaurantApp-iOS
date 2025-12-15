//
//  MapPreviewView.swift
//  EteraProj
//
//  Created by Hirra on 15/12/2025.
//


import SwiftUI
import MapKit

struct MapScreenView: View {
    @StateObject private var viewModel = RestaurantListViewModel()
    @State private var mapBottomPadding: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                // 1. Map View with adjusted safe area
                Map(position: .constant(.region(viewModel.region))) {
                    ForEach(viewModel.restaurants) { restaurant in
                        Annotation(restaurant.name, coordinate: restaurant.coordinate) {
                            Button {
                                viewModel.selectRestaurant(restaurant)
                            } label: {
                                MapPinView(restaurant: restaurant,
                                         isSelected: restaurant == viewModel.selectedRestaurant)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .mapStyle(.standard(elevation: .realistic))
                .mapControls {
                    MapUserLocationButton()
                    MapScaleView()
                }
                // Add bottom padding to account for the sheet
                .safeAreaInset(edge: .bottom) {
                    Color.clear.frame(height: mapBottomPadding)
                }
                .ignoresSafeArea()
                
                // 2. Top Filter Bar (always visible)
                VStack {
                    TopBarView(searchText: $viewModel.searchText)
                        .zIndex(1)
                    Spacer()
                }
                
                // 3. Bottom Sheet
                PersistentBottomSheet(viewModel: viewModel)
                    .onAppear {
                        // Adjust map padding based on peeking height
                        updateMapBottomPadding(geometry: geometry)
                    }
                    .onChange(of: viewModel.sheetState) { oldState, newState in
                        updateMapBottomPadding(geometry: geometry)
                    }
            }
            .environment(\.colorScheme, .dark)
        }
    }
    
    private func updateMapBottomPadding(geometry: GeometryProxy) {
        let peekingHeight = geometry.size.height * 0.35 // Your 35% ratio
        
        switch viewModel.sheetState {
        case .closed:
            mapBottomPadding = 0
        case .peeking:
            // Add some extra padding to ensure pins are fully visible
            mapBottomPadding = peekingHeight + 20
        case .expanded:
            mapBottomPadding = geometry.size.height * 0.9 // Your 90% ratio
        }
    }
}

