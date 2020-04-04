import SwiftUI

struct TextViewWrapper: UIViewRepresentable {

  init(text: Binding<String?>) {
    self._text = text
  }

  @Binding var text: String?

  func makeUIView(context: Context) -> UITextView {
    let textView = UITextView()
    textView.delegate = context.coordinator
    textView.font = .systemFont(ofSize: 16)
    return textView
  }

  func makeCoordinator() -> Coordinator {
    Coordinator(text: $text)
  }

  func updateUIView(_ uiView: UITextView, context: Context) {}

  class Coordinator: NSObject, UITextViewDelegate {
    init(text: Binding<String?>) {
      self._text = text
    }

    @Binding var text: String?

    func textViewDidChange(_ textView: UITextView) {
      text = textView.text
    }
  }
}

#if DEBUG
struct TextViewWrapper_Previews: PreviewProvider {
  @State static var text: String?

  static var previews: some View {
    TextViewWrapper(text: $text)
  }
}
#endif
