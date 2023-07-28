import SwiftUI

public struct AttributionsStyle {
    
    public enum Structure {
        case inline
        #if os(iOS)
        case stack
        #endif
    }
    
    public let structure: Structure
    
    public init(_ structure: Structure = .inline) {
        self.structure = structure
    }
}

extension AttributionsStyle {
    
    /// One long scrolling view.
    public static let inline = AttributionsStyle(.inline)
    
    #if os(iOS)
    /// To be used in a `NavigationStack`
    public static let stack = AttributionsStyle(.stack)
    #endif
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
    
    public let style: AttributionsStyle
    
    public func body(content: Content) -> some View {
        content.environment(\.attributionsStyle, style)
    }
}

extension View {
    
    public func attributionsStyle(_ style: AttributionsStyle) -> some View {
        self.modifier(AttributionsStyleModifier(style: style))
    }
}
