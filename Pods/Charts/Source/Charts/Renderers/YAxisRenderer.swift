//
//  YAxisRenderer.swift
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

@objc(ChartYAxisRenderer)
open class YAxisRenderer: NSObject, AxisRenderer
{
    @objc public let viewPortHandler: ViewPortHandler
    @objc public let axis: YAxis
    @objc public let transformer: Transformer?

    @objc public init(viewPortHandler: ViewPortHandler, axis: YAxis, transformer: Transformer?)
    {
        self.viewPortHandler = viewPortHandler
        self.axis = axis
        self.transformer = transformer
        
        super.init()
    }
    
    /// draws the y-axis labels to the screen
    open func renderAxisLabels(context: CGContext)
    {
        guard
            axis.isEnabled,
            axis.isDrawLabelsEnabled
            else { return }

        let xoffset = axis.xOffset
        let yoffset = axis.labelFont.lineHeight / 2.5 + axis.yOffset
        
        let dependency = axis.axisDependency
        let labelPosition = axis.labelPosition
        
        let xPos: CGFloat
        let textAlign: TextAlignment
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

@objc(ChartYAxisRenderer)
open class YAxisRenderer: NSObject, AxisRenderer
{
    @objc public let viewPortHandler: ViewPortHandler
    @objc public let axis: YAxis
    @objc public let transformer: Transformer?

    @objc public init(viewPortHandler: ViewPortHandler, axis: YAxis, transformer: Transformer?)
    {
        self.viewPortHandler = viewPortHandler
        self.axis = axis
        self.transformer = transformer
        
        super.init()
    }
    
    /// draws the y-axis labels to the screen
    open func renderAxisLabels(context: CGContext)
    {
        guard
            axis.isEnabled,
            axis.isDrawLabelsEnabled
            else { return }

        let xoffset = axis.xOffset
        let yoffset = axis.labelFont.lineHeight / 2.5 + axis.yOffset
        
        let dependency = axis.axisDependency
        let labelPosition = axis.labelPosition
        
<<<<<<< HEAD
=======
=======
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)

@objc(ChartYAxisRenderer)
open class YAxisRenderer: NSObject, AxisRenderer
{
    @objc public let viewPortHandler: ViewPortHandler
    @objc public let axis: YAxis
    @objc public let transformer: Transformer?

    @objc public init(viewPortHandler: ViewPortHandler, axis: YAxis, transformer: Transformer?)
    {
        self.viewPortHandler = viewPortHandler
        self.axis = axis
        self.transformer = transformer
        
        super.init()
    }
    
    /// draws the y-axis labels to the screen
    open func renderAxisLabels(context: CGContext)
    {
        guard
            axis.isEnabled,
            axis.isDrawLabelsEnabled
            else { return }

        let xoffset = axis.xOffset
        let yoffset = axis.labelFont.lineHeight / 2.5 + axis.yOffset
        
        let dependency = axis.axisDependency
        let labelPosition = axis.labelPosition
        
<<<<<<< HEAD
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
<<<<<<< HEAD
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        let xoffset = yAxis.xOffset
        let yoffset = yAxis.labelFont.lineHeight / 2.5 + yAxis.yOffset
        
        let dependency = yAxis.axisDependency
        let labelPosition = yAxis.labelPosition
        
        var xPos = CGFloat(0.0)
        
        var textAlign: NSTextAlignment
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
        let xPos: CGFloat
        let textAlign: TextAlignment
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        
        if dependency == .left
        {
            if labelPosition == .outsideChart
            {
                textAlign = .right
                xPos = viewPortHandler.offsetLeft - xoffset
            }
            else
            {
                textAlign = .left
                xPos = viewPortHandler.offsetLeft + xoffset
            }
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
        }
        else
        {
            if labelPosition == .outsideChart
            {
                textAlign = .left
                xPos = viewPortHandler.contentRight + xoffset
            }
            else
            {
                textAlign = .right
                xPos = viewPortHandler.contentRight - xoffset
            }
        }
        
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
        drawYLabels(context: context,
                    fixedPosition: xPos,
                    positions: transformedPositions(),
                    offset: yoffset - axis.labelFont.lineHeight,
                    textAlign: textAlign)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }
    
    open func renderAxisLine(context: CGContext)
    {
        guard
            axis.isEnabled,
            axis.drawAxisLineEnabled
            else { return }

        context.saveGState()
        defer { context.restoreGState() }

        context.setStrokeColor(axis.axisLineColor.cgColor)
        context.setLineWidth(axis.axisLineWidth)
        if axis.axisLineDashLengths != nil
        {
            context.setLineDash(phase: axis.axisLineDashPhase, lengths: axis.axisLineDashLengths)
=======
        drawYLabels(
            context: context,
            fixedPosition: xPos,
            positions: transformedPositions(),
            offset: yoffset - yAxis.labelFont.lineHeight,
            textAlign: textAlign)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
    }
    
    open func renderAxisLine(context: CGContext)
    {
        guard
            axis.isEnabled,
            axis.drawAxisLineEnabled
            else { return }

        context.saveGState()
        defer { context.restoreGState() }

        context.setStrokeColor(axis.axisLineColor.cgColor)
        context.setLineWidth(axis.axisLineWidth)
        if axis.axisLineDashLengths != nil
        {
<<<<<<< HEAD
            context.setLineDash(phase: yAxis.axisLineDashPhase, lengths: yAxis.axisLineDashLengths)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
            context.setLineDash(phase: axis.axisLineDashPhase, lengths: axis.axisLineDashLengths)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
=======
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    }
    
    open func renderAxisLine(context: CGContext)
    {
        guard
            axis.isEnabled,
            axis.drawAxisLineEnabled
            else { return }

        context.saveGState()
        defer { context.restoreGState() }

        context.setStrokeColor(axis.axisLineColor.cgColor)
        context.setLineWidth(axis.axisLineWidth)
        if axis.axisLineDashLengths != nil
        {
<<<<<<< HEAD
            context.setLineDash(phase: yAxis.axisLineDashPhase, lengths: yAxis.axisLineDashLengths)
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
        if axis.axisDependency == .left
=======
        if yAxis.axisDependency == .left
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
        if axis.axisDependency == .left
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
        if axis.axisDependency == .left
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        {
            context.beginPath()
            context.move(to: CGPoint(x: viewPortHandler.contentLeft, y: viewPortHandler.contentTop))
            context.addLine(to: CGPoint(x: viewPortHandler.contentLeft, y: viewPortHandler.contentBottom))
            context.strokePath()
        }
        else
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
    
    /// draws the y-labels on the specified x-position
    open func drawYLabels(
        context: CGContext,
        fixedPosition: CGFloat,
        positions: [CGPoint],
        offset: CGFloat,
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        textAlign: TextAlignment)
    {
        let labelFont = axis.labelFont
        let labelTextColor = axis.labelTextColor
        
        let from = axis.isDrawBottomYLabelEntryEnabled ? 0 : 1
        let to = axis.isDrawTopYLabelEntryEnabled ? axis.entryCount : (axis.entryCount - 1)
        
        let xOffset = axis.labelXOffset
        
        for i in from..<to
        {
            let text = axis.getFormattedLabel(i)
            context.drawText(text,
                             at: CGPoint(x: fixedPosition + xOffset, y: positions[i].y + offset),
                             align: textAlign,
                             attributes: [.font: labelFont, .foregroundColor: labelTextColor])
        }
    }
    
    open func renderGridLines(context: CGContext)
    {
        guard axis.isEnabled else { return }

        if axis.drawGridLinesEnabled
=======
        textAlign: NSTextAlignment)
<<<<<<< HEAD
<<<<<<< HEAD
=======
        textAlign: TextAlignment)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
    {
        let labelFont = axis.labelFont
        let labelTextColor = axis.labelTextColor
        
        let from = axis.isDrawBottomYLabelEntryEnabled ? 0 : 1
        let to = axis.isDrawTopYLabelEntryEnabled ? axis.entryCount : (axis.entryCount - 1)
        
        let xOffset = axis.labelXOffset
        
        for i in from..<to
        {
            let text = axis.getFormattedLabel(i)
            context.drawText(text,
                             at: CGPoint(x: fixedPosition + xOffset, y: positions[i].y + offset),
                             align: textAlign,
                             attributes: [.font: labelFont, .foregroundColor: labelTextColor])
        }
    }
    
    open func renderGridLines(context: CGContext)
    {
<<<<<<< HEAD
=======
=======
=======
        textAlign: TextAlignment)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    {
        let labelFont = axis.labelFont
        let labelTextColor = axis.labelTextColor
        
        let from = axis.isDrawBottomYLabelEntryEnabled ? 0 : 1
        let to = axis.isDrawTopYLabelEntryEnabled ? axis.entryCount : (axis.entryCount - 1)
        
        let xOffset = axis.labelXOffset
        
        for i in from..<to
        {
            let text = axis.getFormattedLabel(i)
            context.drawText(text,
                             at: CGPoint(x: fixedPosition + xOffset, y: positions[i].y + offset),
                             align: textAlign,
                             attributes: [.font: labelFont, .foregroundColor: labelTextColor])
        }
    }
    
    open func renderGridLines(context: CGContext)
    {
<<<<<<< HEAD
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
<<<<<<< HEAD
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        guard let
            yAxis = self.axis as? YAxis
            else { return }
        
        if !yAxis.isEnabled
        {
            return
        }
        
        if yAxis.drawGridLinesEnabled
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
        guard axis.isEnabled else { return }

        if axis.drawGridLinesEnabled
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        {
            let positions = transformedPositions()
            
            context.saveGState()
            defer { context.restoreGState() }
            context.clip(to: self.gridClippingRect)
            
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
            context.setShouldAntialias(axis.gridAntialiasEnabled)
            context.setStrokeColor(axis.gridColor.cgColor)
            context.setLineWidth(axis.gridLineWidth)
            context.setLineCap(axis.gridLineCap)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            
            if axis.gridLineDashLengths != nil
            {
                context.setLineDash(phase: axis.gridLineDashPhase, lengths: axis.gridLineDashLengths)
=======
            context.setShouldAntialias(yAxis.gridAntialiasEnabled)
            context.setStrokeColor(yAxis.gridColor.cgColor)
            context.setLineWidth(yAxis.gridLineWidth)
            context.setLineCap(yAxis.gridLineCap)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
            
            if axis.gridLineDashLengths != nil
            {
<<<<<<< HEAD
                context.setLineDash(phase: yAxis.gridLineDashPhase, lengths: yAxis.gridLineDashLengths)
                
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
                context.setLineDash(phase: axis.gridLineDashPhase, lengths: axis.gridLineDashLengths)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
=======
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            
            if axis.gridLineDashLengths != nil
            {
<<<<<<< HEAD
                context.setLineDash(phase: yAxis.gridLineDashPhase, lengths: yAxis.gridLineDashLengths)
                
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
            
            // draw the grid
            positions.forEach { drawGridLine(context: context, position: $0) }
        }

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        if axis.drawZeroLineEnabled
=======
        if yAxis.drawZeroLineEnabled
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
        if axis.drawZeroLineEnabled
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
        if axis.drawZeroLineEnabled
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        {
            // draw zero line
            drawZeroLine(context: context)
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
    
    @objc open func drawGridLine(
        context: CGContext,
        position: CGPoint)
    {
        context.beginPath()
        context.move(to: CGPoint(x: viewPortHandler.contentLeft, y: position.y))
        context.addLine(to: CGPoint(x: viewPortHandler.contentRight, y: position.y))
        context.strokePath()
    }
    
    @objc open func transformedPositions() -> [CGPoint]
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        guard let transformer = self.transformer else { return [] }
        
        var positions = axis.entries.map { CGPoint(x: 0.0, y: $0) }
=======
        guard
            let yAxis = self.axis as? YAxis,
            let transformer = self.transformer
            else { return [CGPoint]() }
        
        var positions = [CGPoint]()
        positions.reserveCapacity(yAxis.entryCount)
        
        let entries = yAxis.entries
        
        for i in stride(from: 0, to: yAxis.entryCount, by: 1)
        {
            positions.append(CGPoint(x: 0.0, y: entries[i]))
        }

>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
        guard let transformer = self.transformer else { return [] }
        
        var positions = axis.entries.map { CGPoint(x: 0.0, y: $0) }
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        transformer.pointValuesToPixel(&positions)
        
        return positions
    }

    /// Draws the zero line at the specified position.
    @objc open func drawZeroLine(context: CGContext)
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
            let transformer = self.transformer,
            let zeroLineColor = axis.zeroLineColor
=======
            let yAxis = self.axis as? YAxis,
            let transformer = self.transformer,
            let zeroLineColor = yAxis.zeroLineColor
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
            let transformer = self.transformer,
            let zeroLineColor = axis.zeroLineColor
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            else { return }
        
        context.saveGState()
        defer { context.restoreGState() }
        
        var clippingRect = viewPortHandler.contentRect
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        clippingRect.origin.y -= axis.zeroLineWidth / 2.0
        clippingRect.size.height += axis.zeroLineWidth
        context.clip(to: clippingRect)

        context.setStrokeColor(zeroLineColor.cgColor)
        context.setLineWidth(axis.zeroLineWidth)
        
        let pos = transformer.pixelForValues(x: 0.0, y: 0.0)

        if axis.zeroLineDashLengths != nil
        {
            context.setLineDash(phase: axis.zeroLineDashPhase, lengths: axis.zeroLineDashLengths!)
=======
        clippingRect.origin.y -= yAxis.zeroLineWidth / 2.0
        clippingRect.size.height += yAxis.zeroLineWidth
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
        clippingRect.origin.y -= axis.zeroLineWidth / 2.0
        clippingRect.size.height += axis.zeroLineWidth
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
        context.clip(to: clippingRect)

        context.setStrokeColor(zeroLineColor.cgColor)
        context.setLineWidth(axis.zeroLineWidth)
        
        let pos = transformer.pixelForValues(x: 0.0, y: 0.0)

        if axis.zeroLineDashLengths != nil
        {
<<<<<<< HEAD
            context.setLineDash(phase: yAxis.zeroLineDashPhase, lengths: yAxis.zeroLineDashLengths!)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
            context.setLineDash(phase: axis.zeroLineDashPhase, lengths: axis.zeroLineDashLengths!)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        context.clip(to: clippingRect)

        context.setStrokeColor(zeroLineColor.cgColor)
        context.setLineWidth(axis.zeroLineWidth)
        
        let pos = transformer.pixelForValues(x: 0.0, y: 0.0)

        if axis.zeroLineDashLengths != nil
        {
<<<<<<< HEAD
            context.setLineDash(phase: yAxis.zeroLineDashPhase, lengths: yAxis.zeroLineDashLengths!)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
            context.setLineDash(phase: axis.zeroLineDashPhase, lengths: axis.zeroLineDashLengths!)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        }
        else
        {
            context.setLineDash(phase: 0.0, lengths: [])
        }
        
        context.move(to: CGPoint(x: viewPortHandler.contentLeft, y: pos.y))
        context.addLine(to: CGPoint(x: viewPortHandler.contentRight, y: pos.y))
        context.drawPath(using: CGPathDrawingMode.stroke)
    }
    
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    open func renderLimitLines(context: CGContext)
    {
        guard let transformer = self.transformer else { return }
        
        let limitLines = axis.limitLines
        
        guard !limitLines.isEmpty else { return }

        context.saveGState()
        defer { context.restoreGState() }

=======
    open override func renderLimitLines(context: CGContext)
<<<<<<< HEAD
<<<<<<< HEAD
=======
    open func renderLimitLines(context: CGContext)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
    {
        guard let transformer = self.transformer else { return }
        
        let limitLines = axis.limitLines
        
        guard !limitLines.isEmpty else { return }

        context.saveGState()
<<<<<<< HEAD
        
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
        defer { context.restoreGState() }

>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
=======
=======
    open func renderLimitLines(context: CGContext)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
    {
        guard let transformer = self.transformer else { return }
        
        let limitLines = axis.limitLines
        
        guard !limitLines.isEmpty else { return }

        context.saveGState()
<<<<<<< HEAD
        
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
        defer { context.restoreGState() }

>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        let trans = transformer.valueToPixelMatrix
        
        var position = CGPoint(x: 0.0, y: 0.0)
        
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
        for l in limitLines where l.isEnabled
        {
=======
        for i in 0 ..< limitLines.count
        {
            let l = limitLines[i]
            
            if !l.isEnabled
            {
                continue
            }
            
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
=======
        for l in limitLines where l.isEnabled
        {
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
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
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
            guard l.drawLabelEnabled, !label.isEmpty else { continue }

            let labelLineHeight = l.valueFont.lineHeight

            let xOffset = 4.0 + l.xOffset
            let yOffset = l.lineWidth + labelLineHeight + l.yOffset

            let align: TextAlignment
            let point: CGPoint

            switch l.labelPosition
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
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
        }
    }

    @objc open func computeAxis(min: Double, max: Double, inverted: Bool)
    {
        var min = min, max = max

        if let transformer = self.transformer,
            viewPortHandler.contentWidth > 10.0,
            !viewPortHandler.isFullyZoomedOutY
        {
            // calculate the starting and entry point of the y-labels (depending on zoom / contentrect bounds)
            let p1 = transformer.valueForTouchPoint(CGPoint(x: viewPortHandler.contentLeft, y: viewPortHandler.contentTop))
            let p2 = transformer.valueForTouchPoint(CGPoint(x: viewPortHandler.contentLeft, y: viewPortHandler.contentBottom))

            min = inverted ? Double(p1.y) : Double(p2.y)
            max = inverted ? Double(p2.y) : Double(p1.y)
        }

        computeAxisValues(min: min, max: max)
    }

    @objc open func computeAxisValues(min: Double, max: Double)
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
            interval = Double(range) / Double(labelCount - 1)

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

            // Fix for IEEE negative zero case (Where value == -0.0, and 0.0 == -0.0)
            let values = stride(from: first, to: Double(n) * interval + first, by: interval).map { $0 == 0.0 ? 0.0 : $0 }
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
            axis.centeredEntries.reserveCapacity(n)
            axis.centeredEntries.removeAll()

            let offset: Double = interval / 2.0
            axis.centeredEntries.append(contentsOf: axis.entries.map { $0 + offset })
        }
=======
            if l.drawLabelEnabled && label.count > 0
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
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
        }
    }

    @objc open func computeAxis(min: Double, max: Double, inverted: Bool)
    {
        var min = min, max = max

        if let transformer = self.transformer,
            viewPortHandler.contentWidth > 10.0,
            !viewPortHandler.isFullyZoomedOutY
        {
            // calculate the starting and entry point of the y-labels (depending on zoom / contentrect bounds)
            let p1 = transformer.valueForTouchPoint(CGPoint(x: viewPortHandler.contentLeft, y: viewPortHandler.contentTop))
            let p2 = transformer.valueForTouchPoint(CGPoint(x: viewPortHandler.contentLeft, y: viewPortHandler.contentBottom))

            min = inverted ? Double(p1.y) : Double(p2.y)
            max = inverted ? Double(p2.y) : Double(p1.y)
        }

        computeAxisValues(min: min, max: max)
    }

    @objc open func computeAxisValues(min: Double, max: Double)
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
            interval = Double(range) / Double(labelCount - 1)

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

            // Fix for IEEE negative zero case (Where value == -0.0, and 0.0 == -0.0)
            let values = stride(from: first, to: Double(n) * interval + first, by: interval).map { $0 == 0.0 ? 0.0 : $0 }
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
            axis.centeredEntries.reserveCapacity(n)
            axis.centeredEntries.removeAll()

            let offset: Double = interval / 2.0
            axis.centeredEntries.append(contentsOf: axis.entries.map { $0 + offset })
        }
<<<<<<< HEAD
        
        context.restoreGState()
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
=======
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
>>>>>>> 32a877c (Updated code and styling for iOS version 16.4)
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
        }
    }

    @objc open func computeAxis(min: Double, max: Double, inverted: Bool)
    {
        var min = min, max = max

        if let transformer = self.transformer,
            viewPortHandler.contentWidth > 10.0,
            !viewPortHandler.isFullyZoomedOutY
        {
            // calculate the starting and entry point of the y-labels (depending on zoom / contentrect bounds)
            let p1 = transformer.valueForTouchPoint(CGPoint(x: viewPortHandler.contentLeft, y: viewPortHandler.contentTop))
            let p2 = transformer.valueForTouchPoint(CGPoint(x: viewPortHandler.contentLeft, y: viewPortHandler.contentBottom))

            min = inverted ? Double(p1.y) : Double(p2.y)
            max = inverted ? Double(p2.y) : Double(p1.y)
        }

        computeAxisValues(min: min, max: max)
    }

    @objc open func computeAxisValues(min: Double, max: Double)
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
            interval = Double(range) / Double(labelCount - 1)

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

            // Fix for IEEE negative zero case (Where value == -0.0, and 0.0 == -0.0)
            let values = stride(from: first, to: Double(n) * interval + first, by: interval).map { $0 == 0.0 ? 0.0 : $0 }
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
            axis.centeredEntries.reserveCapacity(n)
            axis.centeredEntries.removeAll()

            let offset: Double = interval / 2.0
            axis.centeredEntries.append(contentsOf: axis.entries.map { $0 + offset })
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
}
