//
//  Utils.swift
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

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
#if canImport(UIKit)
    import UIKit
#endif

#if canImport(Cocoa)
import Cocoa
#endif

>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
extension Comparable
{
    func clamped(to range: ClosedRange<Self>) -> Self
    {
        if self > range.upperBound
        {
            return range.upperBound
        }
        else if self < range.lowerBound
        {
            return range.lowerBound
        }
        else
        {
            return self
        }
    }
}

extension FloatingPoint
{
    var DEG2RAD: Self
    {
        return self * .pi / 180
    }

    var RAD2DEG: Self
    {
        return self * 180 / .pi
    }

    /// - Note: Value must be in degrees
    /// - Returns: An angle between 0.0 < 360.0 (not less than zero, less than 360)
    var normalizedAngle: Self
    {
        let angle = truncatingRemainder(dividingBy: 360)
        return (sign == .minus) ? angle + 360 : angle
    }
}

extension CGSize
{
    func rotatedBy(degrees: CGFloat) -> CGSize
    {
        let radians = degrees.DEG2RAD
        return rotatedBy(radians: radians)
    }

    func rotatedBy(radians: CGFloat) -> CGSize
    {
        return CGSize(
            width: abs(width * cos(radians)) + abs(height * sin(radians)),
            height: abs(width * sin(radians)) + abs(height * cos(radians))
        )
    }
}

extension Double
{
    /// Rounds the number to the nearest multiple of it's order of magnitude, rounding away from zero if halfway.
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    func roundedToNextSignificant() -> Double
=======
    func roundedToNextSignficant() -> Double
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
    func roundedToNextSignificant() -> Double
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    {
        guard
            !isInfinite,
            !isNaN,
            self != 0
            else { return self }

        let d = ceil(log10(self < 0 ? -self : self))
        let pw = 1 - Int(d)
        let magnitude = pow(10.0, Double(pw))
        let shifted = (self * magnitude).rounded()
        return shifted / magnitude
    }

    var decimalPlaces: Int
    {
        guard
            !isNaN,
            !isInfinite,
            self != 0.0
            else { return 0 }

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        let i = roundedToNextSignificant()
=======
        let i = self.roundedToNextSignficant()
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        let i = roundedToNextSignificant()
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)

        guard
            !i.isInfinite,
            !i.isNaN
            else { return 0 }

        return Int(ceil(-log10(i))) + 2
    }
}

extension CGPoint
{
    /// Calculates the position around a center point, depending on the distance from the center, and the angle of the position around the center.
    func moving(distance: CGFloat, atAngle angle: CGFloat) -> CGPoint
    {
        return CGPoint(x: x + distance * cos(angle.DEG2RAD),
                       y: y + distance * sin(angle.DEG2RAD))
    }
}

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
extension CGContext
{

