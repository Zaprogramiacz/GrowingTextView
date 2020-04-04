import SwiftUI

struct TextViewWrapper: UIViewRepresentable {

  init(text: Binding<String?>, focused: Binding<Bool>) {
    self._text = text
    self._focused = focused
  }

  @Binding var text: String?
  @Binding var focused: Bool

  func makeUIView(context: Context) -> UITextView {
    let textView = UITextView()
    textView.delegate = context.coordinator
    textView.font = .systemFont(ofSize: 16)
    textView.backgroundColor = .clear
    return textView
  }

  func makeCoordinator() -> Coordinator {
    Coordinator(text: $text, focused: $focused)
  }

  func updateUIView(_ uiView: UITextView, context: Context) {
    uiView.text = text
  }

  class Coordinator: NSObject, UITextViewDelegate {
    init(text: Binding<String?>, focused: Binding<Bool>) {
      self._text = text
      self._focused = focused
    }

    @Binding var text: String?
    @Binding var focused: Bool

    func textViewDidChange(_ textView: UITextView) {
      text = textView.text
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
      focused = true
    }

    func textViewDidEndEditing(_ textView: UITextView) {
      focused = false
    }
  }
}

#if DEBUG
struct TextViewWrapper_Previews: PreviewProvider {
  @State static var text: String?

  static var previews: some View {
    TextViewWrapper(text: $text, focused: .constant(false))
  }
}
#endif
