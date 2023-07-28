import SwiftUI

#if os(macOS)

public struct AttributionsWindow: Scene {

    public static let windowID = "attributions"
        
    public var body: some Scene {
        Window("Attributions", id: Self.windowID) {
            Attributions()
                .frame(minWidth: 500, minHeight: 300)
        }
        .defaultPosition(.center)
        .defaultSize(width: 500, height: 300)
        .windowResizability(.contentMinSize)
        .windowStyle(.hiddenTitleBar)
    }
}

#endif
