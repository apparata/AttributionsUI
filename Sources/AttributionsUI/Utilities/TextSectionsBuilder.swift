import Foundation

@resultBuilder
public struct TextSectionsBuilder {
    
    public static func buildBlock() -> String {
        ""
    }
    
    public static func buildPartialBlock(first: String) -> [String] {
        [first]
    }
    
    public static func buildPartialBlock(first: [String]) -> [String] {
        first
    }
    
    public static func buildPartialBlock(accumulated: [String], next: String) -> [String] {
        accumulated + [next]
    }
    
    public static func buildPartialBlock(accumulated: [String], next: [String]) -> [String] {
        accumulated + next
    }
    
    public static func buildPartialBlock(first: Void) -> [String] {
        []
    }
    
    public static func buildPartialBlock(first: Never) -> [String] {
        //
    }
    
    public static func buildIf(_ String: [String]?) -> [String] {
        String ?? []
    }
    
    public static func buildEither(first: [String]) -> [String] {
        first
    }
    
    public static func buildEither(second: [String]) -> [String] {
        second
    }
    
    public static func buildArray(_ components: [[String]]) -> [String] {
        components.flatMap { $0 }
    }
}
