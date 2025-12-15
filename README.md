# restaurantApp-iOS

# 🚀 Summary
Built a SwiftUI restaurant discovery app with interactive map and dynamic bottom sheet. Key achievement: Resolved complex gesture conflicts between map interactions and bottom sheet navigation while maintaining smooth UX.

# 🎯 Key Implementation
MVVM Architecture with reactive state management

Three-state bottom sheet (closed/peeking/expanded) with drag gestures

Custom map annotations with selection highlighting

Gesture conflict resolution using GeometryReader and simultaneousGesture

Dark mode UI with custom glow effects

# 💡 UI/UX Challenge
Issue: Figma design hides map when sheet expands, but this prevents filter interaction with map visible.

My Solution: Keep map visible under expanded sheet so users can:

Apply filters while seeing map updates

Drop sheet down to return to map (vs. needing separate back button)

Maintain spatial context during filtering

Rationale: Better discoverability and reduced friction for map-based exploration vs. forcing context switching between list and map views.

# ⚙️ Technical Highlights
Dynamic Offsets: Pins lift above sheet using GeometryReader calculations

Velocity-based Snapping: Natural sheet movement with momentum detection

State Management: Clean SheetState enum with calculated heights

Performance: Efficient annotation rendering and gesture debouncing

# 📈 Results
Smooth 60fps animations during gesture interactions

Zero gesture conflicts between map taps and sheet drags

Intuitive "drag-to-return" pattern vs. separate back navigation

Maintained Figma design fidelity while improving UX practicality
