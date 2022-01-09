extension M3ULineParser {
    /// The end of M3U playlist line.
    ///
    /// More info see [M3U](https://en.wikipedia.org/wiki/M3U).
    struct EndOfLineState: M3ULineParserState {
        let isAppendable = false
        let isExtTag: Bool
        let isRuntime = false
        let isEndOfLine = true
        
        func feed(_ char: Character) -> M3ULineParserState { self }
        
        
    }
    
    
}
