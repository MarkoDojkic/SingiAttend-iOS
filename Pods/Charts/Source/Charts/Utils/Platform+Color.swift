//
//  Platform+Color.swift
//  Charts
//
//  Copyright 2015 Daniel Cohen Gindi & Philipp Jahoda
//  A port of MPAndroidChart for iOS
//  Licensed under Apache License 2.0
//
//  https://github.com/danielgindi/Charts
//

#if canImport(UIKit)
import UIKit

public typealias NSUIColor = UIColor
private func fetchLabelColor() -> UIColor
{
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    if #available(iOS 13, tvOS 13, *)
=======
    /*if #available(iOS 13, tvOS 13, *)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
    if #available(iOS 13, tvOS 13, *)
>>>>>>> a444d9c (Pod updates)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    {
        return .label
    }
    else
    {
        return .black
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    }
=======
    }*/
    return .black
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
    }
>>>>>>> a444d9c (Pod updates)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
}
private let labelColor: UIColor = fetchLabelColor()

extension UIColor
{
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    static var labelOrBlack: UIColor { labelColor }
=======
    static var labelOrBlack: UIColor { return labelColor }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
    static var labelOrBlack: UIColor { labelColor }
>>>>>>> a444d9c (Pod updates)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
}
#endif

#if canImport(AppKit) && !targetEnvironment(macCatalyst)

import AppKit

public typealias NSUIColor = NSColor
private func fetchLabelColor() -> NSColor
{
    if #available(macOS 10.14, *)
    {
        return .labelColor
    }
    else
    {
        return .black
    }
}
private let labelColor: NSColor = fetchLabelColor()

extension NSColor
{
    static var labelOrBlack: NSColor { labelColor }
}
#endif
