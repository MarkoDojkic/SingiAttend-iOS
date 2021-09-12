//
//  Platform+Accessibility.swift
//  Charts
//
//  Copyright 2015 Daniel Cohen Gindi & Philipp Jahoda
//  A port of MPAndroidChart for iOS
//  Licensed under Apache License 2.0
//
//  https://github.com/danielgindi/Charts
//

import Foundation

#if os(iOS) || os(tvOS)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
import UIKit

internal func accessibilityPostLayoutChangedNotification(withElement element: Any? = nil)
{
    UIAccessibility.post(notification: .layoutChanged, argument: element)
=======
#if canImport(UIKit)
    import UIKit
#endif

internal func accessibilityPostLayoutChangedNotification(withElement element: Any? = nil)
{
    UIAccessibility.post(notification: UIAccessibility.Notification.layoutChanged, argument: element)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
import UIKit

internal func accessibilityPostLayoutChangedNotification(withElement element: Any? = nil)
{
    UIAccessibility.post(notification: .layoutChanged, argument: element)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
}

internal func accessibilityPostScreenChangedNotification(withElement element: Any? = nil)
{
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    UIAccessibility.post(notification: .screenChanged, argument: element)
=======
    UIAccessibility.post(notification: UIAccessibility.Notification.screenChanged, argument: element)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
    UIAccessibility.post(notification: .screenChanged, argument: element)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
}

/// A simple abstraction over UIAccessibilityElement and NSAccessibilityElement.
open class NSUIAccessibilityElement: UIAccessibilityElement
{
    private weak var containerView: UIView?

    final var isHeader: Bool = false
    {
        didSet
        {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            accessibilityTraits = isHeader ? .header : .none
=======
            accessibilityTraits = isHeader ? UIAccessibilityTraits.header : UIAccessibilityTraits.none
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
            accessibilityTraits = isHeader ? .header : .none
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        }
    }

    final var isSelected: Bool = false
        {
        didSet
        {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            accessibilityTraits = isSelected ? .selected : .none
=======
            accessibilityTraits = isSelected ? UIAccessibilityTraits.selected : UIAccessibilityTraits.none
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
            accessibilityTraits = isSelected ? .selected : .none
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        }
    }

    override public init(accessibilityContainer container: Any)
    {
        // We can force unwrap since all chart views are subclasses of UIView
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        containerView = container as? UIView
=======
        containerView = (container as! UIView)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        containerView = container as? UIView
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        super.init(accessibilityContainer: container)
    }

    override open var accessibilityFrame: CGRect
    {
        get
        {
            return super.accessibilityFrame
        }

        set
        {
            guard let containerView = containerView else { return }
            super.accessibilityFrame = containerView.convert(newValue, to: UIScreen.main.coordinateSpace)
        }
    }
}

extension NSUIView
{
    /// An array of accessibilityElements that is used to implement UIAccessibilityContainer internally.
    /// Subclasses **MUST** override this with an array of such elements.
    @objc open func accessibilityChildren() -> [Any]?
    {
        return nil
    }

    public final override var isAccessibilityElement: Bool
    {
        get { return false } // Return false here, so we can make individual elements accessible
        set { }
    }

    open override func accessibilityElementCount() -> Int
    {
        return accessibilityChildren()?.count ?? 0
    }

    open override func accessibilityElement(at index: Int) -> Any?
    {
        return accessibilityChildren()?[index]
    }

    open override func index(ofAccessibilityElement element: Any) -> Int
    {
        guard let axElement = element as? NSUIAccessibilityElement else { return NSNotFound }
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        return (accessibilityChildren() as? [NSUIAccessibilityElement])?.firstIndex(of: axElement) ?? NSNotFound
=======
        return (accessibilityChildren() as? [NSUIAccessibilityElement])?
            .firstIndex(of: axElement) ?? NSNotFound
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        return (accessibilityChildren() as? [NSUIAccessibilityElement])?.firstIndex(of: axElement) ?? NSNotFound
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    }
}

#endif

#if os(OSX)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
import AppKit

=======

#if canImport(AppKit)
import AppKit
#endif
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
import AppKit

>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)

internal func accessibilityPostLayoutChangedNotification(withElement element: Any? = nil)
{
    guard let validElement = element else { return }
    NSAccessibility.post(element: validElement, notification: .layoutChanged)
}

internal func accessibilityPostScreenChangedNotification(withElement element: Any? = nil)
{
    // Placeholder
}

/// A simple abstraction over UIAccessibilityElement and NSAccessibilityElement.
open class NSUIAccessibilityElement: NSAccessibilityElement
{
    private weak var containerView: NSView?

    final var isHeader: Bool = false
    {
        didSet
        {
            setAccessibilityRole(isHeader ? .staticText : .none)
        }
    }

    final var isSelected: Bool = false
    {
        didSet
        {
            setAccessibilitySelected(isSelected)
        }
    }

    open var accessibilityLabel: String
    {
        get
        {
            return accessibilityLabel() ?? ""
        }

        set
        {
            setAccessibilityLabel(newValue)
        }
    }

    open var accessibilityFrame: NSRect
    {
        get
        {
            return accessibilityFrame()
        }

        set
        {
            guard let containerView = containerView else { return }

            let bounds = NSAccessibility.screenRect(fromView: containerView, rect: newValue)

            // This works, but won't auto update if the window is resized or moved.
            // setAccessibilityFrame(bounds)

            // using FrameInParentSpace allows for automatic updating of frame when windows are moved and resized.
            // However, there seems to be a bug right now where using it causes an offset in the frame.
            // This is a slightly hacky workaround that calculates the offset and removes it from frame calculation.
            setAccessibilityFrameInParentSpace(bounds)
            let axFrame = accessibilityFrame()
            let widthOffset = abs(axFrame.origin.x - bounds.origin.x)
            let heightOffset = abs(axFrame.origin.y - bounds.origin.y)
            let rect = NSRect(x: bounds.origin.x - widthOffset,
                              y: bounds.origin.y - heightOffset,
                              width: bounds.width,
                              height: bounds.height)
            setAccessibilityFrameInParentSpace(rect)
        }
    }

    public init(accessibilityContainer container: Any)
    {
        // We can force unwrap since all chart views are subclasses of NSView
        containerView = (container as! NSView)

        super.init()

        setAccessibilityParent(containerView)
        setAccessibilityRole(.row)
    }
}

/// - Note: setAccessibilityRole(.list) is called at init. See Platform.swift.
extension NSUIView: NSAccessibilityGroup
{
    open override func accessibilityLabel() -> String?
    {
        return "Chart View"
    }

    open override func accessibilityRows() -> [Any]?
    {
        return accessibilityChildren()
    }
}

#endif
