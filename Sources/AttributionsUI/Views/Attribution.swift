import SwiftUI

/// A view that presents an attribution as a license text.
public struct Attribution: View {
    
    public typealias Entity = String
    
    /// The entity that is being attributed, e.g. a piece of software.
    public let entity: Entity?
    
    /// The license the attributed entity is used under.
    public let license: OpenSourceLicense
    
    private var text: String
    
    @Environment(\.attributionsStyle) private var style

    /// Initialize attribution view with an entity as header and the license text as body.
    public init(_ entity: Entity, _ license: OpenSourceLicense) {
        self.entity = entity
        self.license = license
        if license.description.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            self.text = "\(license.text)"
        } else {
            self.text = "\(license.description)\n\n\(license.text)"
        }
    }

    /// Initialize attribution view with the license text as body, but no header.
    public init(_ license: OpenSourceLicense) {
        self.entity = nil
        self.license = license
        if license.description.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            self.text = "\(license.text)"
        } else {
            self.text = "\(license.description)\n\n\(license.text)"
        }
    }
    
    public var body: some View {
        if let entity {
            VStack(alignment: .leading) {
                if style.structure == .inline {
                    Text(entity)
                        .font(.headline)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)
                        .padding(.vertical)
                }
                Text(text)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .navigationTitle(style.structure == .inline ? "Attributions" : entity)
        } else {
            VStack(alignment: .leading) {
                Text(text)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#if swift(>=5.9)

#Preview {
    ScrollView(.vertical) {
        LazyVStack {
            Attribution("CustomStuff", .custom(text: "This is a custom license."))
            Attribution("StaplerKit", .mit(year: "2020", holder: "Initech"))
            Attribution("TNTCore", .bsd3Clause(year: "2021", holder: "Acme Inc"))
            Attribution("SoylentGreen", .zlib(year: "2006", holder: "Soylent"))
            Attribution("RoboKit", .apache2(year: "1987-2023", holder: "OCP"))
        }
        .attributionsStyle(.inline)
        .font(.footnote)
        .padding()
    }
}

#endif
