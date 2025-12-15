//
//  RestaurantListViewModel.swift
//  EteraProj
//
//  Created by Hirra on 15/12/2025.
//

import Combine
import MapKit
import SwiftUI
final class RestaurantListViewModel: ObservableObject {
    enum SheetState {
        case closed, peeking, expanded
    }

    @Published var restaurants: [Restaurant] = Restaurant.mock
    @Published var searchText: String = "Indian restaurants"
    @Published var selectedRestaurant: Restaurant?
    @Published var sheetState: SheetState = .closed

    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 25.1968, longitude: 55.2745), // Center on Dubai Mall area
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )

    func selectRestaurant(_ restaurant: Restaurant?) {
        withAnimation(.spring()) {
            selectedRestaurant = restaurant
            // If selecting a pin, move to peeking state. If unselecting, close.
            sheetState = restaurant != nil ? .peeking : .closed
        }
    }
    func closeSheet() {
          sheetState = .closed
          selectedRestaurant = nil
      }
    // Function to handle the initial drag up for the full list
    func expandSheet() {
        withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
            sheetState = .expanded
        }
    }
}
