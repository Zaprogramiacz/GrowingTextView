@testable import GrowingTextView
import XCTest
import SwiftUI
import SnapshotTesting

class GrowingTextInputViewTests: XCTestCase {

  func testInputWithPlaceholderSnapshot() {
    let input = GrowingTextInputView(text: .constant(nil), placeholder: "Placeholder")
    let view = container(view: input)
    let controller = UIHostingController(rootView: view)
    assertSnapshots(matching: controller, as: [
      "iPhoneSE": .image(on: .iPhoneSe),
      "iPhoneX": .image(on: .iPhoneX)
    ])
  }

  func testInputWithTextSnapshot() {
    let input = GrowingTextInputView(text: .constant("Text text text"), placeholder: "Placeholder")
    let view = container(view: input)
    let controller = UIHostingController(rootView: view)
    assertSnapshots(matching: controller, as: [
      "iPhoneSE": .image(on: .iPhoneSe),
      "iPhoneX": .image(on: .iPhoneX)
    ])
  }

  func container<Content: View>(view: Content) -> some View {
    ZStack {
      Color.background
        .edgesIgnoringSafeArea(.all)
      view
        .padding()
    }
  }

}
