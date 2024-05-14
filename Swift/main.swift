import Foundation

let content = "Hello, TEST"

do {
    try content.write(toFile: "test.txt", atomically: true, encoding: .utf8)
    print("File created successfully")
} catch {
    print("Error creating file: \(error)")
}
