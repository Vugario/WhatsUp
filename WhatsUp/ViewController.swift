//
//  ViewController.swift
//  WhatsUp
//
//  Created by Menno Wolvers on 23/10/14.
//  Copyright (c) 2014 Menno Wolvers. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet var window: NSView!
    @IBOutlet weak var Title: NSTextField!
    @IBOutlet weak var Send: NSButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        window.hidden = true
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

}

