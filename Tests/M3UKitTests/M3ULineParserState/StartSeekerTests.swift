import XCTest
@testable import M3UKit

class StartSeekerTests: XCTestCase {
    var sut: M3ULineParser.StartSeeker!

    override func setUpWithError() throws {
        self.sut = M3ULineParser.StartSeeker()
    }

    override func tearDownWithError() throws {
        self.sut = nil
    }

    func test_init_setsCorrectValues() throws {
        XCTAssertFalse(self.sut.isAppendable)
        XCTAssertFalse(self.sut.isExtTag)
        XCTAssertFalse(self.sut.isRuntime)
        XCTAssertFalse(self.sut.isEndOfLine)
    }
    
    func test_feed_hash_returnsCorrectState() {
        let state = self.sut.feed("#")
        XCTAssertNotNil(state as? M3ULineParser.ExtTagEndSeeker)
    }
    
    func test_feed_character_returnsCorrectState() {
        let state = self.sut.feed("h")
        XCTAssertNotNil(state as? M3ULineParser.EndOfLineSeeker)
        XCTAssertTrue(state.isAppendable)
        XCTAssertFalse(state.isExtTag)
        XCTAssertFalse(state.isRuntime)
        XCTAssertFalse(state.isEndOfLine)
    }
    
    func test_feed_newLine_returnsCorrectState() {
        let state = self.sut.feed("\n")
        XCTAssertNotNil(state as? M3ULineParser.StartSeeker)
    }


}
