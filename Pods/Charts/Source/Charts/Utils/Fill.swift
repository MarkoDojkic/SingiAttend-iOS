//
//  Fill.swift
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
@objc(ChartFill)
public protocol Fill
{

    /// Draws the provided path in filled mode with the provided area
    @objc func fillPath(context: CGContext, rect: CGRect)
}

@objc(ChartEmptyFill)
public class EmptyFill: NSObject, Fill
{

    public func fillPath(context: CGContext, rect: CGRect) { }
}

@objc(ChartColorFill)
public class ColorFill: NSObject, Fill
{

    @objc public let color: CGColor

    @objc public init(cgColor: CGColor)
    {
        self.color = cgColor
        super.init()
    }

    @objc public convenience init(color: NSUIColor)
    {
        self.init(cgColor: color.cgColor)
    }

    public func fillPath(context: CGContext, rect: CGRect)
    {
        context.saveGState()
        defer { context.restoreGState() }

        context.setFillColor(color)
        context.fillPath()
    }
}

@objc(ChartImageFill)
public class ImageFill: NSObject, Fill
{

    @objc public let image: CGImage
    @objc public let isTiled: Bool

    @objc public init(cgImage: CGImage, isTiled: Bool = false)
    {
        image = cgImage
        self.isTiled = isTiled
        super.init()
    }

    @objc public convenience init(image: NSUIImage, isTiled: Bool = false)
    {
        self.init(cgImage: image.cgImage!, isTiled: isTiled)
    }

    public func fillPath(context: CGContext, rect: CGRect)
    {
        context.saveGState()
        defer { context.restoreGState() }

        context.clip()
        context.draw(image, in: rect, byTiling: isTiled)
    }
}

@objc(ChartLayerFill)
public class LayerFill: NSObject, Fill
{

    @objc public let layer: CGLayer

    @objc public init(layer: CGLayer)
    {
        self.layer = layer
        super.init()
    }

    public func fillPath(context: CGContext, rect: CGRect)
    {
        context.saveGState()
        defer { context.restoreGState() }

        context.clip()
        context.draw(layer, in: rect)
    }
}

@objc(ChartLinearGradientFill)
public class LinearGradientFill: NSObject, Fill
{

    @objc public let gradient: CGGradient
    @objc public let angle: CGFloat

    @objc public init(gradient: CGGradient, angle: CGFloat = 0)
    {
        self.gradient = gradient
        self.angle = angle
        super.init()
    }

    public func fillPath(context: CGContext, rect: CGRect)
    {
        context.saveGState()
        defer { context.restoreGState() }

        let radians = (360.0 - angle).DEG2RAD
        let centerPoint = CGPoint(x: rect.midX, y: rect.midY)
        let xAngleDelta = cos(radians) * rect.width / 2.0
        let yAngleDelta = sin(radians) * rect.height / 2.0
        let startPoint = CGPoint(
            x: centerPoint.x - xAngleDelta,
            y: centerPoint.y - yAngleDelta
        )
        let endPoint = CGPoint(
            x: centerPoint.x + xAngleDelta,
            y: centerPoint.y + yAngleDelta
        )

        context.clip()
        context.drawLinearGradient(
            gradient,
            start: startPoint,
            end: endPoint,
            options: [.drawsAfterEndLocation, .drawsBeforeStartLocation]
        )
    }
}

@objc(ChartRadialGradientFill)
public class RadialGradientFill: NSObject, Fill
{

    @objc public let gradient: CGGradient
    @objc public let startOffsetPercent: CGPoint
    @objc public let endOffsetPercent: CGPoint
    @objc public let startRadiusPercent: CGFloat
    @objc public let endRadiusPercent: CGFloat

    @objc public init(
        gradient: CGGradient,
        startOffsetPercent: CGPoint,
        endOffsetPercent: CGPoint,
        startRadiusPercent: CGFloat,
        endRadiusPercent: CGFloat)
    {
        self.gradient = gradient
        self.startOffsetPercent = startOffsetPercent
        self.endOffsetPercent = endOffsetPercent
        self.startRadiusPercent = startRadiusPercent
        self.endRadiusPercent = endRadiusPercent
        super.init()
    }

    @objc public convenience init(gradient: CGGradient)
    {
        self.init(
            gradient: gradient,
            startOffsetPercent: .zero,
            endOffsetPercent: .zero,
            startRadiusPercent: 0,
            endRadiusPercent: 1
        )
    }

