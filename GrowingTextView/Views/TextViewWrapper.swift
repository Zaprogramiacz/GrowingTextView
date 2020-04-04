import SwiftUI

struct TextViewWrapper: UIViewRepresentable {
  func makeUIView(context: Context) -> UITextView {
    UITextView()
  }

  func updateUIView(_ uiView: UITextView, context: Context) {}
}

#if DEBUG
struct TextViewWrapper_Previews: PreviewProvider {
  static var previews: some View {
    TextViewWrapper()
  }
}
#endif
