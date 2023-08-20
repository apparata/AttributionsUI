
# AttributionsUI

Swift package containing SwiftUI views for conveniently displaying software attribution information.

## License

See the LICENSE file for licensing information.

## Usage

### macOS

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