    public func drawImage(_ image: NSUIImage, atCenter center: CGPoint, size: CGSize)
    {
        var drawOffset = CGPoint()
        drawOffset.x = center.x - (size.width / 2)
        drawOffset.y = center.y - (size.height / 2)

        NSUIGraphicsPushContext(self)

        if image.size.width != size.width && image.size.height != size.height
        {
            let key = "resized_\(size.width)_\(size.height)"

=======
open class ChartUtils
<<<<<<< HEAD
=======
extension CGContext
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
{

    public func drawImage(_ image: NSUIImage, atCenter center: CGPoint, size: CGSize)
    {
        var drawOffset = CGPoint()
        drawOffset.x = center.x - (size.width / 2)
        drawOffset.y = center.y - (size.height / 2)

        NSUIGraphicsPushContext(self)

        if image.size.width != size.width && image.size.height != size.height
        {
            let key = "resized_\(size.width)_\(size.height)"
<<<<<<< HEAD
            
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======

>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
{
    private static var _defaultValueFormatter: IValueFormatter = ChartUtils.generateDefaultValueFormatter()
    
    open class func drawImage(
        context: CGContext,
        image: NSUIImage,
        x: CGFloat,
        y: CGFloat,
        size: CGSize)
    {
        var drawOffset = CGPoint()
        drawOffset.x = x - (size.width / 2)
        drawOffset.y = y - (size.height / 2)
        
        NSUIGraphicsPushContext(context)
        
        if image.size.width != size.width && image.size.height != size.height
        {
            let key = "resized_\(size.width)_\(size.height)"
            
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
>>>>>>> e716a0e (Initial commit - transfer from other project)
            // Try to take scaled image from cache of this image
            var scaledImage = objc_getAssociatedObject(image, key) as? NSUIImage
            if scaledImage == nil
            {
                // Scale the image
                NSUIGraphicsBeginImageContextWithOptions(size, false, 0.0)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)

                image.draw(in: CGRect(origin: .zero, size: size))

                scaledImage = NSUIGraphicsGetImageFromCurrentImageContext()
                NSUIGraphicsEndImageContext()

                // Put the scaled image in a cache owned by the original image
                objc_setAssociatedObject(image, key, scaledImage, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }

=======
                
                image.draw(in: CGRect(origin: CGPoint(x: 0, y: 0), size: size))
                
<<<<<<< HEAD
=======

                image.draw(in: CGRect(origin: .zero, size: size))

>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
                scaledImage = NSUIGraphicsGetImageFromCurrentImageContext()
                NSUIGraphicsEndImageContext()

                // Put the scaled image in a cache owned by the original image
                objc_setAssociatedObject(image, key, scaledImage, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
<<<<<<< HEAD
            
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======

>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
                scaledImage = NSUIGraphicsGetImageFromCurrentImageContext()
                NSUIGraphicsEndImageContext()
                
                // Put the scaled image in a cache owned by the original image
                objc_setAssociatedObject(image, key, scaledImage, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
            
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
>>>>>>> e716a0e (Initial commit - transfer from other project)
            scaledImage?.draw(in: CGRect(origin: drawOffset, size: size))
        }
        else
        {
            image.draw(in: CGRect(origin: drawOffset, size: size))
        }
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)

        NSUIGraphicsPopContext()
    }

    public func drawText(_ text: String, at point: CGPoint, align: TextAlignment, anchor: CGPoint = CGPoint(x: 0.5, y: 0.5), angleRadians: CGFloat = 0.0, attributes: [NSAttributedString.Key : Any]?)
    {
        let drawPoint = getDrawPoint(text: text, point: point, align: align, attributes: attributes)
        
        if (angleRadians == 0.0)
        {
            NSUIGraphicsPushContext(self)
            
            (text as NSString).draw(at: drawPoint, withAttributes: attributes)
            
            NSUIGraphicsPopContext()
        }
        else
        {
            drawText(text, at: drawPoint, anchor: anchor, angleRadians: angleRadians, attributes: attributes)
        }
    }
    
    public func drawText(_ text: String, at point: CGPoint, anchor: CGPoint = CGPoint(x: 0.5, y: 0.5), angleRadians: CGFloat, attributes: [NSAttributedString.Key : Any]?)
    {
        var drawOffset = CGPoint()

        NSUIGraphicsPushContext(self)

        if angleRadians != 0.0
        {
            let size = text.size(withAttributes: attributes)

            // Move the text drawing rect in a way that it always rotates around its center
            drawOffset.x = -size.width * 0.5
            drawOffset.y = -size.height * 0.5

            var translate = point

            // Move the "outer" rect relative to the anchor, assuming its centered
            if anchor.x != 0.5 || anchor.y != 0.5
            {
                let rotatedSize = size.rotatedBy(radians: angleRadians)

                translate.x -= rotatedSize.width * (anchor.x - 0.5)
                translate.y -= rotatedSize.height * (anchor.y - 0.5)
            }

            saveGState()
            translateBy(x: translate.x, y: translate.y)
            rotate(by: angleRadians)

            (text as NSString).draw(at: drawOffset, withAttributes: attributes)

            restoreGState()
        }
        else
        {
            if anchor.x != 0.0 || anchor.y != 0.0
            {
                let size = text.size(withAttributes: attributes)

                drawOffset.x = -size.width * anchor.x
                drawOffset.y = -size.height * anchor.y
            }

            drawOffset.x += point.x
            drawOffset.y += point.y

            (text as NSString).draw(at: drawOffset, withAttributes: attributes)
        }

        NSUIGraphicsPopContext()
    }

    private func getDrawPoint(text: String, point: CGPoint, align: TextAlignment, attributes: [NSAttributedString.Key : Any]?) -> CGPoint
=======
        
<<<<<<< HEAD
=======

>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
        NSUIGraphicsPopContext()
    }

    public func drawText(_ text: String, at point: CGPoint, align: TextAlignment, anchor: CGPoint = CGPoint(x: 0.5, y: 0.5), angleRadians: CGFloat = 0.0, attributes: [NSAttributedString.Key : Any]?)
    {
        let drawPoint = getDrawPoint(text: text, point: point, align: align, attributes: attributes)
        
        if (angleRadians == 0.0)
        {
            NSUIGraphicsPushContext(self)
            
            (text as NSString).draw(at: drawPoint, withAttributes: attributes)
            
            NSUIGraphicsPopContext()
        }
        else
        {
            drawText(text, at: drawPoint, anchor: anchor, angleRadians: angleRadians, attributes: attributes)
        }
    }
    
<<<<<<< HEAD
    open class func drawText(context: CGContext, text: String, point: CGPoint, align: NSTextAlignment, attributes: [NSAttributedString.Key : Any]?)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
    public func drawText(_ text: String, at point: CGPoint, anchor: CGPoint = CGPoint(x: 0.5, y: 0.5), angleRadians: CGFloat, attributes: [NSAttributedString.Key : Any]?)
    {
        var drawOffset = CGPoint()

        NSUIGraphicsPushContext(self)

        if angleRadians != 0.0
        {
            let size = text.size(withAttributes: attributes)

            // Move the text drawing rect in a way that it always rotates around its center
            drawOffset.x = -size.width * 0.5
            drawOffset.y = -size.height * 0.5

            var translate = point

            // Move the "outer" rect relative to the anchor, assuming its centered
            if anchor.x != 0.5 || anchor.y != 0.5
            {
                let rotatedSize = size.rotatedBy(radians: angleRadians)

                translate.x -= rotatedSize.width * (anchor.x - 0.5)
                translate.y -= rotatedSize.height * (anchor.y - 0.5)
            }

            saveGState()
            translateBy(x: translate.x, y: translate.y)
            rotate(by: angleRadians)

            (text as NSString).draw(at: drawOffset, withAttributes: attributes)

            restoreGState()
        }
        else
        {
            if anchor.x != 0.0 || anchor.y != 0.0
            {
                let size = text.size(withAttributes: attributes)

                drawOffset.x = -size.width * anchor.x
                drawOffset.y = -size.height * anchor.y
            }

            drawOffset.x += point.x
            drawOffset.y += point.y

            (text as NSString).draw(at: drawOffset, withAttributes: attributes)
        }

        NSUIGraphicsPopContext()
    }

    private func getDrawPoint(text: String, point: CGPoint, align: TextAlignment, attributes: [NSAttributedString.Key : Any]?) -> CGPoint
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
        NSUIGraphicsPopContext()
    }
    
    open class func drawText(context: CGContext, text: String, point: CGPoint, align: NSTextAlignment, attributes: [NSAttributedString.Key : Any]?)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
>>>>>>> e716a0e (Initial commit - transfer from other project)
    {
        var point = point
        
        if align == .center
        {
            point.x -= text.size(withAttributes: attributes).width / 2.0
        }
        else if align == .right
        {
            point.x -= text.size(withAttributes: attributes).width
        }
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        return point
    }
    
    func drawMultilineText(_ text: String, at point: CGPoint, constrainedTo size: CGSize, anchor: CGPoint, knownTextSize: CGSize, angleRadians: CGFloat, attributes: [NSAttributedString.Key : Any]?)
    {
        var rect = CGRect(origin: .zero, size: knownTextSize)

        NSUIGraphicsPushContext(self)

=======
        
        NSUIGraphicsPushContext(context)
        
        (text as NSString).draw(at: point, withAttributes: attributes)
        
        NSUIGraphicsPopContext()
<<<<<<< HEAD
=======
        return point
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
    }
    
    func drawMultilineText(_ text: String, at point: CGPoint, constrainedTo size: CGSize, anchor: CGPoint, knownTextSize: CGSize, angleRadians: CGFloat, attributes: [NSAttributedString.Key : Any]?)
    {
<<<<<<< HEAD
=======
    }
    
    open class func drawText(context: CGContext, text: String, point: CGPoint, attributes: [NSAttributedString.Key : Any]?, anchor: CGPoint, angleRadians: CGFloat)
    {
>>>>>>> e716a0e (Initial commit - transfer from other project)
        var drawOffset = CGPoint()
        
        NSUIGraphicsPushContext(context)
        
        if angleRadians != 0.0
        {
            let size = text.size(withAttributes: attributes)
            
            // Move the text drawing rect in a way that it always rotates around its center
            drawOffset.x = -size.width * 0.5
            drawOffset.y = -size.height * 0.5
            
            var translate = point
            
            // Move the "outer" rect relative to the anchor, assuming its centered
            if anchor.x != 0.5 || anchor.y != 0.5
            {
                let rotatedSize = size.rotatedBy(radians: angleRadians)
                
                translate.x -= rotatedSize.width * (anchor.x - 0.5)
                translate.y -= rotatedSize.height * (anchor.y - 0.5)
            }
            
            context.saveGState()
            context.translateBy(x: translate.x, y: translate.y)
            context.rotate(by: angleRadians)
            
            (text as NSString).draw(at: drawOffset, withAttributes: attributes)
            
            context.restoreGState()
        }
        else
        {
            if anchor.x != 0.0 || anchor.y != 0.0
            {
                let size = text.size(withAttributes: attributes)
                
                drawOffset.x = -size.width * anchor.x
                drawOffset.y = -size.height * anchor.y
            }
            
            drawOffset.x += point.x
            drawOffset.y += point.y
            
            (text as NSString).draw(at: drawOffset, withAttributes: attributes)
        }
        
        NSUIGraphicsPopContext()
    }
    
    internal class func drawMultilineText(context: CGContext, text: String, knownTextSize: CGSize, point: CGPoint, attributes: [NSAttributedString.Key : Any]?, constrainedToSize: CGSize, anchor: CGPoint, angleRadians: CGFloat)
    {
        var rect = CGRect(origin: CGPoint(), size: knownTextSize)
        
        NSUIGraphicsPushContext(context)
        
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        var rect = CGRect(origin: .zero, size: knownTextSize)

        NSUIGraphicsPushContext(self)

>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        if angleRadians != 0.0
        {
            // Move the text drawing rect in a way that it always rotates around its center
            rect.origin.x = -knownTextSize.width * 0.5
            rect.origin.y = -knownTextSize.height * 0.5
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)

            var translate = point

=======
            
            var translate = point
            
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======

            var translate = point

>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            // Move the "outer" rect relative to the anchor, assuming its centered
            if anchor.x != 0.5 || anchor.y != 0.5
            {
                let rotatedSize = knownTextSize.rotatedBy(radians: angleRadians)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)

                translate.x -= rotatedSize.width * (anchor.x - 0.5)
                translate.y -= rotatedSize.height * (anchor.y - 0.5)
            }

            saveGState()
            translateBy(x: translate.x, y: translate.y)
            rotate(by: angleRadians)

            (text as NSString).draw(with: rect, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)

            restoreGState()
=======
                
<<<<<<< HEAD
=======

>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
                translate.x -= rotatedSize.width * (anchor.x - 0.5)
                translate.y -= rotatedSize.height * (anchor.y - 0.5)
            }

            saveGState()
            translateBy(x: translate.x, y: translate.y)
            rotate(by: angleRadians)

            (text as NSString).draw(with: rect, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
<<<<<<< HEAD
            
            context.restoreGState()
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======

            restoreGState()
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
                translate.x -= rotatedSize.width * (anchor.x - 0.5)
                translate.y -= rotatedSize.height * (anchor.y - 0.5)
            }
            
            context.saveGState()
            context.translateBy(x: translate.x, y: translate.y)
            context.rotate(by: angleRadians)
            
            (text as NSString).draw(with: rect, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
            
            context.restoreGState()
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
>>>>>>> e716a0e (Initial commit - transfer from other project)
        }
        else
        {
            if anchor.x != 0.0 || anchor.y != 0.0
            {
                rect.origin.x = -knownTextSize.width * anchor.x
                rect.origin.y = -knownTextSize.height * anchor.y
            }
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)

            rect.origin.x += point.x
            rect.origin.y += point.y

            (text as NSString).draw(with: rect, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        }

        NSUIGraphicsPopContext()
    }

    func drawMultilineText(_ text: String, at point: CGPoint, constrainedTo size: CGSize, anchor: CGPoint, angleRadians: CGFloat, attributes: [NSAttributedString.Key : Any]?)
    {
        let rect = text.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        drawMultilineText(text, at: point, constrainedTo: size, anchor: anchor, knownTextSize: rect.size, angleRadians: angleRadians, attributes: attributes)
=======
            
<<<<<<< HEAD
=======

>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
            rect.origin.x += point.x
            rect.origin.y += point.y

            (text as NSString).draw(with: rect, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        }

        NSUIGraphicsPopContext()
    }

    func drawMultilineText(_ text: String, at point: CGPoint, constrainedTo size: CGSize, anchor: CGPoint, angleRadians: CGFloat, attributes: [NSAttributedString.Key : Any]?)
    {
<<<<<<< HEAD
=======
            rect.origin.x += point.x
            rect.origin.y += point.y
            
            (text as NSString).draw(with: rect, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        }
        
        NSUIGraphicsPopContext()
    }
    
    internal class func drawMultilineText(context: CGContext, text: String, point: CGPoint, attributes: [NSAttributedString.Key : Any]?, constrainedToSize: CGSize, anchor: CGPoint, angleRadians: CGFloat)
    {
        let rect = text.boundingRect(with: constrainedToSize, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        drawMultilineText(context: context, text: text, knownTextSize: rect.size, point: point, attributes: attributes, constrainedToSize: constrainedToSize, anchor: anchor, angleRadians: angleRadians)
    }

    private class func generateDefaultValueFormatter() -> IValueFormatter
    {
>>>>>>> e716a0e (Initial commit - transfer from other project)
        let formatter = DefaultValueFormatter(decimals: 1)
        return formatter
    }
    
    /// - Returns: The default value formatter used for all chart components that needs a default
    open class func defaultValueFormatter() -> IValueFormatter
    {
        return _defaultValueFormatter
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        let rect = text.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        drawMultilineText(text, at: point, constrainedTo: size, anchor: anchor, knownTextSize: rect.size, angleRadians: angleRadians, attributes: attributes)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    }
}
