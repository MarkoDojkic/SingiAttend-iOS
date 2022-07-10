//
//  XAxisRendererHorizontalBarChart.swift
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

open class XAxisRendererHorizontalBarChart: XAxisRenderer
{
    internal weak var chart: BarChartView?
    
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    @objc public init(viewPortHandler: ViewPortHandler, axis: XAxis, transformer: Transformer?, chart: BarChartView)
    {
        super.init(viewPortHandler: viewPortHandler, axis: axis, transformer: transformer)
=======
    @objc public init(viewPortHandler: ViewPortHandler, xAxis: XAxis?, transformer: Transformer?, chart: BarChartView)
    {
        super.init(viewPortHandler: viewPortHandler, xAxis: xAxis, transformer: transformer)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
    @objc public init(viewPortHandler: ViewPortHandler, axis: XAxis, transformer: Transformer?, chart: BarChartView)
    {
        super.init(viewPortHandler: viewPortHandler, axis: axis, transformer: transformer)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        
        self.chart = chart
    }
    
    open override func computeAxis(min: Double, max: Double, inverted: Bool)
    {
        var min = min, max = max
        
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        if let transformer = self.transformer,
            viewPortHandler.contentWidth > 10,
            !viewPortHandler.isFullyZoomedOutY
        {
            // calculate the starting and entry point of the y-labels (depending on
            // zoom / contentrect bounds)
            let p1 = transformer.valueForTouchPoint(CGPoint(x: viewPortHandler.contentLeft, y: viewPortHandler.contentBottom))
            let p2 = transformer.valueForTouchPoint(CGPoint(x: viewPortHandler.contentLeft, y: viewPortHandler.contentTop))

            min = inverted ? Double(p2.y) : Double(p1.y)
            max = inverted ? Double(p1.y) : Double(p2.y)
=======
        if let transformer = self.transformer
        {
            // calculate the starting and entry point of the y-labels (depending on
            // zoom / contentrect bounds)
            if viewPortHandler.contentWidth > 10 && !viewPortHandler.isFullyZoomedOutY
            {
                let p1 = transformer.valueForTouchPoint(CGPoint(x: viewPortHandler.contentLeft, y: viewPortHandler.contentBottom))
                let p2 = transformer.valueForTouchPoint(CGPoint(x: viewPortHandler.contentLeft, y: viewPortHandler.contentTop))
                
                if inverted
                {
                    min = Double(p2.y)
                    max = Double(p1.y)
                }
                else
                {
                    min = Double(p1.y)
                    max = Double(p2.y)
                }
            }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
        if let transformer = self.transformer,
            viewPortHandler.contentWidth > 10,
            !viewPortHandler.isFullyZoomedOutY
        {
            // calculate the starting and entry point of the y-labels (depending on
            // zoom / contentrect bounds)
            let p1 = transformer.valueForTouchPoint(CGPoint(x: viewPortHandler.contentLeft, y: viewPortHandler.contentBottom))
            let p2 = transformer.valueForTouchPoint(CGPoint(x: viewPortHandler.contentLeft, y: viewPortHandler.contentTop))

            min = inverted ? Double(p2.y) : Double(p1.y)
            max = inverted ? Double(p1.y) : Double(p2.y)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        }
        
        computeAxisValues(min: min, max: max)
    }
    
    open override func computeSize()
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        let longest = axis.getLongestLabel() as NSString
        
        let labelSize = longest.size(withAttributes: [.font: axis.labelFont])

        let labelWidth = floor(labelSize.width + axis.xOffset * 3.5)
        let labelHeight = labelSize.height
        let labelRotatedSize = CGSize(width: labelSize.width, height: labelHeight).rotatedBy(degrees: axis.labelRotationAngle)

        axis.labelWidth = labelWidth
        axis.labelHeight = labelHeight
        axis.labelRotatedWidth = round(labelRotatedSize.width + axis.xOffset * 3.5)
        axis.labelRotatedHeight = round(labelRotatedSize.height)
=======
        guard let
            xAxis = self.axis as? XAxis
            else { return }
       
        let longest = xAxis.getLongestLabel() as NSString
<<<<<<< HEAD
<<<<<<< HEAD
=======
        let longest = axis.getLongestLabel() as NSString
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
        
        let labelSize = longest.size(withAttributes: [.font: axis.labelFont])

<<<<<<< HEAD
=======
=======
=======
        let longest = axis.getLongestLabel() as NSString
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        
        let labelSize = longest.size(withAttributes: [.font: axis.labelFont])

<<<<<<< HEAD
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
<<<<<<< HEAD
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        xAxis.labelWidth = labelWidth
        xAxis.labelHeight = labelHeight
        xAxis.labelRotatedWidth = round(labelRotatedSize.width + xAxis.xOffset * 3.5)
        xAxis.labelRotatedHeight = round(labelRotatedSize.height)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
        let labelWidth = floor(labelSize.width + axis.xOffset * 3.5)
        let labelHeight = labelSize.height
        let labelRotatedSize = CGSize(width: labelSize.width, height: labelHeight).rotatedBy(degrees: axis.labelRotationAngle)

        axis.labelWidth = labelWidth
        axis.labelHeight = labelHeight
        axis.labelRotatedWidth = round(labelRotatedSize.width + axis.xOffset * 3.5)
        axis.labelRotatedHeight = round(labelRotatedSize.height)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }

    open override func renderAxisLabels(context: CGContext)
    {
        guard
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            axis.isEnabled,
            axis.isDrawLabelsEnabled,
            chart?.data != nil
            else { return }
        
        let xoffset = axis.xOffset

        switch axis.labelPosition {
        case .top:
            drawLabels(context: context, pos: viewPortHandler.contentRight + xoffset, anchor: CGPoint(x: 0.0, y: 0.5))

        case .topInside:
            drawLabels(context: context, pos: viewPortHandler.contentRight - xoffset, anchor: CGPoint(x: 1.0, y: 0.5))

        case .bottom:
            drawLabels(context: context, pos: viewPortHandler.contentLeft - xoffset, anchor: CGPoint(x: 1.0, y: 0.5))

        case .bottomInside:
            drawLabels(context: context, pos: viewPortHandler.contentLeft + xoffset, anchor: CGPoint(x: 0.0, y: 0.5))

        case .bothSided:
=======
            let xAxis = self.axis as? XAxis
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
            axis.isEnabled,
            axis.isDrawLabelsEnabled,
            chart?.data != nil
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
            else { return }
        
        let xoffset = axis.xOffset

        switch axis.labelPosition {
        case .top:
            drawLabels(context: context, pos: viewPortHandler.contentRight + xoffset, anchor: CGPoint(x: 0.0, y: 0.5))

        case .topInside:
            drawLabels(context: context, pos: viewPortHandler.contentRight - xoffset, anchor: CGPoint(x: 1.0, y: 0.5))

        case .bottom:
            drawLabels(context: context, pos: viewPortHandler.contentLeft - xoffset, anchor: CGPoint(x: 1.0, y: 0.5))

        case .bottomInside:
            drawLabels(context: context, pos: viewPortHandler.contentLeft + xoffset, anchor: CGPoint(x: 0.0, y: 0.5))
<<<<<<< HEAD
=======
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            else { return }
        
        let xoffset = axis.xOffset

        switch axis.labelPosition {
        case .top:
            drawLabels(context: context, pos: viewPortHandler.contentRight + xoffset, anchor: CGPoint(x: 0.0, y: 0.5))

        case .topInside:
            drawLabels(context: context, pos: viewPortHandler.contentRight - xoffset, anchor: CGPoint(x: 1.0, y: 0.5))

        case .bottom:
            drawLabels(context: context, pos: viewPortHandler.contentLeft - xoffset, anchor: CGPoint(x: 1.0, y: 0.5))

        case .bottomInside:
            drawLabels(context: context, pos: viewPortHandler.contentLeft + xoffset, anchor: CGPoint(x: 0.0, y: 0.5))
<<<<<<< HEAD
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
<<<<<<< HEAD
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        }
        else
        { // BOTH SIDED
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======

        case .bothSided:
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            drawLabels(context: context, pos: viewPortHandler.contentRight + xoffset, anchor: CGPoint(x: 0.0, y: 0.5))
            drawLabels(context: context, pos: viewPortHandler.contentLeft - xoffset, anchor: CGPoint(x: 1.0, y: 0.5))
        }
    }

    /// draws the x-labels on the specified y-position
    open override func drawLabels(context: CGContext, pos: CGFloat, anchor: CGPoint)
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
        
        let labelFont = axis.labelFont
        let labelTextColor = axis.labelTextColor
        let labelRotationAngleRadians = axis.labelRotationAngle.DEG2RAD
        
        let centeringEnabled = axis.isCenterAxisLabelsEnabled
        
        // pre allocate to save performance (dont allocate in loop)
        var position = CGPoint.zero
        
        for i in 0..<axis.entryCount
        {
            // only fill x values
            position.x = 0.0
            position.y = centeringEnabled ? CGFloat(axis.centeredEntries[i]) : CGFloat(axis.entries[i])

            transformer.pointValueToPixel(&position)
            
            if viewPortHandler.isInBoundsY(position.y),
                let label = axis.valueFormatter?.stringForValue(axis.entries[i], axis: axis)
            {
                drawLabel(context: context,
                          formattedLabel: label,
                          x: pos,
                          y: position.y,
                          attributes: [.font: labelFont, .foregroundColor: labelTextColor],
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
        
        let labelFont = axis.labelFont
        let labelTextColor = axis.labelTextColor
        let labelRotationAngleRadians = axis.labelRotationAngle.DEG2RAD
        
        let centeringEnabled = axis.isCenterAxisLabelsEnabled
        
        // pre allocate to save performance (dont allocate in loop)
        var position = CGPoint.zero
        
        for i in 0..<axis.entryCount
        {
            // only fill x values
            position.x = 0.0
            position.y = centeringEnabled ? CGFloat(axis.centeredEntries[i]) : CGFloat(axis.entries[i])

            transformer.pointValueToPixel(&position)
            
            if viewPortHandler.isInBoundsY(position.y),
                let label = axis.valueFormatter?.stringForValue(axis.entries[i], axis: axis)
            {
<<<<<<< HEAD
=======
=======
=======
        guard let transformer = self.transformer else { return }
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        
        let labelFont = axis.labelFont
        let labelTextColor = axis.labelTextColor
        let labelRotationAngleRadians = axis.labelRotationAngle.DEG2RAD
        
        let centeringEnabled = axis.isCenterAxisLabelsEnabled
        
        // pre allocate to save performance (dont allocate in loop)
        var position = CGPoint.zero
        
        for i in 0..<axis.entryCount
        {
            // only fill x values
            position.x = 0.0
            position.y = centeringEnabled ? CGFloat(axis.centeredEntries[i]) : CGFloat(axis.entries[i])

            transformer.pointValueToPixel(&position)
            
            if viewPortHandler.isInBoundsY(position.y),
                let label = axis.valueFormatter?.stringForValue(axis.entries[i], axis: axis)
            {
<<<<<<< HEAD
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
<<<<<<< HEAD
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
                if let label = xAxis.valueFormatter?.stringForValue(xAxis.entries[i], axis: xAxis)
                {
                    drawLabel(
                        context: context,
                        formattedLabel: label,
                        x: pos,
                        y: position.y,
                        attributes: [NSAttributedString.Key.font: labelFont, NSAttributedString.Key.foregroundColor: labelTextColor],
                        anchor: anchor,
                        angleRadians: labelRotationAngleRadians)
                }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
                drawLabel(context: context,
                          formattedLabel: label,
                          x: pos,
                          y: position.y,
                          attributes: [.font: labelFont, .foregroundColor: labelTextColor],
                          anchor: anchor,
                          angleRadians: labelRotationAngleRadians)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            }
        }
    }
    
    @objc open func drawLabel(
        context: CGContext,
        formattedLabel: String,
        x: CGFloat,
        y: CGFloat,
        attributes: [NSAttributedString.Key : Any],
        anchor: CGPoint,
        angleRadians: CGFloat)
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
        context.drawText(formattedLabel,
                         at: CGPoint(x: x, y: y),
                         anchor: anchor,
                         angleRadians: angleRadians,
                         attributes: attributes)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
        ChartUtils.drawText(
            context: context,
            text: formattedLabel,
            point: CGPoint(x: x, y: y),
            attributes: attributes,
            anchor: anchor,
            angleRadians: angleRadians)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
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
    }
    
    open override var gridClippingRect: CGRect
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
        let dy = self.axis.gridLineWidth
=======
        let dy = self.axis?.gridLineWidth ?? 0.0
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
        let dy = self.axis.gridLineWidth
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
        let dy = self.axis.gridLineWidth
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        contentRect.origin.y -= dy / 2.0
        contentRect.size.height += dy
        return contentRect
    }
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)

    open override func drawGridLine(context: CGContext, x: CGFloat, y: CGFloat)
    {
        guard viewPortHandler.isInBoundsY(y) else { return }

        context.beginPath()
        context.move(to: CGPoint(x: viewPortHandler.contentLeft, y: y))
        context.addLine(to: CGPoint(x: viewPortHandler.contentRight, y: y))
        context.strokePath()
=======
    
    private var _gridLineSegmentsBuffer = [CGPoint](repeating: CGPoint(), count: 2)
    
    open override func drawGridLine(context: CGContext, x: CGFloat, y: CGFloat)
    {
        if viewPortHandler.isInBoundsY(y)
        {
            context.beginPath()
            context.move(to: CGPoint(x: viewPortHandler.contentLeft, y: y))
            context.addLine(to: CGPoint(x: viewPortHandler.contentRight, y: y))
            context.strokePath()
        }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======

    open override func drawGridLine(context: CGContext, x: CGFloat, y: CGFloat)
    {
        guard viewPortHandler.isInBoundsY(y) else { return }

        context.beginPath()
        context.move(to: CGPoint(x: viewPortHandler.contentLeft, y: y))
        context.addLine(to: CGPoint(x: viewPortHandler.contentRight, y: y))
        context.strokePath()
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }
    
    open override func renderAxisLine(context: CGContext)
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
        guard
            axis.isEnabled,
            axis.isDrawAxisLineEnabled
            else { return }

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        context.saveGState()
        defer { context.restoreGState() }

        context.setStrokeColor(axis.axisLineColor.cgColor)
        context.setLineWidth(axis.axisLineWidth)
        if axis.axisLineDashLengths != nil
        {
            context.setLineDash(phase: axis.axisLineDashPhase, lengths: axis.axisLineDashLengths)
=======
        guard let xAxis = self.axis as? XAxis else { return }
        
        if !xAxis.isEnabled || !xAxis.isDrawAxisLineEnabled
        {
            return
        }
        
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
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
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
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
        if axis.labelPosition == .top ||
            axis.labelPosition == .topInside ||
            axis.labelPosition == .bothSided
=======
        if xAxis.labelPosition == .top ||
            xAxis.labelPosition == .topInside ||
            xAxis.labelPosition == .bothSided
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
        if axis.labelPosition == .top ||
            axis.labelPosition == .topInside ||
            axis.labelPosition == .bothSided
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        {
            context.beginPath()
            context.move(to: CGPoint(x: viewPortHandler.contentRight, y: viewPortHandler.contentTop))
            context.addLine(to: CGPoint(x: viewPortHandler.contentRight, y: viewPortHandler.contentBottom))
            context.strokePath()
        }
        
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        if axis.labelPosition == .bottom ||
            axis.labelPosition == .bottomInside ||
            axis.labelPosition == .bothSided
=======
        if xAxis.labelPosition == .bottom ||
            xAxis.labelPosition == .bottomInside ||
            xAxis.labelPosition == .bothSided
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
        if axis.labelPosition == .bottom ||
            axis.labelPosition == .bottomInside ||
            axis.labelPosition == .bothSided
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        {
            context.beginPath()
            context.move(to: CGPoint(x: viewPortHandler.contentLeft, y: viewPortHandler.contentTop))
            context.addLine(to: CGPoint(x: viewPortHandler.contentLeft, y: viewPortHandler.contentBottom))
            context.strokePath()
        }
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
        
        context.restoreGState()
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
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
    }
    
    open override func renderLimitLines(context: CGContext)
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
        
        let limitLines = axis.limitLines
        
        guard !limitLines.isEmpty else { return }

        let trans = transformer.valueToPixelMatrix
        
        var position = CGPoint.zero
        
        for l in limitLines where l.isEnabled
        {
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
        
        let limitLines = axis.limitLines
        
        guard !limitLines.isEmpty else { return }

        let trans = transformer.valueToPixelMatrix
        
        var position = CGPoint.zero
        
        for l in limitLines where l.isEnabled
        {
<<<<<<< HEAD
=======
=======
=======
        guard let transformer = self.transformer else { return }
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        
        let limitLines = axis.limitLines
        
        guard !limitLines.isEmpty else { return }

        let trans = transformer.valueToPixelMatrix
        
        var position = CGPoint.zero
        
        for l in limitLines where l.isEnabled
        {
<<<<<<< HEAD
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
<<<<<<< HEAD
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            let l = limitLines[i]
            
            if !l.isEnabled
            {
                continue
            }
            
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
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
            context.saveGState()
            defer { context.restoreGState() }
            
            var clippingRect = viewPortHandler.contentRect
            clippingRect.origin.y -= l.lineWidth / 2.0
            clippingRect.size.height += l.lineWidth
            context.clip(to: clippingRect)

            position.x = 0.0
            position.y = CGFloat(l.limit)
            position = position.applying(trans)
            
            context.beginPath()
            context.move(to: CGPoint(x: viewPortHandler.contentLeft, y: position.y))
            context.addLine(to: CGPoint(x: viewPortHandler.contentRight, y: position.y))
            
            context.setStrokeColor(l.lineColor.cgColor)
            context.setLineWidth(l.lineWidth)
            if l.lineDashLengths != nil
            {
                context.setLineDash(phase: l.lineDashPhase, lengths: l.lineDashLengths!)
            }
            else
            {
                context.setLineDash(phase: 0.0, lengths: [])
            }
            
            context.strokePath()
            
            let label = l.label
            
            // if drawing the limit-value label is enabled
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            if l.drawLabelEnabled, !label.isEmpty
            {
                let labelLineHeight = l.valueFont.lineHeight
                
                let xOffset = 4.0 + l.xOffset
                let yOffset = l.lineWidth + labelLineHeight + l.yOffset

                let align: TextAlignment
                let point: CGPoint

                switch l.labelPosition
                {
                case .rightTop:
                    align = .right
                    point = CGPoint(x: viewPortHandler.contentRight - xOffset,
                                    y: position.y - yOffset)

                case .rightBottom:
                    align = .right
                    point = CGPoint(x: viewPortHandler.contentRight - xOffset,
                                    y: position.y + yOffset - labelLineHeight)

                case .leftTop:
                    align = .left
                    point = CGPoint(x: viewPortHandler.contentLeft + xOffset,
                                    y: position.y - yOffset)

                case .leftBottom:
                    align = .left
                    point = CGPoint(x: viewPortHandler.contentLeft + xOffset,
                                    y: position.y + yOffset - labelLineHeight)
                }

                context.drawText(label,
                                 at: point,
                                 align: align,
                                 attributes: [.font: l.valueFont, .foregroundColor: l.valueTextColor])
=======
            if l.drawLabelEnabled && label.count > 0
<<<<<<< HEAD
<<<<<<< HEAD
=======
            if l.drawLabelEnabled, !label.isEmpty
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
            {
                let labelLineHeight = l.valueFont.lineHeight
                
                let xOffset = 4.0 + l.xOffset
                let yOffset = l.lineWidth + labelLineHeight + l.yOffset

                let align: TextAlignment
                let point: CGPoint

                switch l.labelPosition
                {
                case .rightTop:
                    align = .right
                    point = CGPoint(x: viewPortHandler.contentRight - xOffset,
                                    y: position.y - yOffset)

                case .rightBottom:
                    align = .right
                    point = CGPoint(x: viewPortHandler.contentRight - xOffset,
                                    y: position.y + yOffset - labelLineHeight)

                case .leftTop:
                    align = .left
                    point = CGPoint(x: viewPortHandler.contentLeft + xOffset,
                                    y: position.y - yOffset)

                case .leftBottom:
                    align = .left
                    point = CGPoint(x: viewPortHandler.contentLeft + xOffset,
                                    y: position.y + yOffset - labelLineHeight)
                }
<<<<<<< HEAD
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======

                context.drawText(label,
                                 at: point,
                                 align: align,
                                 attributes: [.font: l.valueFont, .foregroundColor: l.valueTextColor])
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
=======
=======
            if l.drawLabelEnabled, !label.isEmpty
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            {
                let labelLineHeight = l.valueFont.lineHeight
                
                let xOffset = 4.0 + l.xOffset
                let yOffset = l.lineWidth + labelLineHeight + l.yOffset

                let align: TextAlignment
                let point: CGPoint

                switch l.labelPosition
                {
                case .rightTop:
                    align = .right
                    point = CGPoint(x: viewPortHandler.contentRight - xOffset,
                                    y: position.y - yOffset)

                case .rightBottom:
                    align = .right
                    point = CGPoint(x: viewPortHandler.contentRight - xOffset,
                                    y: position.y + yOffset - labelLineHeight)

                case .leftTop:
                    align = .left
                    point = CGPoint(x: viewPortHandler.contentLeft + xOffset,
                                    y: position.y - yOffset)

                case .leftBottom:
                    align = .left
                    point = CGPoint(x: viewPortHandler.contentLeft + xOffset,
                                    y: position.y + yOffset - labelLineHeight)
                }
<<<<<<< HEAD
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======

                context.drawText(label,
                                 at: point,
                                 align: align,
                                 attributes: [.font: l.valueFont, .foregroundColor: l.valueTextColor])
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            }
        }
    }
}
