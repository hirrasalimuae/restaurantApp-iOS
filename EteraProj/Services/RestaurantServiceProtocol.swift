//
//  RestaurantServiceProtocol.swift
//  EteraProj
//
//  Created by Hirra on 15/12/2025.
//

import Combine
import Foundation

protocol RestaurantServiceProtocol {
    func searchRestaurants(query: String) -> AnyPublisher<[Restaurant], Never>
}
