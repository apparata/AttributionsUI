import SwiftUI

// swiftlint:disable all

extension OpenSourceLicense {
    
    /// Custom License
    public static func custom(name: String = "Custom License", spdxID: String? = nil, text: String) -> OpenSourceLicense {
        return Self(name: name, spdxID: spdxID, text: text)
    }
}

#if swift(>=5.9)

#Preview {
    ScrollView(.vertical) {
        LazyVStack {
            Attribution("SoylentGreen", .custom(text: "This is a custom license."))
        }
        .font(.footnote)
        .padding()
    }
}

#endif
