import Cocoa
import Automerge
import AutomergeRepo

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    let repo = Repo(sharePolicy: SharePolicy.agreeable)
    let websocket = WebSocketProvider(.init(reconnectOnError: false))

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        Task {
            await repo.addNetworkAdapter(adapter: websocket)
            try await websocket.connect(to: URL(string: "wss://sync.automerge.org/")!)
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }

}