    @objc public func fillPath(context: CGContext, rect: CGRect)
    {
        context.saveGState()
        defer { context.restoreGState() }

        let centerPoint = CGPoint(x: rect.midX, y: rect.midY)
        let radius = max(rect.width, rect.height) / 2.0

        context.clip()
        context.drawRadialGradient(
            gradient,
            startCenter: CGPoint(
                x: centerPoint.x + rect.width * startOffsetPercent.x,
                y: centerPoint.y + rect.height * startOffsetPercent.y
            ),
            startRadius: radius * startRadiusPercent,
            endCenter: CGPoint(
                x: centerPoint.x + rect.width * endOffsetPercent.x,
                y: centerPoint.y + rect.height * endOffsetPercent.y
            ),
            endRadius: radius * endRadiusPercent,
            options: [.drawsAfterEndLocation, .drawsBeforeStartLocation]
        )
    }
=======
@objc(ChartFillType)
public enum FillType: Int
<<<<<<< HEAD
=======
@objc(ChartFill)
public protocol Fill
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
{

    /// Draws the provided path in filled mode with the provided area
    @objc func fillPath(context: CGContext, rect: CGRect)
}

@objc(ChartEmptyFill)
public class EmptyFill: NSObject, Fill
{

    public func fillPath(context: CGContext, rect: CGRect) { }
}

@objc(ChartColorFill)
public class ColorFill: NSObject, Fill
{

    @objc public let color: CGColor

    @objc public init(cgColor: CGColor)
    {
        self.color = cgColor
        super.init()
    }

    @objc public convenience init(color: NSUIColor)
    {
        self.init(cgColor: color.cgColor)
    }

    public func fillPath(context: CGContext, rect: CGRect)
    {
        context.saveGState()
        defer { context.restoreGState() }

        context.setFillColor(color)
        context.fillPath()
    }
}

@objc(ChartImageFill)
public class ImageFill: NSObject, Fill
{

    @objc public let image: CGImage
    @objc public let isTiled: Bool

    @objc public init(cgImage: CGImage, isTiled: Bool = false)
    {
        image = cgImage
        self.isTiled = isTiled
        super.init()
    }

    @objc public convenience init(image: NSUIImage, isTiled: Bool = false)
    {
        self.init(cgImage: image.cgImage!, isTiled: isTiled)
    }

    public func fillPath(context: CGContext, rect: CGRect)
    {
        context.saveGState()
        defer { context.restoreGState() }

        context.clip()
        context.draw(image, in: rect, byTiling: isTiled)
    }
}

@objc(ChartLayerFill)
public class LayerFill: NSObject, Fill
{

    @objc public let layer: CGLayer

    @objc public init(layer: CGLayer)
    {
        self.layer = layer
        super.init()
    }

    public func fillPath(context: CGContext, rect: CGRect)
    {
        context.saveGState()
        defer { context.restoreGState() }

        context.clip()
        context.draw(layer, in: rect)
    }
}

@objc(ChartLinearGradientFill)
public class LinearGradientFill: NSObject, Fill
{

    @objc public let gradient: CGGradient
    @objc public let angle: CGFloat

    @objc public init(gradient: CGGradient, angle: CGFloat = 0)
    {
        self.gradient = gradient
        self.angle = angle
        super.init()
    }

    public func fillPath(context: CGContext, rect: CGRect)
    {
        context.saveGState()
        defer { context.restoreGState() }

        let radians = (360.0 - angle).DEG2RAD
        let centerPoint = CGPoint(x: rect.midX, y: rect.midY)
        let xAngleDelta = cos(radians) * rect.width / 2.0
        let yAngleDelta = sin(radians) * rect.height / 2.0
        let startPoint = CGPoint(
            x: centerPoint.x - xAngleDelta,
            y: centerPoint.y - yAngleDelta
        )
        let endPoint = CGPoint(
            x: centerPoint.x + xAngleDelta,
            y: centerPoint.y + yAngleDelta
        )

        context.clip()
        context.drawLinearGradient(
            gradient,
            start: startPoint,
            end: endPoint,
            options: [.drawsAfterEndLocation, .drawsBeforeStartLocation]
        )
    }
}

@objc(ChartRadialGradientFill)
public class RadialGradientFill: NSObject, Fill
{

    @objc public let gradient: CGGradient
    @objc public let startOffsetPercent: CGPoint
    @objc public let endOffsetPercent: CGPoint
    @objc public let startRadiusPercent: CGFloat
    @objc public let endRadiusPercent: CGFloat

    @objc public init(
        gradient: CGGradient,
        startOffsetPercent: CGPoint,
        endOffsetPercent: CGPoint,
        startRadiusPercent: CGFloat,
        endRadiusPercent: CGFloat)
    {
        self.gradient = gradient
        self.startOffsetPercent = startOffsetPercent
        self.endOffsetPercent = endOffsetPercent
        self.startRadiusPercent = startRadiusPercent
        self.endRadiusPercent = endRadiusPercent
        super.init()
    }

