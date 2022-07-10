//
//  XAxisRenderer.swift
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
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)

@objc(ChartXAxisRenderer)
open class XAxisRenderer: NSObject, AxisRenderer
{
    @objc public let viewPortHandler: ViewPortHandler
    @objc public let axis: XAxis
    @objc public let transformer: Transformer?

    @objc public init(viewPortHandler: ViewPortHandler, axis: XAxis, transformer: Transformer?)
    {
        self.viewPortHandler = viewPortHandler
        self.axis = axis
        self.transformer = transformer

        super.init()
    }
    
    open func computeAxis(min: Double, max: Double, inverted: Bool)
    {
        var min = min, max = max
        
        if let transformer = self.transformer,
            viewPortHandler.contentWidth > 10,
            !viewPortHandler.isFullyZoomedOutX
        {
            // calculate the starting and entry point of the y-labels (depending on
            // zoom / contentrect bounds)
            let p1 = transformer.valueForTouchPoint(CGPoint(x: viewPortHandler.contentLeft, y: viewPortHandler.contentTop))
            let p2 = transformer.valueForTouchPoint(CGPoint(x: viewPortHandler.contentRight, y: viewPortHandler.contentTop))

            min = inverted ? Double(p2.x) : Double(p1.x)
            max = inverted ? Double(p1.x) : Double(p2.x)
=======
#if canImport(UIKit)
    import UIKit
#endif

#if canImport(Cocoa)
import Cocoa
#endif
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)

@objc(ChartXAxisRenderer)
open class XAxisRenderer: NSObject, AxisRenderer
{
    @objc public let viewPortHandler: ViewPortHandler
    @objc public let axis: XAxis
    @objc public let transformer: Transformer?

    @objc public init(viewPortHandler: ViewPortHandler, axis: XAxis, transformer: Transformer?)
    {
        self.viewPortHandler = viewPortHandler
        self.axis = axis
        self.transformer = transformer

        super.init()
    }
    
    open func computeAxis(min: Double, max: Double, inverted: Bool)
    {
        var min = min, max = max
        
        if let transformer = self.transformer,
            viewPortHandler.contentWidth > 10,
            !viewPortHandler.isFullyZoomedOutX
        {
            // calculate the starting and entry point of the y-labels (depending on
            // zoom / contentrect bounds)
<<<<<<< HEAD
=======
=======
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)

@objc(ChartXAxisRenderer)
open class XAxisRenderer: NSObject, AxisRenderer
{
    @objc public let viewPortHandler: ViewPortHandler
    @objc public let axis: XAxis
    @objc public let transformer: Transformer?

    @objc public init(viewPortHandler: ViewPortHandler, axis: XAxis, transformer: Transformer?)
    {
        self.viewPortHandler = viewPortHandler
        self.axis = axis
        self.transformer = transformer

        super.init()
    }
    
    open func computeAxis(min: Double, max: Double, inverted: Bool)
    {
        var min = min, max = max
        
        if let transformer = self.transformer,
            viewPortHandler.contentWidth > 10,
            !viewPortHandler.isFullyZoomedOutX
        {
            // calculate the starting and entry point of the y-labels (depending on
            // zoom / contentrect bounds)
<<<<<<< HEAD
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
<<<<<<< HEAD
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            if viewPortHandler.contentWidth > 10 && !viewPortHandler.isFullyZoomedOutX
            {
                let p1 = transformer.valueForTouchPoint(CGPoint(x: viewPortHandler.contentLeft, y: viewPortHandler.contentTop))
                let p2 = transformer.valueForTouchPoint(CGPoint(x: viewPortHandler.contentRight, y: viewPortHandler.contentTop))
                
                if inverted
                {
                    min = Double(p2.x)
                    max = Double(p1.x)
                }
                else
                {
                    min = Double(p1.x)
                    max = Double(p2.x)
                }
            }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
            let p1 = transformer.valueForTouchPoint(CGPoint(x: viewPortHandler.contentLeft, y: viewPortHandler.contentTop))
            let p2 = transformer.valueForTouchPoint(CGPoint(x: viewPortHandler.contentRight, y: viewPortHandler.contentTop))

            min = inverted ? Double(p2.x) : Double(p1.x)
            max = inverted ? Double(p1.x) : Double(p2.x)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        }
        
        computeAxisValues(min: min, max: max)
    }
    
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    open func computeAxisValues(min: Double, max: Double)
    {
        let yMin = min
        let yMax = max

        let labelCount = axis.labelCount
        let range = abs(yMax - yMin)

        guard
            labelCount != 0,
            range > 0,
            range.isFinite
            else
        {
            axis.entries = []
            axis.centeredEntries = []
            return
        }

        // Find out how much spacing (in y value space) between axis values
        let rawInterval = range / Double(labelCount)
        var interval = rawInterval.roundedToNextSignificant()

        // If granularity is enabled, then do not allow the interval to go below specified granularity.
        // This is used to avoid repeated values when rounding values for display.
        if axis.granularityEnabled
        {
            interval = Swift.max(interval, axis.granularity)
        }

        // Normalize interval
        let intervalMagnitude = pow(10.0, Double(Int(log10(interval)))).roundedToNextSignificant()
        let intervalSigDigit = Int(interval / intervalMagnitude)
        if intervalSigDigit > 5
        {
            // Use one order of magnitude higher, to avoid intervals like 0.9 or 90
            interval = floor(10.0 * Double(intervalMagnitude))
        }

        var n = axis.centerAxisLabelsEnabled ? 1 : 0

        // force label count
        if axis.isForceLabelsEnabled
        {
            interval = range / Double(labelCount - 1)

            // Ensure stops contains at least n elements.
            axis.entries.removeAll(keepingCapacity: true)
            axis.entries.reserveCapacity(labelCount)

            let values = stride(from: yMin, to: Double(labelCount) * interval + yMin, by: interval)
            axis.entries.append(contentsOf: values)

            n = labelCount
        }
        else
        {
            // no forced count

            var first = interval == 0.0 ? 0.0 : ceil(yMin / interval) * interval

            if axis.centerAxisLabelsEnabled
            {
                first -= interval
            }

            let last = interval == 0.0 ? 0.0 : (floor(yMax / interval) * interval).nextUp

            if interval != 0.0, last != first
            {
                stride(from: first, through: last, by: interval).forEach { _ in n += 1 }
            }

            // Ensure stops contains at least n elements.
            axis.entries.removeAll(keepingCapacity: true)
            axis.entries.reserveCapacity(labelCount)

            let start = first, end = first + Double(n) * interval

            // Fix for IEEE negative zero case (Where value == -0.0, and 0.0 == -0.0)
            let values = stride(from: start, to: end, by: interval).map { $0 == 0.0 ? 0.0 : $0 }
            axis.entries.append(contentsOf: values)
        }

        // set decimals
        if interval < 1
        {
            axis.decimals = Int(ceil(-log10(interval)))
        }
        else
        {
            axis.decimals = 0
        }

        if axis.centerAxisLabelsEnabled
        {
            let offset: Double = interval / 2.0
            axis.centeredEntries = axis.entries[..<n]
                .map { $0 + offset }
        }
=======
    open override func computeAxisValues(min: Double, max: Double)
    {
        super.computeAxisValues(min: min, max: max)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
    open func computeAxisValues(min: Double, max: Double)
    {
        let yMin = min
        let yMax = max

        let labelCount = axis.labelCount
        let range = abs(yMax - yMin)

        guard
            labelCount != 0,
            range > 0,
            range.isFinite
            else
        {
            axis.entries = []
            axis.centeredEntries = []
            return
        }

        // Find out how much spacing (in y value space) between axis values
        let rawInterval = range / Double(labelCount)
        var interval = rawInterval.roundedToNextSignificant()

        // If granularity is enabled, then do not allow the interval to go below specified granularity.
        // This is used to avoid repeated values when rounding values for display.
        if axis.granularityEnabled
        {
            interval = Swift.max(interval, axis.granularity)
        }

        // Normalize interval
        let intervalMagnitude = pow(10.0, Double(Int(log10(interval)))).roundedToNextSignificant()
        let intervalSigDigit = Int(interval / intervalMagnitude)
        if intervalSigDigit > 5
        {
            // Use one order of magnitude higher, to avoid intervals like 0.9 or 90
            interval = floor(10.0 * Double(intervalMagnitude))
        }

        var n = axis.centerAxisLabelsEnabled ? 1 : 0

        // force label count
        if axis.isForceLabelsEnabled
        {
            interval = range / Double(labelCount - 1)

            // Ensure stops contains at least n elements.
            axis.entries.removeAll(keepingCapacity: true)
            axis.entries.reserveCapacity(labelCount)

            let values = stride(from: yMin, to: Double(labelCount) * interval + yMin, by: interval)
            axis.entries.append(contentsOf: values)

            n = labelCount
        }
        else
        {
            // no forced count

            var first = interval == 0.0 ? 0.0 : ceil(yMin / interval) * interval

            if axis.centerAxisLabelsEnabled
            {
                first -= interval
            }

            let last = interval == 0.0 ? 0.0 : (floor(yMax / interval) * interval).nextUp

            if interval != 0.0, last != first
            {
                stride(from: first, through: last, by: interval).forEach { _ in n += 1 }
            }

            // Ensure stops contains at least n elements.
            axis.entries.removeAll(keepingCapacity: true)
            axis.entries.reserveCapacity(labelCount)

            let start = first, end = first + Double(n) * interval

            // Fix for IEEE negative zero case (Where value == -0.0, and 0.0 == -0.0)
            let values = stride(from: start, to: end, by: interval).map { $0 == 0.0 ? 0.0 : $0 }
            axis.entries.append(contentsOf: values)
        }

        // set decimals
        if interval < 1
        {
            axis.decimals = Int(ceil(-log10(interval)))
        }
        else
        {
            axis.decimals = 0
        }

        if axis.centerAxisLabelsEnabled
        {
            let offset: Double = interval / 2.0
            axis.centeredEntries = axis.entries[..<n]
                .map { $0 + offset }
        }
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        
        computeSize()
    }
    
    @objc open func computeSize()
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        let longest = axis.getLongestLabel()
        
        let labelSize = longest.size(withAttributes: [.font: axis.labelFont])

        let labelWidth = labelSize.width
        let labelHeight = labelSize.height
        
        let labelRotatedSize = labelSize.rotatedBy(degrees: axis.labelRotationAngle)
        
        axis.labelWidth = labelWidth
        axis.labelHeight = labelHeight
        axis.labelRotatedWidth = labelRotatedSize.width
        axis.labelRotatedHeight = labelRotatedSize.height
    }
    
    open func renderAxisLabels(context: CGContext)
    {
        guard
            axis.isEnabled,
            axis.isDrawLabelsEnabled
            else { return }

        let yOffset = axis.yOffset
        
        switch axis.labelPosition {
        case .top:
            drawLabels(context: context, pos: viewPortHandler.contentTop - yOffset, anchor: CGPoint(x: 0.5, y: 1.0))

        case .topInside:
            drawLabels(context: context, pos: viewPortHandler.contentTop + yOffset + axis.labelRotatedHeight, anchor: CGPoint(x: 0.5, y: 1.0))

        case .bottom:
            drawLabels(context: context, pos: viewPortHandler.contentBottom + yOffset, anchor: CGPoint(x: 0.5, y: 0.0))

        case .bottomInside:
            drawLabels(context: context, pos: viewPortHandler.contentBottom - yOffset - axis.labelRotatedHeight, anchor: CGPoint(x: 0.5, y: 0.0))

        case .bothSided:
=======
        guard let
            xAxis = self.axis as? XAxis
            else { return }
        
        let longest = xAxis.getLongestLabel()
        
        let labelSize = longest.size(withAttributes: [NSAttributedString.Key.font: xAxis.labelFont])
<<<<<<< HEAD
<<<<<<< HEAD
=======
        let longest = axis.getLongestLabel()
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
        
        let labelSize = longest.size(withAttributes: [.font: axis.labelFont])

        let labelWidth = labelSize.width
        let labelHeight = labelSize.height
        
        let labelRotatedSize = labelSize.rotatedBy(degrees: axis.labelRotationAngle)
        
        axis.labelWidth = labelWidth
        axis.labelHeight = labelHeight
        axis.labelRotatedWidth = labelRotatedSize.width
        axis.labelRotatedHeight = labelRotatedSize.height
    }
    
    open func renderAxisLabels(context: CGContext)
    {
        guard
            axis.isEnabled,
            axis.isDrawLabelsEnabled
            else { return }

        let yOffset = axis.yOffset
        
        switch axis.labelPosition {
        case .top:
            drawLabels(context: context, pos: viewPortHandler.contentTop - yOffset, anchor: CGPoint(x: 0.5, y: 1.0))

        case .topInside:
            drawLabels(context: context, pos: viewPortHandler.contentTop + yOffset + axis.labelRotatedHeight, anchor: CGPoint(x: 0.5, y: 1.0))

        case .bottom:
            drawLabels(context: context, pos: viewPortHandler.contentBottom + yOffset, anchor: CGPoint(x: 0.5, y: 0.0))
<<<<<<< HEAD
=======
=======
=======
        let longest = axis.getLongestLabel()
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        
        let labelSize = longest.size(withAttributes: [.font: axis.labelFont])

        let labelWidth = labelSize.width
        let labelHeight = labelSize.height
        
        let labelRotatedSize = labelSize.rotatedBy(degrees: axis.labelRotationAngle)
        
        axis.labelWidth = labelWidth
        axis.labelHeight = labelHeight
        axis.labelRotatedWidth = labelRotatedSize.width
        axis.labelRotatedHeight = labelRotatedSize.height
    }
    
    open func renderAxisLabels(context: CGContext)
    {
        guard
            axis.isEnabled,
            axis.isDrawLabelsEnabled
            else { return }

        let yOffset = axis.yOffset
        
        switch axis.labelPosition {
        case .top:
            drawLabels(context: context, pos: viewPortHandler.contentTop - yOffset, anchor: CGPoint(x: 0.5, y: 1.0))

        case .topInside:
            drawLabels(context: context, pos: viewPortHandler.contentTop + yOffset + axis.labelRotatedHeight, anchor: CGPoint(x: 0.5, y: 1.0))

        case .bottom:
            drawLabels(context: context, pos: viewPortHandler.contentBottom + yOffset, anchor: CGPoint(x: 0.5, y: 0.0))
<<<<<<< HEAD
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
<<<<<<< HEAD
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        }
        else if xAxis.labelPosition == .bottomInside
        {
            drawLabels(context: context, pos: viewPortHandler.contentBottom - yOffset - xAxis.labelRotatedHeight, anchor: CGPoint(x: 0.5, y: 0.0))
        }
        else
        { // BOTH SIDED
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======

        case .bottomInside:
            drawLabels(context: context, pos: viewPortHandler.contentBottom - yOffset - axis.labelRotatedHeight, anchor: CGPoint(x: 0.5, y: 0.0))

        case .bothSided:
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            drawLabels(context: context, pos: viewPortHandler.contentTop - yOffset, anchor: CGPoint(x: 0.5, y: 1.0))
            drawLabels(context: context, pos: viewPortHandler.contentBottom + yOffset, anchor: CGPoint(x: 0.5, y: 0.0))
        }
    }
    
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    private var axisLineSegmentsBuffer = [CGPoint](repeating: .zero, count: 2)
    
    open func renderAxisLine(context: CGContext)
    {
        guard
            axis.isEnabled,
            axis.isDrawAxisLineEnabled
            else { return }

        context.saveGState()
        defer { context.restoreGState() }
        
        context.setStrokeColor(axis.axisLineColor.cgColor)
        context.setLineWidth(axis.axisLineWidth)
        if axis.axisLineDashLengths != nil
        {
            context.setLineDash(phase: axis.axisLineDashPhase, lengths: axis.axisLineDashLengths)
=======
    private var _axisLineSegmentsBuffer = [CGPoint](repeating: CGPoint(), count: 2)
<<<<<<< HEAD
<<<<<<< HEAD
=======
    private var axisLineSegmentsBuffer = [CGPoint](repeating: .zero, count: 2)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
    
    open func renderAxisLine(context: CGContext)
    {
        guard
            axis.isEnabled,
            axis.isDrawAxisLineEnabled
            else { return }

        context.saveGState()
        defer { context.restoreGState() }
        
        context.setStrokeColor(axis.axisLineColor.cgColor)
        context.setLineWidth(axis.axisLineWidth)
        if axis.axisLineDashLengths != nil
        {
<<<<<<< HEAD
            context.setLineDash(phase: xAxis.axisLineDashPhase, lengths: xAxis.axisLineDashLengths)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
            context.setLineDash(phase: axis.axisLineDashPhase, lengths: axis.axisLineDashLengths)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
=======
=======
    private var axisLineSegmentsBuffer = [CGPoint](repeating: .zero, count: 2)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    
    open func renderAxisLine(context: CGContext)
    {
        guard
            axis.isEnabled,
            axis.isDrawAxisLineEnabled
            else { return }

        context.saveGState()
        defer { context.restoreGState() }
        
        context.setStrokeColor(axis.axisLineColor.cgColor)
        context.setLineWidth(axis.axisLineWidth)
        if axis.axisLineDashLengths != nil
        {
<<<<<<< HEAD
            context.setLineDash(phase: xAxis.axisLineDashPhase, lengths: xAxis.axisLineDashLengths)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
            context.setLineDash(phase: axis.axisLineDashPhase, lengths: axis.axisLineDashLengths)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        }
        else
        {
            context.setLineDash(phase: 0.0, lengths: [])
        }
        
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        if axis.labelPosition == .top
            || axis.labelPosition == .topInside
            || axis.labelPosition == .bothSided
        {
            axisLineSegmentsBuffer[0].x = viewPortHandler.contentLeft
            axisLineSegmentsBuffer[0].y = viewPortHandler.contentTop
            axisLineSegmentsBuffer[1].x = viewPortHandler.contentRight
            axisLineSegmentsBuffer[1].y = viewPortHandler.contentTop
            context.strokeLineSegments(between: axisLineSegmentsBuffer)
        }
        
        if axis.labelPosition == .bottom
            || axis.labelPosition == .bottomInside
            || axis.labelPosition == .bothSided
        {
            axisLineSegmentsBuffer[0].x = viewPortHandler.contentLeft
            axisLineSegmentsBuffer[0].y = viewPortHandler.contentBottom
            axisLineSegmentsBuffer[1].x = viewPortHandler.contentRight
            axisLineSegmentsBuffer[1].y = viewPortHandler.contentBottom
            context.strokeLineSegments(between: axisLineSegmentsBuffer)
        }
=======
        if xAxis.labelPosition == .top
            || xAxis.labelPosition == .topInside
            || xAxis.labelPosition == .bothSided
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
        if axis.labelPosition == .top
            || axis.labelPosition == .topInside
            || axis.labelPosition == .bothSided
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
        {
            axisLineSegmentsBuffer[0].x = viewPortHandler.contentLeft
            axisLineSegmentsBuffer[0].y = viewPortHandler.contentTop
            axisLineSegmentsBuffer[1].x = viewPortHandler.contentRight
            axisLineSegmentsBuffer[1].y = viewPortHandler.contentTop
            context.strokeLineSegments(between: axisLineSegmentsBuffer)
        }
        
        if axis.labelPosition == .bottom
            || axis.labelPosition == .bottomInside
            || axis.labelPosition == .bothSided
        {
            axisLineSegmentsBuffer[0].x = viewPortHandler.contentLeft
            axisLineSegmentsBuffer[0].y = viewPortHandler.contentBottom
            axisLineSegmentsBuffer[1].x = viewPortHandler.contentRight
            axisLineSegmentsBuffer[1].y = viewPortHandler.contentBottom
            context.strokeLineSegments(between: axisLineSegmentsBuffer)
        }
<<<<<<< HEAD
        
        context.restoreGState()
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        {
            axisLineSegmentsBuffer[0].x = viewPortHandler.contentLeft
            axisLineSegmentsBuffer[0].y = viewPortHandler.contentTop
            axisLineSegmentsBuffer[1].x = viewPortHandler.contentRight
            axisLineSegmentsBuffer[1].y = viewPortHandler.contentTop
            context.strokeLineSegments(between: axisLineSegmentsBuffer)
        }
        
        if axis.labelPosition == .bottom
            || axis.labelPosition == .bottomInside
            || axis.labelPosition == .bothSided
        {
            axisLineSegmentsBuffer[0].x = viewPortHandler.contentLeft
            axisLineSegmentsBuffer[0].y = viewPortHandler.contentBottom
            axisLineSegmentsBuffer[1].x = viewPortHandler.contentRight
            axisLineSegmentsBuffer[1].y = viewPortHandler.contentBottom
            context.strokeLineSegments(between: axisLineSegmentsBuffer)
        }
<<<<<<< HEAD
        
        context.restoreGState()
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }
    
    /// draws the x-labels on the specified y-position
    @objc open func drawLabels(context: CGContext, pos: CGFloat, anchor: CGPoint)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        guard let transformer = self.transformer else { return }
        
        let paraStyle = ParagraphStyle.default.mutableCopy() as! MutableParagraphStyle
        paraStyle.alignment = .center
        
        let labelAttrs: [NSAttributedString.Key : Any] = [.font: axis.labelFont,
                                                         .foregroundColor: axis.labelTextColor,
                                                         .paragraphStyle: paraStyle]

        let labelRotationAngleRadians = axis.labelRotationAngle.DEG2RAD
        let isCenteringEnabled = axis.isCenterAxisLabelsEnabled
        let valueToPixelMatrix = transformer.valueToPixelMatrix

        var position = CGPoint.zero
        var labelMaxSize = CGSize.zero
        
        if axis.isWordWrapEnabled
        {
            labelMaxSize.width = axis.wordWrapWidthPercent * valueToPixelMatrix.a
        }
        
        let entries = axis.entries
        
        for i in entries.indices
        {
            let px = isCenteringEnabled ? CGFloat(axis.centeredEntries[i]) : CGFloat(entries[i])
            position = CGPoint(x: px, y: 0)
                .applying(valueToPixelMatrix)

            guard viewPortHandler.isInBoundsX(position.x) else { continue }
            
            let label = axis.valueFormatter?.stringForValue(axis.entries[i], axis: axis) ?? ""
            let labelns = label as NSString
            
            if axis.isAvoidFirstLastClippingEnabled
            {
                // avoid clipping of the last
                if i == axis.entryCount - 1 && axis.entryCount > 1
                {
                    let width = labelns.boundingRect(with: labelMaxSize, options: .usesLineFragmentOrigin, attributes: labelAttrs, context: nil).size.width
                    
                    if width > viewPortHandler.offsetRight * 2.0,
                        position.x + width > viewPortHandler.chartWidth
                    {
                        position.x -= width / 2.0
                    }
                }
                else if i == 0
                { // avoid clipping of the first
                    let width = labelns.boundingRect(with: labelMaxSize, options: .usesLineFragmentOrigin, attributes: labelAttrs, context: nil).size.width
                    position.x += width / 2.0
                }
            }
            
            drawLabel(context: context,
                      formattedLabel: label,
                      x: position.x,
                      y: pos,
                      attributes: labelAttrs,
                      constrainedTo: labelMaxSize,
                      anchor: anchor,
                      angleRadians: labelRotationAngleRadians)
=======
        guard
            let xAxis = self.axis as? XAxis,
            let transformer = self.transformer
            else { return }
<<<<<<< HEAD
<<<<<<< HEAD
=======
        guard let transformer = self.transformer else { return }
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
        
        let paraStyle = ParagraphStyle.default.mutableCopy() as! MutableParagraphStyle
        paraStyle.alignment = .center
        
        let labelAttrs: [NSAttributedString.Key : Any] = [.font: axis.labelFont,
                                                         .foregroundColor: axis.labelTextColor,
                                                         .paragraphStyle: paraStyle]

        let labelRotationAngleRadians = axis.labelRotationAngle.DEG2RAD
        let isCenteringEnabled = axis.isCenterAxisLabelsEnabled
        let valueToPixelMatrix = transformer.valueToPixelMatrix

        var position = CGPoint.zero
        var labelMaxSize = CGSize.zero
        
        if axis.isWordWrapEnabled
        {
            labelMaxSize.width = axis.wordWrapWidthPercent * valueToPixelMatrix.a
        }
        
        let entries = axis.entries
        
        for i in entries.indices
        {
            let px = isCenteringEnabled ? CGFloat(axis.centeredEntries[i]) : CGFloat(entries[i])
            position = CGPoint(x: px, y: 0)
                .applying(valueToPixelMatrix)

            guard viewPortHandler.isInBoundsX(position.x) else { continue }
            
            let label = axis.valueFormatter?.stringForValue(axis.entries[i], axis: axis) ?? ""
            let labelns = label as NSString
            
            if axis.isAvoidFirstLastClippingEnabled
            {
                // avoid clipping of the last
                if i == axis.entryCount - 1 && axis.entryCount > 1
                {
                    let width = labelns.boundingRect(with: labelMaxSize, options: .usesLineFragmentOrigin, attributes: labelAttrs, context: nil).size.width
                    
                    if width > viewPortHandler.offsetRight * 2.0,
                        position.x + width > viewPortHandler.chartWidth
                    {
                        position.x -= width / 2.0
                    }
                }
                else if i == 0
                { // avoid clipping of the first
                    let width = labelns.boundingRect(with: labelMaxSize, options: .usesLineFragmentOrigin, attributes: labelAttrs, context: nil).size.width
                    position.x += width / 2.0
                }
            }
<<<<<<< HEAD
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
            
            drawLabel(context: context,
                      formattedLabel: label,
                      x: position.x,
                      y: pos,
                      attributes: labelAttrs,
                      constrainedTo: labelMaxSize,
                      anchor: anchor,
                      angleRadians: labelRotationAngleRadians)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
=======
=======
        guard let transformer = self.transformer else { return }
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        
        let paraStyle = ParagraphStyle.default.mutableCopy() as! MutableParagraphStyle
        paraStyle.alignment = .center
        
        let labelAttrs: [NSAttributedString.Key : Any] = [.font: axis.labelFont,
                                                         .foregroundColor: axis.labelTextColor,
                                                         .paragraphStyle: paraStyle]

        let labelRotationAngleRadians = axis.labelRotationAngle.DEG2RAD
        let isCenteringEnabled = axis.isCenterAxisLabelsEnabled
        let valueToPixelMatrix = transformer.valueToPixelMatrix

        var position = CGPoint.zero
        var labelMaxSize = CGSize.zero
        
        if axis.isWordWrapEnabled
        {
            labelMaxSize.width = axis.wordWrapWidthPercent * valueToPixelMatrix.a
        }
        
        let entries = axis.entries
        
        for i in entries.indices
        {
            let px = isCenteringEnabled ? CGFloat(axis.centeredEntries[i]) : CGFloat(entries[i])
            position = CGPoint(x: px, y: 0)
                .applying(valueToPixelMatrix)

            guard viewPortHandler.isInBoundsX(position.x) else { continue }
            
            let label = axis.valueFormatter?.stringForValue(axis.entries[i], axis: axis) ?? ""
            let labelns = label as NSString
            
            if axis.isAvoidFirstLastClippingEnabled
            {
                // avoid clipping of the last
                if i == axis.entryCount - 1 && axis.entryCount > 1
                {
                    let width = labelns.boundingRect(with: labelMaxSize, options: .usesLineFragmentOrigin, attributes: labelAttrs, context: nil).size.width
                    
                    if width > viewPortHandler.offsetRight * 2.0,
                        position.x + width > viewPortHandler.chartWidth
                    {
                        position.x -= width / 2.0
                    }
                }
                else if i == 0
                { // avoid clipping of the first
                    let width = labelns.boundingRect(with: labelMaxSize, options: .usesLineFragmentOrigin, attributes: labelAttrs, context: nil).size.width
                    position.x += width / 2.0
                }
            }
<<<<<<< HEAD
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
            
            drawLabel(context: context,
                      formattedLabel: label,
                      x: position.x,
                      y: pos,
                      attributes: labelAttrs,
                      constrainedTo: labelMaxSize,
                      anchor: anchor,
                      angleRadians: labelRotationAngleRadians)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        }
    }
    
    @objc open func drawLabel(
        context: CGContext,
        formattedLabel: String,
        x: CGFloat,
        y: CGFloat,
        attributes: [NSAttributedString.Key : Any],
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        constrainedTo size: CGSize,
        anchor: CGPoint,
        angleRadians: CGFloat)
    {
        context.drawMultilineText(formattedLabel,
                                  at: CGPoint(x: x, y: y),
                                  constrainedTo: size,
                                  anchor: anchor,
                                  angleRadians: angleRadians,
                                  attributes: attributes)
    }
    
    open func renderGridLines(context: CGContext)
    {
        guard
            let transformer = self.transformer,
            axis.isEnabled,
            axis.isDrawGridLinesEnabled
            else { return }
        
        context.saveGState()
        defer { context.restoreGState() }

        context.clip(to: self.gridClippingRect)
        
        context.setShouldAntialias(axis.gridAntialiasEnabled)
        context.setStrokeColor(axis.gridColor.cgColor)
        context.setLineWidth(axis.gridLineWidth)
        context.setLineCap(axis.gridLineCap)
        
        if axis.gridLineDashLengths != nil
        {
            context.setLineDash(phase: axis.gridLineDashPhase, lengths: axis.gridLineDashLengths)
=======
        constrainedToSize: CGSize,
<<<<<<< HEAD
<<<<<<< HEAD
=======
        constrainedTo size: CGSize,
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
        anchor: CGPoint,
        angleRadians: CGFloat)
    {
        context.drawMultilineText(formattedLabel,
                                  at: CGPoint(x: x, y: y),
                                  constrainedTo: size,
                                  anchor: anchor,
                                  angleRadians: angleRadians,
                                  attributes: attributes)
    }
    
    open func renderGridLines(context: CGContext)
    {
        guard
            let transformer = self.transformer,
            axis.isEnabled,
            axis.isDrawGridLinesEnabled
            else { return }
        
        context.saveGState()
        defer { context.restoreGState() }

        context.clip(to: self.gridClippingRect)
        
        context.setShouldAntialias(axis.gridAntialiasEnabled)
        context.setStrokeColor(axis.gridColor.cgColor)
        context.setLineWidth(axis.gridLineWidth)
        context.setLineCap(axis.gridLineCap)
        
        if axis.gridLineDashLengths != nil
        {
<<<<<<< HEAD
            context.setLineDash(phase: xAxis.gridLineDashPhase, lengths: xAxis.gridLineDashLengths)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
            context.setLineDash(phase: axis.gridLineDashPhase, lengths: axis.gridLineDashLengths)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
=======
=======
        constrainedTo size: CGSize,
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        anchor: CGPoint,
        angleRadians: CGFloat)
    {
        context.drawMultilineText(formattedLabel,
                                  at: CGPoint(x: x, y: y),
                                  constrainedTo: size,
                                  anchor: anchor,
                                  angleRadians: angleRadians,
                                  attributes: attributes)
    }
    
    open func renderGridLines(context: CGContext)
    {
        guard
            let transformer = self.transformer,
            axis.isEnabled,
            axis.isDrawGridLinesEnabled
            else { return }
        
        context.saveGState()
        defer { context.restoreGState() }

        context.clip(to: self.gridClippingRect)
        
        context.setShouldAntialias(axis.gridAntialiasEnabled)
        context.setStrokeColor(axis.gridColor.cgColor)
        context.setLineWidth(axis.gridLineWidth)
        context.setLineCap(axis.gridLineCap)
        
        if axis.gridLineDashLengths != nil
        {
<<<<<<< HEAD
            context.setLineDash(phase: xAxis.gridLineDashPhase, lengths: xAxis.gridLineDashLengths)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
            context.setLineDash(phase: axis.gridLineDashPhase, lengths: axis.gridLineDashLengths)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        }
        else
        {
            context.setLineDash(phase: 0.0, lengths: [])
        }
        
        let valueToPixelMatrix = transformer.valueToPixelMatrix
        
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        var position = CGPoint.zero
        
        let entries = axis.entries
        
        for entry in entries
        {
            position.x = CGFloat(entry)
            position.y = CGFloat(entry)
=======
        var position = CGPoint(x: 0.0, y: 0.0)
<<<<<<< HEAD
<<<<<<< HEAD
=======
        var position = CGPoint.zero
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
        
        let entries = axis.entries
        
        for entry in entries
        {
<<<<<<< HEAD
            position.x = CGFloat(entries[i])
            position.y = position.x
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
            position.x = CGFloat(entry)
            position.y = CGFloat(entry)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
=======
=======
        var position = CGPoint.zero
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        
        let entries = axis.entries
        
        for entry in entries
        {
<<<<<<< HEAD
            position.x = CGFloat(entries[i])
            position.y = position.x
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
            position.x = CGFloat(entry)
            position.y = CGFloat(entry)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            position = position.applying(valueToPixelMatrix)
            
            drawGridLine(context: context, x: position.x, y: position.y)
        }
    }
    
    @objc open var gridClippingRect: CGRect
    {
        var contentRect = viewPortHandler.contentRect
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        let dx = self.axis.gridLineWidth
=======
        let dx = self.axis?.gridLineWidth ?? 0.0
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
        let dx = self.axis.gridLineWidth
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
        let dx = self.axis.gridLineWidth
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        contentRect.origin.x -= dx / 2.0
        contentRect.size.width += dx
        return contentRect
    }
    
    @objc open func drawGridLine(context: CGContext, x: CGFloat, y: CGFloat)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        guard x >= viewPortHandler.offsetLeft && x <= viewPortHandler.chartWidth else { return }

        context.beginPath()
        context.move(to: CGPoint(x: x, y: viewPortHandler.contentTop))
        context.addLine(to: CGPoint(x: x, y: viewPortHandler.contentBottom))
        context.strokePath()
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }
    
    open func renderLimitLines(context: CGContext)
    {
        guard
            let transformer = self.transformer,
            !axis.limitLines.isEmpty
=======
        if x >= viewPortHandler.offsetLeft
            && x <= viewPortHandler.chartWidth
        {
            context.beginPath()
            context.move(to: CGPoint(x: x, y: viewPortHandler.contentTop))
            context.addLine(to: CGPoint(x: x, y: viewPortHandler.contentBottom))
            context.strokePath()
        }
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
    }
    
    open func renderLimitLines(context: CGContext)
    {
        guard
            let transformer = self.transformer,
<<<<<<< HEAD
            !xAxis.limitLines.isEmpty
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
            !axis.limitLines.isEmpty
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
=======
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }
    
    open func renderLimitLines(context: CGContext)
    {
        guard
            let transformer = self.transformer,
<<<<<<< HEAD
            !xAxis.limitLines.isEmpty
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
            !axis.limitLines.isEmpty
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            else { return }
        
        let trans = transformer.valueToPixelMatrix
        
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        var position = CGPoint.zero
        
        for l in axis.limitLines where l.isEnabled
=======
        var position = CGPoint(x: 0.0, y: 0.0)
        
        for l in xAxis.limitLines where l.isEnabled
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
        var position = CGPoint.zero
        
        for l in axis.limitLines where l.isEnabled
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        {
            context.saveGState()
            defer { context.restoreGState() }
            
            var clippingRect = viewPortHandler.contentRect
            clippingRect.origin.x -= l.lineWidth / 2.0
            clippingRect.size.width += l.lineWidth
            context.clip(to: clippingRect)
            
            position.x = CGFloat(l.limit)
            position.y = 0.0
            position = position.applying(trans)
            
            renderLimitLineLine(context: context, limitLine: l, position: position)
            renderLimitLineLabel(context: context, limitLine: l, position: position, yOffset: 2.0 + l.yOffset)
        }
    }
    
    @objc open func renderLimitLineLine(context: CGContext, limitLine: ChartLimitLine, position: CGPoint)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
        
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
=======
        
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        context.beginPath()
        context.move(to: CGPoint(x: position.x, y: viewPortHandler.contentTop))
        context.addLine(to: CGPoint(x: position.x, y: viewPortHandler.contentBottom))
        
        context.setStrokeColor(limitLine.lineColor.cgColor)
        context.setLineWidth(limitLine.lineWidth)
        if limitLine.lineDashLengths != nil
        {
            context.setLineDash(phase: limitLine.lineDashPhase, lengths: limitLine.lineDashLengths!)
        }
        else
        {
            context.setLineDash(phase: 0.0, lengths: [])
        }
        
        context.strokePath()
    }
    
    @objc open func renderLimitLineLabel(context: CGContext, limitLine: ChartLimitLine, position: CGPoint, yOffset: CGFloat)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        let label = limitLine.label
        
        // if drawing the limit-value label is enabled
=======
        
        let label = limitLine.label
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
        let label = limitLine.label
        
        // if drawing the limit-value label is enabled
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        guard limitLine.drawLabelEnabled, !label.isEmpty else { return }

        let labelLineHeight = limitLine.valueFont.lineHeight

        let xOffset: CGFloat = limitLine.lineWidth + limitLine.xOffset
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)

        let align: TextAlignment
        let point: CGPoint

        switch limitLine.labelPosition
        {
        case .rightTop:
            align = .left
            point = CGPoint(x: position.x + xOffset,
                            y: viewPortHandler.contentTop + yOffset)

        case .rightBottom:
            align = .left
            point = CGPoint(x: position.x + xOffset,
                            y: viewPortHandler.contentBottom - labelLineHeight - yOffset)

        case .leftTop:
            align = .right
            point = CGPoint(x: position.x - xOffset,
                            y: viewPortHandler.contentTop + yOffset)

        case .leftBottom:
            align = .right
            point = CGPoint(x: position.x - xOffset,
                            y: viewPortHandler.contentBottom - labelLineHeight - yOffset)
        }

        context.drawText(label,
                         at: point,
                         align: align,
                         attributes: [.font: limitLine.valueFont,
                                      .foregroundColor: limitLine.valueTextColor])
=======
        let attributes: [NSAttributedString.Key : Any] = [
            .font : limitLine.valueFont,
            .foregroundColor : limitLine.valueTextColor
        ]
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)

        let align: TextAlignment
        let point: CGPoint

        switch limitLine.labelPosition
        {
        case .rightTop:
            align = .left
            point = CGPoint(x: position.x + xOffset,
                            y: viewPortHandler.contentTop + yOffset)

        case .rightBottom:
            align = .left
            point = CGPoint(x: position.x + xOffset,
                            y: viewPortHandler.contentBottom - labelLineHeight - yOffset)

        case .leftTop:
            align = .right
            point = CGPoint(x: position.x - xOffset,
                            y: viewPortHandler.contentTop + yOffset)

        case .leftBottom:
            align = .right
            point = CGPoint(x: position.x - xOffset,
                            y: viewPortHandler.contentBottom - labelLineHeight - yOffset)
        }

<<<<<<< HEAD
=======
=======
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)

        let align: TextAlignment
        let point: CGPoint

        switch limitLine.labelPosition
        {
        case .rightTop:
            align = .left
            point = CGPoint(x: position.x + xOffset,
                            y: viewPortHandler.contentTop + yOffset)

        case .rightBottom:
            align = .left
            point = CGPoint(x: position.x + xOffset,
                            y: viewPortHandler.contentBottom - labelLineHeight - yOffset)

        case .leftTop:
            align = .right
            point = CGPoint(x: position.x - xOffset,
                            y: viewPortHandler.contentTop + yOffset)

        case .leftBottom:
            align = .right
            point = CGPoint(x: position.x - xOffset,
                            y: viewPortHandler.contentBottom - labelLineHeight - yOffset)
        }

<<<<<<< HEAD
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
<<<<<<< HEAD
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        ChartUtils.drawText(
            context: context,
            text: label,
            point: point,
            align: align,
            attributes: attributes
        )
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
        context.drawText(label,
                         at: point,
                         align: align,
                         attributes: [.font: limitLine.valueFont,
                                      .foregroundColor: limitLine.valueTextColor])
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }
}
