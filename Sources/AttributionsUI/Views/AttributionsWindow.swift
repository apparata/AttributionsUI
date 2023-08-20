import SwiftUI

#if os(macOS)

public struct AttributionsWindow: Scene {

    public static let windowID = "attributions"
    
    private let entries: [Attributions.Entry]
    
    private let header: String?
    
    public init(_ entries: [Attributions.Entry], header: String? = nil) {
        self.header = header
        self.entries = entries
    }
    
    public init(_ header: String? = nil, _ entries: Attributions.Entry...) {
        self.header = header
        self.entries = entries
    }
        
    public var body: some Scene {
        Window("Attributions", id: Self.windowID) {
            Attributions(entries)
                .attributionsHeader(header)
                .frame(minWidth: 500, minHeight: 300)
        }
        .commandsRemoved() // Don't show window in Windows menu
        .defaultPosition(.center)
        .defaultSize(width: 500, height: 300)
        .windowResizability(.contentMinSize)
    }
}

#endif
