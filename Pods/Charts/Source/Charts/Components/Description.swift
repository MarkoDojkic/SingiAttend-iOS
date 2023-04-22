//
//  Description.swift
//  Charts
//
//  Copyright 2015 Daniel Cohen Gindi & Philipp Jahoda
//  A port of MPAndroidChart for iOS
//  Licensed under Apache License 2.0
//
//  https://github.com/danielgindi/Charts
//

import Foundation
import CoreGraphics

#if canImport(UIKit)
    import UIKit
#endif

#if canImport(Cocoa)
import Cocoa
#endif

@objc(ChartDescription)
open class Description: ComponentBase
{
    public override init()
    {
        #if os(tvOS)
        // 23 is the smallest recommended font size on the TV
        font = .systemFont(ofSize: 23)
        #elseif os(OSX)
        font = .systemFont(ofSize: NSUIFont.systemFontSize)
        #else
        font = .systemFont(ofSize: 8.0)
        #endif
        
        super.init()
    }
    
    /// The text to be shown as the description.
    @objc open var text: String?
    
    /// Custom position for the description text in pixels on the screen.
    open var position: CGPoint? = nil
    
    /// The text alignment of the description text. Default RIGHT.
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    @objc open var textAlign: TextAlignment = TextAlignment.right
=======
    @objc open var textAlign: NSTextAlignment = NSTextAlignment.right
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
    @objc open var textAlign: TextAlignment = TextAlignment.right
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
    @objc open var textAlign: TextAlignment = TextAlignment.right
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    
    /// Font object used for drawing the description text.
    @objc open var font: NSUIFont
    
    /// Text color used for drawing the description text
    @objc open var textColor = NSUIColor.labelOrBlack
}
