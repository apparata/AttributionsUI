import SwiftUI

public struct AttributionsHeaderKey: EnvironmentKey {
    
    public static let defaultValue: String? = nil
}

extension EnvironmentValues {
    
    public var attributionsHeader: String? {
        get {
            return self[AttributionsHeaderKey.self]
        }
        set {
            self[AttributionsHeaderKey.self] = newValue
        }
    }
}

public struct AttributionsHeaderModifier: ViewModifier {
    
    public let text: String?
    
    public func body(content: Content) -> some View {
        content.environment(\.attributionsHeader, text)
    }
}

extension View {
    
    public func attributionsHeader(_ text: String?) -> some View {
        self.modifier(AttributionsHeaderModifier(text: text))
    }
}
