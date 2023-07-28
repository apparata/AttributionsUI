import SwiftUI

public struct Attributions: View {
    
    public typealias Entry = (Attribution.Entity, OpenSourceLicense)
    
    private struct EntryType: Identifiable, Hashable {
        
        let entity: Attribution.Entity
        let license: OpenSourceLicense
        
        var id: String {
            return "\(entity)-\(license.id)"
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
        
        static func == (lhs: Attributions.EntryType, rhs: Attributions.EntryType) -> Bool {
            lhs.id == rhs.id
        }
    }
    
    private let entries: [EntryType]
    
    @Environment(\.attributionsStyle) private var style

    public init(_ entries: Entry...) {
        self.entries = entries.map { (entity, license) in
            EntryType(entity: entity, license: license)
        }
    }
    
    public init(_ entries: [Entry]) {
        self.entries = entries.map { (entity, license) in
            EntryType(entity: entity, license: license)
        }
    }
    
    public var body: some View {
        switch style.structure {
        case .inline:
            ScrollView(.vertical) {
                LazyVStack {
                    ForEach(entries) { entry in
                        Attribution(entry.entity, entry.license)
                    }
                }
                .font(.footnote)
                .padding()
            }
            .navigationTitle("Attributions")
        case .stack:
            List(entries) { entry in
                NavigationLink {
                    ScrollView(.vertical) {
                        Attribution(entry.entity, entry.license)
                            .environment(\.attributionsStyle, style)
                            .padding()
                    }
                } label: {
                    Text(entry.entity)
                }
            }
            .navigationTitle("Attributions")
        }
    }
}

#if swift(>=5.9)

#Preview {
    NavigationStack {
        Attributions(
            ("StaplerKit", .mit(year: "2020", holder: "Initech")),
            ("TNTCore", .bsd3Clause(year: "2021", holder: "Acme Inc")),
            ("SoylentGreen", .zlib(year: "2006", holder: "Soylent")),
            ("RoboKit", .apache2(year: "1987-2023", holder: "OCP")))
            .attributionsStyle(.stack)
            .navigationBarTitleDisplayMode(.inline)
    }
}

#endif
