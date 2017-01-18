//
//  ViewController.swift
//  Manuscript
//
//  Created by Ilias Ennmouri on 07/01/2017.
//  Copyright © 2017 Ilias Ennmouri. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet var textView: NSView!
    var win: NSWindow!
    var document: Document!
    var allText = NSAttributedString()
    var textField = NSTextField(frame: NSMakeRect(20,20,410,260))
         override func viewWillAppear() {
            view.addSubview(textField)
            win = self.view.window!
            _ = self.view.window?.windowController
            self.view.wantsLayer = true
            win.titlebarAppearsTransparent = true
            win.isMovableByWindowBackground = true
            win.titleVisibility = NSWindowTitleVisibility.hidden
            win.backgroundColor = C.editorBackground
            view.layer?.cornerRadius = 10.0
            textField.isEditable = true
            textField.placeholderString = "“If there's a book that you want to read, but it hasn't been written yet, then you must write it.” 💭"
            textField.focusRingType = .none
            win.isOpaque = false
            let appearance = UserDefaults.standard.string(forKey: "AppleInterfaceStyle") ?? "Light"
            if appearance == "Dark" {
                setDarkMode()
            } else {
                setLightMode()
            }
        }
    
    func setLightMode() {
        win.backgroundColor = C.editorBackground
        textField.backgroundColor = C.editorBackground
    }
    
    func setDarkMode() {
        win.becomeMain()
        win.backgroundColor = C.colorDark
        textField.backgroundColor = C.colorDark
        textField.textColor = C.colorLight
        textField.placeholderAttributedString = NSAttributedString(string: "I have a dream... 🔦", attributes: [NSForegroundColorAttributeName: C.colorLight]) 
    }
    
        override func viewDidAppear() {
        }
 
        override func viewDidLoad() {
            super.viewDidLoad()
            textField.becomeFirstResponder()
        }
    
        
}

