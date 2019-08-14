import LoggingFormatAndPipe
import AEConsole

open class LoggerPipeAEConsole: Pipe {
    public init() {}
    
    /// Pipe our formatting lines to AEConsole
    public func handle(_ formattedLogLine: String) {
        Console.shared.addLogLine(line: formattedLogLine)
    }
}
