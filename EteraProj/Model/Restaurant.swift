//
//  Restaurant.swift
//  EteraProj
//
//  Created by Hirra on 15/12/2025.
//
import MapKit

struct Restaurant: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let cuisine: String
    let rating: Double
    let reviewCount: Int
    let distance: String
    let isOpenNow: Bool
    let priceLevel: String
    let location: String
    let area: String
    let status: String
    let review: String?
    let coordinate: CLLocationCoordinate2D
    let imageNames: [String] // for card photos
    
    static var mock: [Restaurant] = [
        Restaurant(
            name: "Nobu",
            cuisine: "Japanese • Dubai Mall",
            rating: 4.9,
            reviewCount: 1208,
            distance: "150 m",
            isOpenNow: true,
            priceLevel: "$$$$",
            location: "Downtown",
            area: "The Dubai Mall",
            status: "Open now • Close 3AM", review: "",
            coordinate: CLLocationCoordinate2D(latitude: 25.1972, longitude: 55.2744),
            imageNames: ["nobu1", "nobu2", "nobu3"]
        ),
        Restaurant(
            name: "Entrecôte Café de Paris - The Dubai Mall",
            cuisine: "African restaurant • Jumeirah",
            rating: 4.87,
            reviewCount: 300,
            distance: "300 m",
            isOpenNow: true,
            priceLevel: "$$$",
            location: "Jumeirah",
            area: "The Dubai Mall",
            status: "Open now • Close 3AM", review: "",

            coordinate: CLLocationCoordinate2D(latitude: 25.1968, longitude: 55.2730),
            imageNames: ["entrecote1", "entrecote2", "entrecote3"]
        ),
        Restaurant(
            name: "Akira Back Dubai",
            cuisine: "Asian • Jumeirah",
            rating: 4.87,
            reviewCount: 200,
            distance: "500 m",
            isOpenNow: false,
            priceLevel: "$$$$",
            location: "Jumeirah",
            area: "The Dubai Mall",
            status: "Open now • Close 3AM", review: "",

            coordinate: CLLocationCoordinate2D(latitude: 25.1960, longitude: 55.2750),
            imageNames: ["akira1", "akira2", "akira3"]
        )
    ]
}

