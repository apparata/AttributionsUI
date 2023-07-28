import SwiftUI

#if os(macOS)

public struct AttributionsWindow: Scene {

    public static let windowID = "attributions"
    
    private let entries: [Attributions.Entry]
    
    private let header: String?
    
    public init(_ entries: [Attributions.Entry], header: String? = nil) {
        self.entries = entries
        self.header = header
    }
        
    public var body: some Scene {
        Window("Attributions", id: Self.windowID) {
            Attributions(entries)
                .attributionsHeader(header)
                .frame(minWidth: 500, minHeight: 300)
        }
        .defaultPosition(.center)
        .defaultSize(width: 500, height: 300)
        .windowResizability(.contentMinSize)
    }
}

#endif
