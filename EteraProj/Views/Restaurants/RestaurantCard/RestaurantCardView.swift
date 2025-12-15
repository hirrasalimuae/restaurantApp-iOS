//
//  RestaurantCardView.swift
//  EteraProj
//
//  Created by Hirra on 15/12/2025.
//

import SwiftUI

struct RestaurantCardView: View {
    let restaurant: Restaurant
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Title and Info
            Text(restaurant.name)
                .font(.title3.bold())
                .foregroundColor(.white)
            
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                Text("\(restaurant.rating, specifier: "%.2f")")
                Text("| \(restaurant.cuisine)")
            }
            .font(.subheadline)
            .foregroundColor(.gray)
            HStack {
                Image( "openIcon")
                Text(restaurant.status)
                Text("• \(restaurant.distance)")
            }
            .font(.subheadline)
            .foregroundColor(.gray).padding(.leading, 5)
            // Image Gallery (using a ScrollView)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(restaurant.imageNames, id: \.self) { imageName in
                        // NOTE: You must add these image names to your Assets
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 140, height: 130)
                            .cornerRadius(16)
                            .clipped()
                    }
                }
                .padding(.top, 4)
            }
            
            // Review Snippet (simulated)
            HStack{
                
                Image("GroupIcon")
                
                Text("\"The food and the ambience was amazing\"")
                    .font(.subheadline)
                    .italic()
                    .foregroundColor(.gray)
                    .padding(.top, 4)
            }
            
            HStack(spacing: 16) {
                Button(action: {
                    // Book now action
                }) {
                    Label {
                        Text("Book now")
                            .font(.system(size: 14, weight: .semibold))
                    } icon: {
                        Image("calendarIcon")
                            .font(.system(size: 16))
                                        .frame(width: 20, height: 20)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                }    .foregroundColor(.white)

                .frame(width: 107, height: 35) // Exact width and height
                       .padding(10) // Padding
                       .background(Color.white.opacity(0.1)) // #FFFFFF1A = white with 10% opacity
                       .cornerRadius(50) // Border radius 50px (makes it circular)
                
                Button(action: {
                       // Menu action
                   }) {
                       HStack(spacing: 10) {
                           Image("menuIcon")
                               .resizable()
                               .scaledToFit()
                               .frame(width: 16, height: 16)
                           
                           Text("Menu")
                               .font(.system(size: 14, weight: .semibold))
                       }
                       .frame(width: 80, height: 35)
                       .padding(10)
                       .background(Color.white.opacity(0.1))
                       .cornerRadius(50)
                   }
                   .foregroundColor(.white)
            }
        }
        .padding()
        .background(Color("black101219"))
        .cornerRadius(15)
    }
}
