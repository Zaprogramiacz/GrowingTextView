import SwiftUI

struct ContentView: View {
  @State var text: String?

  var body: some View {
    ZStack {
      Color.background
        .edgesIgnoringSafeArea(.all)
      VStack {
        GrowingTextInputView(text: $text, placeholder: "Placeholder")
          .cornerRadius(10)
          .padding()
      }
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
