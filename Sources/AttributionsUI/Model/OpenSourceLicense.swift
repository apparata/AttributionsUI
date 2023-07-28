import SwiftUI

public struct OpenSourceLicense: Identifiable, CustomStringConvertible {
    
    public var id: String
    
    /// Full name of the license
    public let name: String?
    
    /// Optional SPDX ID
    public let spdxID: String?
    
    /// License text
    public let text: String
    
    public var description: String {
        if let name, let spdxID {
            return "\(name) (\(spdxID))"
        } else if let name {
            return "\(name)"
        } else if let spdxID {
            return "\(spdxID)"
        } else {
            return ""
        }
    }
    
    public init(name: String?, spdxID: String? = nil, text: String) {
        self.name = name
        self.spdxID = spdxID
        self.id = spdxID ?? UUID().uuidString
        self.text = text
    }
}
