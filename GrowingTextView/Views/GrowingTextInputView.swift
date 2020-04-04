import SwiftUI

struct GrowingTextInputView: View {
  init(text: Binding<String?>, placeholder: String?) {
    self._text = text
    self.placeholder = placeholder
  }

  @Binding var text: String?
  @State var focused: Bool = false
  @State var contentHeight: CGFloat = 0

  let placeholder: String?
  let minHeight: CGFloat = 39
  let maxHeight: CGFloat = 150

  var countedHeight: CGFloat {
    min(max(minHeight, contentHeight), maxHeight)
  }

  var body: some View {
    ZStack(alignment: .topLeading) {
      Color.white
      ZStack(alignment: .topLeading) {
        placeholderView
        TextViewWrapper(text: $text, focused: $focused, contentHeight: $contentHeight)
      }.padding(.horizontal, 4)
    }.frame(height: countedHeight)
  }

  var placeholderView: some View {
    ViewBuilder.buildIf(
      showPlaceholder ?
        placeholder.map {
          Text($0)
            .foregroundColor(.gray)
            .font(.system(size: 16))
            .padding(.vertical, 8)
            .padding(.horizontal, 4)
        } : nil
    )
  }

  var showPlaceholder: Bool {
    !focused && text.orEmpty.isEmpty == true
  }
}

private extension Optional where Wrapped == String {
  var orEmpty: String {
    self ?? ""
  }
}

#if DEBUG
struct GrowingTextInputView_Previews: PreviewProvider {
  @State static var text: String?

  static var previews: some View {
    GrowingTextInputView(
      text: $text,
      placeholder: "Placeholder"
    )
  }
}
#endif
