@testable import GrowingTextView
import XCTest
import SwiftUI
import SnapshotTesting

class ChatViewTests: XCTestCase {

  override func setUp() {
    super.setUp()

    animationsActive = false
  }

  func testSnapshot() {
    let longMessage = Array(repeating: "very", count: 50).joined(separator: " ")
    let view = ChatView(messages: [
      .init(text: "Message 1"),
      .init(text: "Message 2"),
      .init(text: "Very " + longMessage + " long message 3"),
      .init(text: "Very " + longMessage + " long message 4"),
      .init(text: "Very " + longMessage + " long message 5"),
    ])
    let controller = UIHostingController(rootView: view)
    assertSnapshots(matching: controller, as: [
      "iPhoneSE": .image(on: .iPhoneSe),
      "iPhoneX": .image(on: .iPhoneX)
    ])
  }

}