    @objc public convenience init(gradient: CGGradient)
    {
        self.init(
            gradient: gradient,
            startOffsetPercent: .zero,
            endOffsetPercent: .zero,
            startRadiusPercent: 0,
            endRadiusPercent: 1
        )
    }

    @objc public func fillPath(context: CGContext, rect: CGRect)
    {
        context.saveGState()
        defer { context.restoreGState() }

        let centerPoint = CGPoint(x: rect.midX, y: rect.midY)
        let radius = max(rect.width, rect.height) / 2.0

        context.clip()
        context.drawRadialGradient(
            gradient,
            startCenter: CGPoint(
                x: centerPoint.x + rect.width * startOffsetPercent.x,
                y: centerPoint.y + rect.height * startOffsetPercent.y
            ),
            startRadius: radius * startRadiusPercent,
            endCenter: CGPoint(
                x: centerPoint.x + rect.width * endOffsetPercent.x,
                y: centerPoint.y + rect.height * endOffsetPercent.y
            ),
            endRadius: radius * endRadiusPercent,
            options: [.drawsAfterEndLocation, .drawsBeforeStartLocation]
        )
    }
<<<<<<< HEAD
    
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
{
    case empty
    case color
    case linearGradient
    case radialGradient
    case image
    case tiledImage
    case layer
}

@objc(ChartFill)
open class Fill: NSObject
{
    private var _type: FillType = FillType.empty
    private var _color: CGColor?
    private var _gradient: CGGradient?
    private var _gradientAngle: CGFloat = 0.0
    private var _gradientStartOffsetPercent: CGPoint = CGPoint()
    private var _gradientStartRadiusPercent: CGFloat = 0.0
    private var _gradientEndOffsetPercent: CGPoint = CGPoint()
    private var _gradientEndRadiusPercent: CGFloat = 0.0
    private var _image: CGImage?
    private var _layer: CGLayer?
    
    // MARK: Properties
    
    @objc open var type: FillType
    {
        return _type
    }
    
    @objc open var color: CGColor?
    {
        return _color
    }
    
    @objc open var gradient: CGGradient?
    {
        return _gradient
    }
    
    @objc open var gradientAngle: CGFloat
    {
        return _gradientAngle
    }
    
    @objc open var gradientStartOffsetPercent: CGPoint
    {
        return _gradientStartOffsetPercent
    }
    
    @objc open var gradientStartRadiusPercent: CGFloat
    {
        return _gradientStartRadiusPercent
    }
    
    @objc open var gradientEndOffsetPercent: CGPoint
    {
        return _gradientEndOffsetPercent
    }
    
    @objc open var gradientEndRadiusPercent: CGFloat
    {
        return _gradientEndRadiusPercent
    }
    
    @objc open var image: CGImage?
    {
        return _image
    }
    
    @objc open var layer: CGLayer?
    {
        return _layer
    }
    
    // MARK: Constructors
    
    public override init()
    {
    }
    
    @objc public init(CGColor: CGColor)
    {
        _type = .color
        _color = CGColor
    }
    
    @objc public convenience init(color: NSUIColor)
    {
        self.init(CGColor: color.cgColor)
    }
    
    @objc public init(linearGradient: CGGradient, angle: CGFloat)
    {
        _type = .linearGradient
        _gradient = linearGradient
        _gradientAngle = angle
    }
    
    @objc public init(
        radialGradient: CGGradient,
        startOffsetPercent: CGPoint,
        startRadiusPercent: CGFloat,
        endOffsetPercent: CGPoint,
        endRadiusPercent: CGFloat
        )
    {
        _type = .radialGradient
        _gradient = radialGradient
        _gradientStartOffsetPercent = startOffsetPercent
        _gradientStartRadiusPercent = startRadiusPercent
        _gradientEndOffsetPercent = endOffsetPercent
        _gradientEndRadiusPercent = endRadiusPercent
    }
    
    @objc public convenience init(radialGradient: CGGradient)
    {
        self.init(
            radialGradient: radialGradient,
            startOffsetPercent: CGPoint(x: 0.0, y: 0.0),
            startRadiusPercent: 0.0,
            endOffsetPercent: CGPoint(x: 0.0, y: 0.0),
            endRadiusPercent: 1.0
        )
    }
    
    @objc public init(CGImage: CGImage, tiled: Bool)
    {
        _type = tiled ? .tiledImage : .image
        _image = CGImage
    }
    
    @objc public convenience init(image: NSUIImage, tiled: Bool)
    {
        self.init(CGImage: image.cgImage!, tiled: tiled)
    }
    
    @objc public convenience init(CGImage: CGImage)
    {
        self.init(CGImage: CGImage, tiled: false)
    }
    
