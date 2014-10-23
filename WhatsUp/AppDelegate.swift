//
//  AppDelegate.swift
//  WhatsUp
//
//  Created by Menno Wolvers on 23/10/14.
//  Copyright (c) 2014 Menno Wolvers. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSUserNotificationCenterDelegate
{
    var center: NSUserNotificationCenter = NSUserNotificationCenter.defaultUserNotificationCenter()
    
    var window: NSWindow!
    var statusBar = NSStatusBar.systemStatusBar()
    var statusBarItem : NSStatusItem = NSStatusItem()
    var menu: NSMenu = NSMenu()
    var menuItem : NSMenuItem = NSMenuItem()


    override func awakeFromNib()
    {
        // Notification center reports to me
        self.center.delegate = self
        
        //Add statusBarItem
        statusBarItem = statusBar.statusItemWithLength(-1)
        statusBarItem.menu = menu
        statusBarItem.title = "Sup"
        
        //Add menuItem to menu
        menuItem.title = "Ask me."
        menuItem.action = Selector("sendNotification:")
        menuItem.keyEquivalent = ""
        
        menu.addItem(menuItem)
    }
    
    func applicationDidFinishLaunching(aNotification: NSNotification?)
    {
        // Hide the window
        self.window!.orderOut(self)
    }
    
    func sendNotification(sender: AnyObject)
    {
        println("Sending a notification")
        
        let notification: NSUserNotification = NSUserNotification()
        
        notification.title = "Whats up?"
        notification.informativeText = "Describe what you are currently working on."
        notification.soundName = NSUserNotificationDefaultSoundName
        
        notification.responsePlaceholder = "Nothing much."
        notification.hasReplyButton = true
        
        self.center.deliverNotification(notification)
    }
    
    func setWindowVisible(sender: AnyObject)
    {
        println("Clicked!")
    }
    
    func userNotificationCenter(center: NSUserNotificationCenter, didActivateNotification notification: NSUserNotification)
    {
        println("Function called")
        
        if (notification.activationType == NSUserNotificationActivationType.Replied)
        {
            println(notification.response!.string)
        }
    }
}

