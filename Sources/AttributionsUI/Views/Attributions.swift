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
    
    @Environment(\.attributionsHeader) private var header

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
    
    #if os(iOS)
    public var body: some View {
        switch style.structure {
        case .inline:
            inlineView
        case .stack:
            stackView
        }
    }
    #else
    public var body: some View {
        switch style.structure {
        case .inline:
            inlineView
        }
    }
    #endif
    
    private var inlineView: some View {
        ScrollView(.vertical) {
            LazyVStack {
                if let header {
                    Text(header)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                ForEach(entries) { entry in
                    Attribution(entry.entity, entry.license)
                }
            }
            .font(.footnote)
            .padding()
        }
        .navigationTitle("Attributions")
    }
    
    private var stackView: some View {
        List() {
            Section {
                ForEach(entries) { entry in
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
            } header: {
                if let header {
                    Text(header)
                }
            }
        }
        .navigationTitle("Attributions")
    }
}

#if swift(>=5.9)

#if os(iOS)

#Preview("Stack") {
    NavigationStack {
        Attributions(
            ("StaplerKit", .mit(year: "2020", holder: "Initech")),
            ("TNTCore", .bsd3Clause(year: "2021", holder: "Acme Inc")),
            ("SoylentGreen", .zlib(year: "2006", holder: "Soylent")),
            ("RoboKit", .apache2(year: "1987-2023", holder: "OCP")))
        .attributionsStyle(.stack)
        .attributionsHeader("The following software may be included in this product.")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview("Inline") {
    Attributions(
        ("StaplerKit", .mit(year: "2020", holder: "Initech")),
        ("TNTCore", .bsd3Clause(year: "2021", holder: "Acme Inc")),
        ("SoylentGreen", .zlib(year: "2006", holder: "Soylent")),
        ("RoboKit", .apache2(year: "1987-2023", holder: "OCP")))
        .attributionsStyle(.inline)
        .attributionsHeader("The following software may be included in this product.")
        .navigationBarTitleDisplayMode(.inline)
}

#endif

#if os(macOS)

#Preview("Default (macOS)") {
    Attributions(
        ("StaplerKit", .mit(year: "2020", holder: "Initech")),
        ("TNTCore", .bsd3Clause(year: "2021", holder: "Acme Inc")),
        ("SoylentGreen", .zlib(year: "2006", holder: "Soylent")),
        ("RoboKit", .apache2(year: "1987-2023", holder: "OCP")))
        .attributionsHeader("The following software may be included in this product.")
}

#endif

#endif
