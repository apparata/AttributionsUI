import Foundation

struct AttributionSection: Identifiable, Hashable {
    
    enum SectionType {
    case entity
    case paragraph
    }
    
    let id = UUID()
    
    let type: SectionType
    
    let text: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}
