import Cocoa
import Foundation

enum CopycatError: Error, CustomStringConvertible {
    case noInput
    case unreadableFile(String)
    case unsupportedImage(String)
    case clipboardWriteFailed

    var description: String {
        switch self {
        case .noInput:
            return "Error: no input provided.\nUsage: copycat <file> or pipe data to copycat"
        case .unreadableFile(let path):
            return "Error: could not read file '\(path)'"
        case .unsupportedImage(let path):
            return "Error: could not load image '\(path)'"
        case .clipboardWriteFailed:
            return "Error: failed to write to clipboard"
        }
    }
}

let version = "0.1.0"
let imageExtensions = Set(["png", "jpg", "jpeg", "gif", "bmp", "tiff", "tif", "webp"])

func copyText(_ text: String) throws {
    let pasteboard = NSPasteboard.general
    pasteboard.clearContents()
    guard pasteboard.setString(text, forType: .string) else {
        throw CopycatError.clipboardWriteFailed
    }
}

func copyImage(from path: String) throws {
    guard let image = NSImage(contentsOfFile: path) else {
        throw CopycatError.unsupportedImage(path)
    }
    let pasteboard = NSPasteboard.general
    pasteboard.clearContents()
    guard pasteboard.writeObjects([image]) else {
        throw CopycatError.clipboardWriteFailed
    }
}

func copyFile(from path: String) throws {
    let ext = (path as NSString).pathExtension.lowercased()

    if imageExtensions.contains(ext) {
        try copyImage(from: path)
        return
    }

    guard FileManager.default.fileExists(atPath: path) else {
        throw CopycatError.unreadableFile(path)
    }

    guard let text = try? String(contentsOfFile: path, encoding: .utf8) else {
        throw CopycatError.unreadableFile(path)
    }

    try copyText(text)
}

func copyFromStdin() throws {
    let data = FileHandle.standardInput.readDataToEndOfFile()

    if let text = String(data: data, encoding: .utf8) {
        try copyText(text)
    } else {
        throw CopycatError.unreadableFile("stdin")
    }
}

func run() throws {
    let arguments = Array(CommandLine.arguments.dropFirst())

    if arguments.first == "--version" || arguments.first == "-v" {
        print(version)
        return
    }

    if let path = arguments.first {
        try copyFile(from: path)
    } else {
        try copyFromStdin()
    }
}

do {
    try run()
} catch let error as CopycatError {
    FileHandle.standardError.write(Data(error.description.utf8))
    FileHandle.standardError.write(Data("\n".utf8))
    exit(1)
} catch {
    FileHandle.standardError.write(Data("Error: \(error.localizedDescription)\n".utf8))
    exit(1)
}
