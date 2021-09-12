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
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 633fcbd (Pod updates)
    if #available(iOS 13, tvOS 13, *)
=======
    /*if #available(iOS 13, tvOS 13, *)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
    if #available(iOS 13, tvOS 13, *)
>>>>>>> a444d9c (Pod updates)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
    if #available(iOS 13, tvOS 13, *)
>>>>>>> a444d9c (Pod updates)
>>>>>>> 633fcbd (Pod updates)
    {
        return .label
    }
    else
    {
        return .black
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 633fcbd (Pod updates)
    }
=======
    }*/
    return .black
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
    }
>>>>>>> a444d9c (Pod updates)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
    }
>>>>>>> a444d9c (Pod updates)
>>>>>>> 633fcbd (Pod updates)
}
private let labelColor: UIColor = fetchLabelColor()

extension UIColor
{
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 633fcbd (Pod updates)
    static var labelOrBlack: UIColor { labelColor }
=======
    static var labelOrBlack: UIColor { return labelColor }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
    static var labelOrBlack: UIColor { labelColor }
>>>>>>> a444d9c (Pod updates)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
    static var labelOrBlack: UIColor { labelColor }
>>>>>>> a444d9c (Pod updates)
>>>>>>> 633fcbd (Pod updates)
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
