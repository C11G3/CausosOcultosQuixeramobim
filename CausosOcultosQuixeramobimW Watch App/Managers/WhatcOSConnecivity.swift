//
//  WatchOSConnectivity.swift
//  CausosOcultosWatch Watch App
//
//  Created by Carolina Sun on 23/02/26.
//

import Foundation
import WatchConnectivity
import UserNotifications
internal import Combine

/// watchOSConnectivity manages communication from Watch to iOS using WCSession, while also supporting ApplicationContext and UserInfo transfers.
/// - Parameter receivedData: Var that stores last received data
/// - Parameter receivedNotification: Var Stores last received push notification
/// - Parameter session: Var thar creates the sesison between the iOS and the watchOS
/// - Parameter shared: Singleton
class watchOSConnectivity: NSObject, ObservableObject {
    @Published var receivedData: [String: Any] = [:]         // Stores last received data
    
    private var session: WCSession
    private var isActivated = false
    private var pendingMessages: [[String : Any]] = []
    
    static var shared : watchOSConnectivity = {
        let instance = watchOSConnectivity()
        return instance
    }()
    
    private override init() {
        self.session = WCSession.default
        super.init()
        if WCSession.isSupported() {
            session.delegate = self
            session.activate()
        }
    }
    
    /// Sends key-value data using Application Context (latest state data)
    func sendApplicationContext(data: [String: Any]) {
        do {
            try session.updateApplicationContext(data)
        } catch {
            print("Error updating application context: \(error.localizedDescription)")
        }
    }
    
    /// Sends background transferable data using UserInfo
    func sendUserInfo(data: [String: Any]) {
        session.transferUserInfo(data)
    }
    
    /// Receiving Messages from iOS
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        DispatchQueue.main.async {
            self.receivedData = message
            print("Watch received message: \(message)")
        }
    }
}

// MARK: - WCSessionDelegate
extension watchOSConnectivity: WCSessionDelegate {
    /// Handles session activation state
    func session(_ session: WCSession,
                 activationDidCompleteWith activationState: WCSessionActivationState,
                 error: (any Error)?) {
        switch activationState {
        case .activated:
            print("Watch session activated")
        case .inactive:
            print("Session inactive")
        case .notActivated:
            print("Session not activated")
        @unknown default:
            print("Unknown session state")
        }
    }
    
    ///  Shows if the session became inactive
    func sessionBecomeInactive(_ session: WCSession) {
        print("Session became inactive")
    }
    
    ///  Shows if the session deactivate
    func sessionDeactivate(_ session: WCSession) {
        print("Session deactivated. Re-activating...")
        session.activate()
    }
    
    /// Handles ApplicationContext updates from iOS
    func session(_ session: WCSession,
                 didReceiveApplicationContext applicationContext: [String : Any]) {
        DispatchQueue.main.async {
            self.receivedData = applicationContext
            print("Received application context: \(applicationContext)")
        }
    }
    
    /// Handles UserInfo transfer from iOS
    func session(_ session: WCSession, didReceiveUserInfo userInfo: [String : Any] = [:]) {
        DispatchQueue.main.async {
            self.receivedData = userInfo
            print("Received user info on Watch: \(userInfo)")
        }
    }
    
    /// verifies if the session is rechable and ensures message is delivered later if watch is unreachable
    private func send(message: [String: Any]) {
        if session.isReachable {
            session.sendMessage(message, replyHandler: nil) { error in
                print("Failed to send message: \(error.localizedDescription)")
            }
        }
        else {
            do {
                try session.updateApplicationContext(message)
                print("Sent via Application Context (iOS not reachable)")
            } catch {
                print("Failed to send via Application Context: \(error.localizedDescription)")
            }
        }
    }
    
    /// Sends data to the watch
    func sendToiOS(passData: [String:Any]) {
        if isActivated {
            send(message: passData)
        } else {
            print("Session not ready to iOS. Queuing login status.")
            pendingMessages.append(passData)
        }
    }
}

