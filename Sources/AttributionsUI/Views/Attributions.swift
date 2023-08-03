import SwiftUI

public struct Attributions: View {
    
    public typealias Entity = String
    
    public typealias Entry = (Entity, OpenSourceLicense)
        
    private let sections: [AttributionSection]
        
    @Environment(\.attributionsHeader) private var header

    public init(_ entries: Entry...) {
        self.sections = entries.flatMap { (entity, license) in
            let textSections: [String]
            if license.description.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                textSections = license.textSections
            } else {
                textSections = [license.description] + license.textSections
            }
            return [
                AttributionSection(type: .entity, text: entity)
            ] + textSections.map { text in
                AttributionSection(type: .paragraph, text: text)
            }
        }
    }
    
    public init(_ entries: [Entry]) {
        self.sections = entries.flatMap { entry in
            [
                AttributionSection(type: .entity, text: entry.0)
            ] + entry.1.textSections.map { text in
                AttributionSection(type: .paragraph, text: text)
            }
        }
    }
    
    public var body: some View {
        ScrollView(.vertical) {
            LazyVStack(alignment: .leading) {
                if let header {
                    Text(header)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                ForEach(sections) { section in
                    switch section.type {
                    case .entity:
                        Text(section.text)
                            .font(.headline)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .lineLimit(nil)
                            .padding(.vertical)
                    case .paragraph:
                        Text(.init(section.text))
                            .multilineTextAlignment(.leading)
                            .lineLimit(nil)
                            .padding(.bottom, 12)
                    }
                }
            }
            .font(.footnote)
            .padding()
        }
        .navigationTitle("Attributions")
    }
    
}

#if swift(>=5.9)

#if os(iOS)

#Preview("Inline") {
    Attributions(
        ("StaplerKit", .mit(year: "2020", holder: "Initech")),
        ("TNTCore", .bsd3Clause(year: "2021", holder: "Acme Inc")),
        ("SoylentGreen", .zlib(year: "2006", holder: "Soylent")),
        ("RoboKit", .apache2(year: "1987-2023", holder: "OCP")))
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
