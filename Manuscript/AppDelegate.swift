//
//
//  AppDelegate.swift
//  Manuscript
//
//  Created by Ilias Ennmouri on 07/01/2017.
//  Copyright © 2017 Ilias Ennmouri. All rights reserved.
//

import Cocoa
import Foundation

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var mainMenu: NSMenu!
    @IBOutlet weak var menu: NSMenu!
    @IBOutlet weak var fileMenu: NSMenu!
    @IBOutlet weak var editMenu: NSMenu!
    @IBOutlet weak var helpMenu: NSMenu!
        
    let ud = UserDefaults.standard
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Initialize application
        helpMenu.addItem(NSMenuItem.separator())
        helpMenu.addItem(NSMenuItem(title: "👨🏽‍💻 Support Mail", action: #selector(supportMail), keyEquivalent: ""))
        helpMenu.addItem(NSMenuItem(title: "📰 Press Mail", action: #selector(pressMail), keyEquivalent: ""))
    }
    
    func supportMail() {
        let service = NSSharingService(named: NSSharingServiceNameComposeEmail)!
        let process = ProcessInfo.processInfo
        service.recipients = ["support@manuscript.tools"]
        service.subject = "Support request"
        service.perform(withItems: ["Please don't remove the following lines and write your request below them \n\(process.operatingSystemVersionString)\n\(process.systemUptime)\n ---------->"])
    }
    
    func pressMail() {
        let service = NSSharingService(named: NSSharingServiceNameComposeEmail)!
        service.recipients = ["yourfriends@manuscript.tools"]
        service.perform(withItems: [""])
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

}

