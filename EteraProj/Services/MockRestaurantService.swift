//
//  MockRestaurantService.swift
//  EteraProj
//
//  Created by Hirra on 15/12/2025.
//

import Combine
import Foundation

final class MockRestaurantService: RestaurantServiceProtocol {
    func searchRestaurants(query: String) -> AnyPublisher<[Restaurant], Never> {
        // Simulate network delay
        Just(Restaurant.mock)
            .delay(for: .seconds(0.6), scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