    @objc public convenience init(image: NSUIImage)
    {
        self.init(image: image, tiled: false)
    }
    
    @objc public init(CGLayer: CGLayer)
    {
        _type = .layer
        _layer = CGLayer
    }
    
    // MARK: Constructors
    
    @objc open class func fillWithCGColor(_ CGColor: CGColor) -> Fill
    {
        return Fill(CGColor: CGColor)
    }
    
    @objc open class func fillWithColor(_ color: NSUIColor) -> Fill
    {
        return Fill(color: color)
    }
    
    @objc open class func fillWithLinearGradient(
        _ linearGradient: CGGradient,
        angle: CGFloat) -> Fill
    {
        return Fill(linearGradient: linearGradient, angle: angle)
    }
    
    @objc open class func fillWithRadialGradient(
        _ radialGradient: CGGradient,
        startOffsetPercent: CGPoint,
        startRadiusPercent: CGFloat,
        endOffsetPercent: CGPoint,
        endRadiusPercent: CGFloat
        ) -> Fill
    {
        return Fill(
            radialGradient: radialGradient,
            startOffsetPercent: startOffsetPercent,
            startRadiusPercent: startRadiusPercent,
            endOffsetPercent: endOffsetPercent,
            endRadiusPercent: endRadiusPercent
        )
    }
    
    @objc open class func fillWithRadialGradient(_ radialGradient: CGGradient) -> Fill
    {
        return Fill(radialGradient: radialGradient)
    }
    
    @objc open class func fillWithCGImage(_ CGImage: CGImage, tiled: Bool) -> Fill
    {
        return Fill(CGImage: CGImage, tiled: tiled)
    }
    
    @objc open class func fillWithImage(_ image: NSUIImage, tiled: Bool) -> Fill
    {
        return Fill(image: image, tiled: tiled)
    }
    
    @objc open class func fillWithCGImage(_ CGImage: CGImage) -> Fill
    {
        return Fill(CGImage: CGImage)
    }
    
    @objc open class func fillWithImage(_ image: NSUIImage) -> Fill
    {
        return Fill(image: image)
    }
    
    @objc open class func fillWithCGLayer(_ CGLayer: CGLayer) -> Fill
    {
        return Fill(CGLayer: CGLayer)
    }
    
    // MARK: Drawing code
    
    /// Draws the provided path in filled mode with the provided area
    @objc open func fillPath(
        context: CGContext,
        rect: CGRect)
    {
        let fillType = _type
        if fillType == .empty
        {
            return
        }
        
        context.saveGState()
        
        switch fillType
        {
        case .color:
            
            context.setFillColor(_color!)
            context.fillPath()
            
        case .image:
            
            context.clip()
            context.draw(_image!, in: rect)
            
        case .tiledImage:
            
            context.clip()
            context.draw(_image!, in: rect, byTiling: true)
            
        case .layer:
            
            context.clip()
            context.draw(_layer!, in: rect)
            
        case .linearGradient:
            
            let radians = (360.0 - _gradientAngle).DEG2RAD
            let centerPoint = CGPoint(x: rect.midX, y: rect.midY)
            let xAngleDelta = cos(radians) * rect.width / 2.0
            let yAngleDelta = sin(radians) * rect.height / 2.0
            let startPoint = CGPoint(
                x: centerPoint.x - xAngleDelta,
                y: centerPoint.y - yAngleDelta
            )
            let endPoint = CGPoint(
                x: centerPoint.x + xAngleDelta,
                y: centerPoint.y + yAngleDelta
            )
            
            context.clip()
            context.drawLinearGradient(_gradient!,
                start: startPoint,
                end: endPoint,
                options: [.drawsAfterEndLocation, .drawsBeforeStartLocation]
            )
            
        case .radialGradient:
            
            let centerPoint = CGPoint(x: rect.midX, y: rect.midY)
            let radius = max(rect.width, rect.height) / 2.0
            
            context.clip()
            context.drawRadialGradient(_gradient!,
                startCenter: CGPoint(
                    x: centerPoint.x + rect.width * _gradientStartOffsetPercent.x,
                    y: centerPoint.y + rect.height * _gradientStartOffsetPercent.y
                ),
                startRadius: radius * _gradientStartRadiusPercent,
                endCenter: CGPoint(
                    x: centerPoint.x + rect.width * _gradientEndOffsetPercent.x,
                    y: centerPoint.y + rect.height * _gradientEndOffsetPercent.y
                ),
                endRadius: radius * _gradientEndRadiusPercent,
                options: [.drawsAfterEndLocation, .drawsBeforeStartLocation]
            )
            
        case .empty:
            break
        }
        
        context.restoreGState()
    }
    
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
>>>>>>> e716a0e (Initial commit - transfer from other project)
}
