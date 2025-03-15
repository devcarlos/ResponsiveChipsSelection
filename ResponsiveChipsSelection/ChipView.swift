import SwiftUI

@ViewBuilder
func ChipView(_ tag: String, isSelected: Bool) -> some View {
    HStack(spacing: 10) {
        Text(tag)
            .font(.callout)
            .foregroundStyle(isSelected ? .white : Color.primary)
        
        if isSelected {
            Image(systemName: "checkmark.circle.fill")
                .foregroundStyle(.white)
        }
    }
    .padding(.horizontal, 12)
    .padding(.vertical, 8)
    .background {
        ZStack {
            Capsule()
                .fill(isSelected ? Color.blue : .gray.opacity(0.3))
        }
    }
}
