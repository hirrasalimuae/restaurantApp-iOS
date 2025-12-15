//
//  CLLocationCoordinate2D+Equatable.swift
//  EteraProj
//
//  Created by Hirra on 15/12/2025.
//

import MapKit

extension CLLocationCoordinate2D: @retroactive Equatable {
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}
