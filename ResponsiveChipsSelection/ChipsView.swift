import SwiftUI

struct ChipsView<Content: View, Tag: Hashable>: View {
    var spacing: CGFloat = 10
    var animation: Animation = .easeInOut(duration: 0.2)
    var tags: [Tag]
    @ViewBuilder var content: (Tag, Bool) -> Content
    var didChangeSelection: ([Tag]) -> ()
    
    // View Properties
    @State private var selectedTags: [Tag] = []
    
    var body: some View {
        VStack {
            NavigationStack {
                VStack {
                    CustomChipLayout(spacing: spacing) {
                        ForEach(tags, id: \.self) { tag in
                            content(tag, selectedTags.contains(tag))
                                .contentShape(.rect)
                                .onTapGesture {
                                    withAnimation(animation) {
                                        if selectedTags.contains(tag) {
                                            selectedTags.removeAll(where: { $0 == tag })
                                        } else {
                                            selectedTags.append(tag)
                                        }
                                    }
                                    
                                    // Callback after update!
                                    didChangeSelection(selectedTags)
                                }
                        }
                    }
                }
                .padding(10)
                .background(.gray.opacity(0.1), in: .rect(cornerRadius: 20))
                .padding(15)
                .navigationTitle("Chips Selection")
            }
        }
    }
}
