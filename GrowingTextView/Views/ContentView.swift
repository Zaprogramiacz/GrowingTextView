import SwiftUI

struct ContentView: View {
  @State var text: String?

  var body: some View {
    VStack {
      Text(text ?? "")
      TextViewWrapper(text: $text)
    }
  }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
#endif
