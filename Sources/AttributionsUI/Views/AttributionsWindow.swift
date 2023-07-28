import SwiftUI

#if os(macOS)

public struct AttributionsWindow: Scene {

    public static let windowID = "attributions"
    
    private let entries: [Attributions.Entry]
    
    public init(_ entries: [Attributions.Entry]) {
        self.entries = entries
    }
        
    public var body: some Scene {
        Window("Attributions", id: Self.windowID) {
            Attributions(entries)
                .frame(minWidth: 500, minHeight: 300)
        }
        .defaultPosition(.center)
        .defaultSize(width: 500, height: 300)
        .windowResizability(.contentMinSize)
        .windowStyle(.hiddenTitleBar)
    }
}

#endif
