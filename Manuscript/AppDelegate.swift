//
//  AppDelegate.swift
//  Manuscript
//
//  Created by Ilias Ennmouri on 07/01/2017.
//  Copyright © 2017 Ilias Ennmouri. All rights reserved.
//

import Cocoa


@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSTextDelegate, NSTextFieldDelegate {
    
    @IBOutlet weak var mainMenu: NSMenu!
    @IBOutlet weak var menu: NSMenu!
    @IBOutlet weak var fileMenu: NSMenu!
    @IBOutlet weak var editMenu: NSMenu!
    @IBOutlet weak var styleMenu: NSMenu!
    @IBOutlet weak var windowMenu: NSMenu!
    @IBOutlet weak var helpMenu: NSMenu!
    let defaults = UserDefaults.standard
    let documentsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Initialize application
        print("Application did finish launching 🚀")
        styleMenu.addItem(NSMenuItem(title: "Light 💡", action: #selector(noFunction), keyEquivalent: ""))
        styleMenu.addItem(NSMenuItem(title: "Dark 🌚", action: #selector(noFunction), keyEquivalent: ""))
        styleMenu.addItem(NSMenuItem(title: "Emojis 😉", action: #selector(toggleEmojis), keyEquivalent: ""))
    }
    
    func noFunction() {
        print("nothing")
    }
    
    func toggleEmojis() {
        if defaults.string(forKey: "menubarStyle") == "emoji" {
            defaults.set("standard", forKey: "menubarStyle")
            self.fileMenu.title = "File"
            self.editMenu.title = "Edit"
            self.styleMenu.title = "Style"
            self.windowMenu.title = "Window"
            self.helpMenu.title = "Help"
        } else /*if defaults.string(forKey: "menubarStyle") == "emoji"*/ {
            self.defaults.set("emoji", forKey: "menubarStyle")
            self.fileMenu.title = "📄"
            self.editMenu.title = "✍️"
            self.styleMenu.title = "🔥"
            self.windowMenu.title = "🖼"
            self.helpMenu.title = "🤦‍♂️"
        }
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

