
# AttributionsUI

Swift package containing SwiftUI views for conveniently displaying software attribution information.

> Only use this package when you know for sure that the attribution to the software matches its license text exactly. 

## License

See the LICENSE file for AttributionsUI licensing information.

## Supported Licenses

Check the `Sources/AttributionsUI/Licenses` directory for a complete list of the supported licenses. At the time of writing, the following were included:

| Name                 | SPDX ID      | Function                          |
|----------------------|--------------|-----------------------------------|
| Apache License 2.0   | `Apache-2.0` | `.apache2(year:,holder:)`         |
| BSD 0-Clause License | `0BSD`       | `.bsd0Clause(year:,holder:)`      |
| BSD 2-Clause License | `BSD-2`      | `.bsd2Clause(year:,holder:)`      |
| BSD 3-Clause License | `BSD-3`      | `.bsd3Clause(year:,holder:)`      |
| The MIT License      | `MIT`        | `.mit(year:,holder:)`             |
| MIT No Attribution   | `MIT-0`      | `.mitNoAttribution(year:holder:)` |
| zlib License         | `Zlib`       | `.zlib(year:,holder:)`            |
| Custom License       | N/A          | `.custom(text:)`                  |

## Usage

### Attributions View

The `Attributions` view displays the license information in a `ScrollView`.

```swift
struct MyView: View {

    var body: some View {
        Attributions(
            ("SwiftUIToolbox", .mit(year: "2023", holder: "Apparata AB")),
            ("AttributionsUI", .bsd0Clause(year: "2023", holder: "Apparata AB")))
            .attributionsHeader("MyApp uses the following 3rd-party software:")
    }
}
```

### Attributions Window

On macOS you can use an `AttributionsWindow` in a `@SceneBuilder`.

```swift
@main
struct MyMacApp: App {

    var body: some Scene {

        WindowGroup { 
            // ... views go here ...
        }
        
        AttributionsWindow("MyMacApp uses the following third-party software:",
            ("SwiftUIToolbox", .mit(year: "2023", holder: "Apparata AB")),
            ("AttributionsUI", .bsd0Clause(year: "2023", holder: "Apparata AB")))
    }
}
```

The window is opened using the SwiftUI `openWindow` action.

```swift
struct MyView: View {

    @Environment(\.openWindow) private var openWindow
    
    var body: some View {
    
        Button {
            openWindow(AttributionsWindow.windowID)
        } label: {
            Text("Show Attributions")
        }
    }
}
```
