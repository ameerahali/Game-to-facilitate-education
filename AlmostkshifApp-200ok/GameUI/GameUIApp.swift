//
//  GameUIApp.swift
//  GameUI
//
//  Created by Roa Moha on 12/05/1444 AH.
//  Copyright © 1444 AH Balaji. All rights reserved.
//

import SwiftUI
@main
struct GameUIApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
//    @StateObject private var firebaseUserManager  = FirebaseUserManager()
    var body: some Scene {
        WindowGroup {
//            onBoardingScreenApp()
            ContentView()
//                .environmentObject(firebaseUserManager)
        }
    }
}
