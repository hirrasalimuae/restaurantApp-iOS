//
//  PersistentBottomSheet.swift
//  EteraProj
//
//  Created by Hirra on 15/12/2025.
//
import SwiftUI
struct PersistentBottomSheet: View {
    @ObservedObject var viewModel: RestaurantListViewModel
    @State private var dragOffset: CGFloat = 0
    @State private var isDraggingBottomGrabber = false
    @State private var showBottomGrabber = false
    
    // Constants for Sheet Heights
    private let expandedHeightRatio: CGFloat = 0.9 // 90% of screen height
    private let peekingHeightRatio: CGFloat = 0.47 // 40% of screen height
    
    // Calculated Height
    private func targetHeight(in fullHeight: CGFloat) -> CGFloat {
        switch viewModel.sheetState {
        case .closed:
            return 0
        case .peeking:
            return fullHeight * peekingHeightRatio
        case .expanded:
            return fullHeight * expandedHeightRatio
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            let fullHeight = geometry.size.height
            let currentTargetHeight = self.targetHeight(in: fullHeight)
            
            ZStack {
                // Main Bottom Sheet - Only show when not closed
                if viewModel.sheetState != .closed {
                    VStack(spacing: 0) {
                        // 1. The Grabber (thicker line)
                        Capsule()
                            .fill(Color.glowPurple)
                            .frame(width: 35, height: 3)
                            .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 1)
                            .padding(.top, 20)
                            .padding(.bottom, 10)
                        
                        RestaurantsListView(viewModel: viewModel)
                            .frame(maxHeight: .infinity) .onTapGesture {
                                if viewModel.sheetState == .peeking {
                                    viewModel.expandSheet()
                                }
                            }
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color("black101219"))
                    .cornerRadius(20)
                    .shadow(radius: 10)
                    .offset(y: fullHeight - currentTargetHeight + dragOffset)
                    .animation(.spring(response: 0.4, dampingFraction: 0.8), value: viewModel.sheetState)
                    .animation(.spring(response: 0.4, dampingFraction: 0.8), value: dragOffset)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                dragOffset = value.translation.height
                                
                                // Prevent dragging beyond fully expanded
                                let maxOffset = -fullHeight * (expandedHeightRatio - peekingHeightRatio)
                                let minOffset = fullHeight * peekingHeightRatio
                                
                                if viewModel.sheetState == .expanded && dragOffset < maxOffset {
                                    dragOffset = maxOffset
                                } else if viewModel.sheetState == .peeking && dragOffset > minOffset {
                                    dragOffset = minOffset
                                }
                            }
                            .onEnded { value in
                                let yChange = value.translation.height
                                let predictedEnd = value.predictedEndTranslation.height
                                
                                // Logic to snap to the next state based on drag
                                if yChange < -50 || predictedEnd < -100 {
                                    // Significant upward drag or fast upward flick
                                    if viewModel.sheetState == .peeking {
                                        viewModel.expandSheet()
                                    }
                                } else if yChange > 50 || predictedEnd > 100 {
                                    // Significant downward drag or fast downward flick
                                    if viewModel.sheetState == .expanded {
                                        viewModel.sheetState = .peeking
                                    } else if viewModel.sheetState == .peeking {
                                        // Close the sheet completely
                                        viewModel.closeSheet()
                                    }
                                }
                                
                                // Reset drag offset with animation
                                withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                                    dragOffset = 0
                                }
                            }
                    )
                }
                
                // Bottom Grabber - Only show when sheet is closed
                if viewModel.sheetState == .closed {
                    VStack {
                        Spacer()
                        
                        BottomGrabberView()
                            .offset(y: dragOffset) // Move with drag
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        isDraggingBottomGrabber = true
                                        dragOffset = value.translation.height
                                        
                                        // Start showing the sheet if we drag upward
                                        if viewModel.sheetState == .closed && dragOffset < -10 {
                                            viewModel.sheetState = .peeking
                                        }
                                    }
                                    .onEnded { value in
                                        let yChange = value.translation.height
                                        let velocity = value.predictedEndTranslation.height
                                        
                                        if yChange < -30 || velocity < -50 {
                                            // Significant upward drag - expand to peeking
                                            viewModel.sheetState = .peeking
                                        }
                                        
                                        // Reset
                                        withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                                            dragOffset = 0
                                            isDraggingBottomGrabber = false
                                        }
                                    }
                            )
                            .padding(.bottom, -10)
                    }
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                    .animation(.spring(response: 0.4, dampingFraction: 0.8), value: viewModel.sheetState == .closed)
                }
            }
        }

        .ignoresSafeArea(.all, edges: .bottom)
        .onChange(of: viewModel.sheetState) { oldState, newState in
            if newState == .expanded {
                withAnimation {
                    isDraggingBottomGrabber = false
                }
            }
        }
    }
}

