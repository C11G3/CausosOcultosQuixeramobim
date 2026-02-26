//
//  iOSConnectivity.swift
//  CausosOcultos
//
//  Created by Francisco Losada on 24/02/26.
//

import WatchConnectivity
internal import Combine

/// iOSConnectivity is responsible for managing communication between iOS and Apple Watch. It uses WCSession to send and receive messages and ensures queued messages are sent once the session is activated.
/// - Parameter shared: Singleton
/// - Parameter session: iOS session enable
/// - Parameter receivedData: Stores latest received data
/// - Parameter isActivated: Tracks session activation
/// - Parameter pendingMessages: Stores messages until session is ready
class iOSConnectivity: NSObject, WCSessionDelegate, ObservableObject {
    
    static var shared : iOSConnectivity = {
        let instance = iOSConnectivity()
        return instance
    }()
    
    public var session = WCSession.default
    @Published var receivedData: [String : Any] = [:]
    
    private var isActivated = false
    private var pendingMessages: [[String : Any]] = []
    
    private override init() {
        super.init()
        if WCSession.isSupported() {
            session.delegate = self
            session.activate()
        }
    }
    
    /// WCSession Delegate
    func session(_ session: WCSession,
                 activationDidCompleteWith activationState: WCSessionActivationState,
                 error: (any Error)?) {
        
        print("WCSession activation complete. State: \(activationState.rawValue), Error: \(String(describing: error))")
        
        switch activationState {
        case .activated:
            print("Session is activated")
            isActivated = true
            
            // Send all queued messages once session is ready
            for message in pendingMessages {
                send(message: message)
            }
            pendingMessages.removeAll()
            
        case .inactive:
            print("Session is inactive")
        case .notActivated:
            print("Session not activated")
        @unknown default:
            print("Unknown activation state")
        }
    }
    
#if os(iOS)
    func sessionDidBecomeInactive(_ session: WCSession) {
        print("Session became inactive")
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        print("Session deactivated. Re-activating...")
        session.activate()
    }
#endif
    
    /// Sends a generic message to the watch after verifying if the connection is stablished
    private func send(message: [String: Any]) {
        if session.isReachable {
            session.sendMessage(message, replyHandler: nil) { error in
                print("Failed to send message: \(error.localizedDescription)")
            }
        } else {
            // Application Context ensures message is delivered later if watch is unreachable
            do {
                try session.updateApplicationContext(message)
                print("Sent via Application Context (watch not reachable)")
            } catch {
                print("Failed to send via Application Context: \(error.localizedDescription)")
            }
        }
    }
    
    /// Sends data to the watch
    func sendToWatch(passData: [String:Any]) {
        if isActivated {
            send(message: passData)
        } else {
            print("⏳ Session not ready. Queuing login status.")
            pendingMessages.append(passData)
        }
    }
    
    /// Message Receiving
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        DispatchQueue.main.async {
            self.receivedData = message
            print("📩 iOS received message: \(message)")
        }
    }
    
    /// Handles ApplicationContext updates from iOS
    func session(_ session: WCSession,
                 didReceiveApplicationContext applicationContext: [String : Any]) {
        DispatchQueue.main.async {
            self.receivedData = applicationContext
            print("Received application context: \(applicationContext)")
        }
    }
}
