import UIKit
import PlaygroundSupport
import SafariServices

let urlString = "https://wikipedia.org/"

let myURL = URL(string: urlString)

let anotherURL = URL(string: "https://apple.com/")!
let viewController = SFSafariViewController(url: anotherURL)

PlaygroundPage.current.liveView = viewController
