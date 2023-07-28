import SwiftUI

public struct AttributionsStyle {
    
    public enum Structure {
        case inline
        case stack
    }
    
    public let structure: Structure
    
    public init(_ structure: Structure = .inline) {
        self.structure = structure
    }
}

extension AttributionsStyle {
    
    /// One long scrolling view.
    public static let inline = AttributionsStyle(.inline)
    
    /// To be used in a `NavigationStack`
    public static let stack = AttributionsStyle(.stack)
}

public struct AttributionsStyleKey: EnvironmentKey {
    
    public static let defaultValue = AttributionsStyle()
}

extension EnvironmentValues {
    
    public var attributionsStyle: AttributionsStyle {
        get {
            return self[AttributionsStyleKey.self]
        }
        set {
            self[AttributionsStyleKey.self] = newValue
        }
    }
}

public struct AttributionsStyleModifier: ViewModifier {
    
    public let value: AttributionsStyle
    
    public func body(content: Content) -> some View {
        content.environment(\.attributionsStyle, value)
    }
}

extension View {
    
    public func attributionsStyle(_ value: AttributionsStyle) -> some View {
        self.modifier(AttributionsStyleModifier(value: value))
    }
}
