import SwiftUI

var animationsActive = true

struct ChatView: View {
  @State var text: String?
  @State var messages: [Message] = []

  var body: some View {
    ZStack {
      Color.background
        .edgesIgnoringSafeArea(.all)
      VStack(spacing: 0) {
        HStack(alignment: .center) {
          GrowingTextInputView(text: $text, placeholder: "Message")
            .frame(height: 36)
            .cornerRadius(10)
          Button(action: sendAction) {
            Text("Send")
          }
        }.padding()
        Divider()
        ScrollView {
          VStack(alignment: .trailing, spacing: 16) {
            ForEach(messages, id: \.id) {
              self.messageView(text: $0.text)
            }
          }.padding(.top, 16)
          .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
            .animation(animationsActive ? .default : nil)
        }.overlay(
          LinearGradient(
            gradient: .init(stops: [
              .init(color: Color.white.opacity(0.1), location: 0.80),
              .init(color: .white, location: 1.0)
            ]),
            startPoint: .top,
            endPoint: .bottom
          )
        )
          .edgesIgnoringSafeArea(.bottom)
      }
    }
  }

  func sendAction() {
    guard let text = text, !text.isEmpty else { return }
    UIApplication.shared.windows.forEach { $0.endEditing(true)}
    let newMessage = Message(text: text)
    messages.insert(newMessage, at: 0)
    self.text = nil
  }

  func messageView(text: String) -> some View {
    return Text(text)
      .foregroundColor(.white)
      .padding(.all, 12)
      .background(Color.messageBackground)
      .cornerRadius(14)
      .padding(.trailing, 12)
      .padding(.leading, 32)
  }

  struct Message {
    let id = UUID()
    let text: String
  }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ChatView()
  }
}
#endif
