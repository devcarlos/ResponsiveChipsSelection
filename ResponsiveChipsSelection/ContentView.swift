import SwiftUI

/// Sample Data
let tags: [String] = ["iOS 14", "SwiftUI", "macOS", "watchOS", "tvOS", "Xcode", "macCatalyst", "UIKit", 
                       "AppKit", "Cocoa", "Objective-C"]

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                ChipsView(tags: tags) { tag, isSelected in
                    ChipView(tag, isSelected: isSelected)
                } didChangeSelection: { selection in
                    print(selection)
                }
                .padding(10)
                .background(.gray.opacity(0.2), in: .rect(cornerRadius: 20))
            }
            .padding(15)
            .navigationBarTitle("ChipsView")
        }
    }
}

#Preview {
    ContentView()
}
