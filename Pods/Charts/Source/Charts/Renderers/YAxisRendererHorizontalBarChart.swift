//
//  YAxisRendererHorizontalBarChart.swift
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

open class YAxisRendererHorizontalBarChart: YAxisRenderer
{
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    public override init(viewPortHandler: ViewPortHandler, axis: YAxis, transformer: Transformer?)
    {
        super.init(viewPortHandler: viewPortHandler, axis: axis, transformer: transformer)
=======
    public override init(viewPortHandler: ViewPortHandler, yAxis: YAxis?, transformer: Transformer?)
    {
        super.init(viewPortHandler: viewPortHandler, yAxis: yAxis, transformer: transformer)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
    public override init(viewPortHandler: ViewPortHandler, axis: YAxis, transformer: Transformer?)
    {
        super.init(viewPortHandler: viewPortHandler, axis: axis, transformer: transformer)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    }

    /// Computes the axis values.
    open override func computeAxis(min: Double, max: Double, inverted: Bool)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        var min = min, max = max
        
        // calculate the starting and entry point of the y-labels (depending on zoom / contentrect bounds)
        if let transformer = transformer,
            viewPortHandler.contentHeight > 10.0,
            !viewPortHandler.isFullyZoomedOutX
        {
            let p1 = transformer.valueForTouchPoint(CGPoint(x: viewPortHandler.contentLeft, y: viewPortHandler.contentTop))
            let p2 = transformer.valueForTouchPoint(CGPoint(x: viewPortHandler.contentRight, y: viewPortHandler.contentTop))

            min = inverted ? Double(p2.x) : Double(p1.x)
            max = inverted ? Double(p1.x) : Double(p2.x)
=======
        guard let transformer = self.transformer else { return }
        
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
        var min = min, max = max
        
        // calculate the starting and entry point of the y-labels (depending on zoom / contentrect bounds)
        if let transformer = transformer,
            viewPortHandler.contentHeight > 10.0,
            !viewPortHandler.isFullyZoomedOutX
        {
            let p1 = transformer.valueForTouchPoint(CGPoint(x: viewPortHandler.contentLeft, y: viewPortHandler.contentTop))
            let p2 = transformer.valueForTouchPoint(CGPoint(x: viewPortHandler.contentRight, y: viewPortHandler.contentTop))
<<<<<<< HEAD
=======
        var min = min, max = max
        
        // calculate the starting and entry point of the y-labels (depending on zoom / contentrect bounds)
        if viewPortHandler.contentHeight > 10.0 && !viewPortHandler.isFullyZoomedOutX
        {
            let p1 = transformer.valueForTouchPoint(CGPoint(x: viewPortHandler.contentLeft, y: viewPortHandler.contentTop))
            let p2 = transformer.valueForTouchPoint(CGPoint(x: viewPortHandler.contentRight, y: viewPortHandler.contentTop))
>>>>>>> e716a0e (Initial commit - transfer from other project)
            
            if !inverted
            {
                min = Double(p1.x)
                max = Double(p2.x)
            }
            else
            {
                min = Double(p2.x)
                max = Double(p1.x)
            }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======

            min = inverted ? Double(p2.x) : Double(p1.x)
            max = inverted ? Double(p1.x) : Double(p2.x)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        }
        
        computeAxisValues(min: min, max: max)
    }

    /// draws the y-axis labels to the screen
    open override func renderAxisLabels(context: CGContext)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        guard
            axis.isEnabled,
            axis.isDrawLabelsEnabled
            else { return }

        let lineHeight = axis.labelFont.lineHeight
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        let baseYOffset: CGFloat = 2.5
        
        let dependency = axis.axisDependency
        let labelPosition = axis.labelPosition
        
        // Comparing with Android code, the code here is slightly different about lineHeight
        let yPos: CGFloat =
        {
            switch (dependency, labelPosition)
            {
            case (.left, .outsideChart):
                return viewPortHandler.contentTop - baseYOffset - lineHeight

            case (.left, .insideChart):
                return viewPortHandler.contentTop - baseYOffset - lineHeight

            case (.right, .outsideChart):
                return viewPortHandler.contentBottom + baseYOffset

            case (.right, .insideChart):
                return viewPortHandler.contentBottom + baseYOffset
            }
        }()

=======
        guard let yAxis = axis as? YAxis else { return }
        
        if !yAxis.isEnabled || !yAxis.isDrawLabelsEnabled
        {
            return
        }
        
        let lineHeight = yAxis.labelFont.lineHeight
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
        let baseYOffset: CGFloat = 2.5
        
        let dependency = axis.axisDependency
        let labelPosition = axis.labelPosition
        
        // Comparing with Android code, the code here is slightly different about lineHeight
        let yPos: CGFloat =
        {
            switch (dependency, labelPosition)
            {
            case (.left, .outsideChart):
                return viewPortHandler.contentTop - baseYOffset - lineHeight

            case (.left, .insideChart):
                return viewPortHandler.contentTop - baseYOffset - lineHeight

            case (.right, .outsideChart):
                return viewPortHandler.contentBottom + baseYOffset

            case (.right, .insideChart):
                return viewPortHandler.contentBottom + baseYOffset
            }
<<<<<<< HEAD
=======
        let baseYOffset: CGFloat = 2.5
        
        let dependency = yAxis.axisDependency
        let labelPosition = yAxis.labelPosition
        
        var yPos: CGFloat = 0.0
        
        if dependency == .left
        {
            if labelPosition == .outsideChart
            {
                yPos = viewPortHandler.contentTop - baseYOffset
            }
>>>>>>> e716a0e (Initial commit - transfer from other project)
            else
            {
                yPos = viewPortHandler.contentTop - baseYOffset
            }
        }
        else
        {
            if labelPosition == .outsideChart
            {
                yPos = viewPortHandler.contentBottom + lineHeight + baseYOffset
            }
            else
            {
                yPos = viewPortHandler.contentBottom + lineHeight + baseYOffset
            }
        }
        
        // For compatibility with Android code, we keep above calculation the same,
        // And here we pull the line back up
        yPos -= lineHeight
        
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        }()

>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        drawYLabels(
            context: context,
            fixedPosition: yPos,
            positions: transformedPositions(),
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            offset: axis.yOffset
        )
=======
            offset: yAxis.yOffset)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
            offset: axis.yOffset
        )
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    }
    
    open override func renderAxisLine(context: CGContext)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        guard
            axis.isEnabled,
            axis.drawAxisLineEnabled
            else { return }

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        context.saveGState()
        defer { context.restoreGState() }
        
        context.setStrokeColor(axis.axisLineColor.cgColor)
        context.setLineWidth(axis.axisLineWidth)
        if axis.axisLineDashLengths != nil
        {
            context.setLineDash(phase: axis.axisLineDashPhase, lengths: axis.axisLineDashLengths)
=======
        guard let yAxis = axis as? YAxis else { return }
        
        if !yAxis.isEnabled || !yAxis.drawAxisLineEnabled
        {
            return
        }
        
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
            context.setLineDash(phase: yAxis.axisLineDashPhase, lengths: yAxis.axisLineDashLengths)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
            context.setLineDash(phase: axis.axisLineDashPhase, lengths: axis.axisLineDashLengths)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
        context.saveGState()
        
        context.setStrokeColor(yAxis.axisLineColor.cgColor)
        context.setLineWidth(yAxis.axisLineWidth)
        if yAxis.axisLineDashLengths != nil
        {
            context.setLineDash(phase: yAxis.axisLineDashPhase, lengths: yAxis.axisLineDashLengths)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
>>>>>>> e716a0e (Initial commit - transfer from other project)
        }
        else
        {
            context.setLineDash(phase: 0.0, lengths: [])
        }

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        context.beginPath()
        if axis.axisDependency == .left
        {
            context.move(to: CGPoint(x: viewPortHandler.contentLeft, y: viewPortHandler.contentTop))
            context.addLine(to: CGPoint(x: viewPortHandler.contentRight, y: viewPortHandler.contentTop))
        }
        else
        {
            context.move(to: CGPoint(x: viewPortHandler.contentLeft, y: viewPortHandler.contentBottom))
            context.addLine(to: CGPoint(x: viewPortHandler.contentRight, y: viewPortHandler.contentBottom))
        }
        context.strokePath()
=======
        if yAxis.axisDependency == .left
<<<<<<< HEAD
=======
        context.beginPath()
        if axis.axisDependency == .left
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
        {
            context.move(to: CGPoint(x: viewPortHandler.contentLeft, y: viewPortHandler.contentTop))
            context.addLine(to: CGPoint(x: viewPortHandler.contentRight, y: viewPortHandler.contentTop))
        }
        else
        {
            context.move(to: CGPoint(x: viewPortHandler.contentLeft, y: viewPortHandler.contentBottom))
            context.addLine(to: CGPoint(x: viewPortHandler.contentRight, y: viewPortHandler.contentBottom))
<<<<<<< HEAD
=======
        {
            context.beginPath()
            context.move(to: CGPoint(x: viewPortHandler.contentLeft, y: viewPortHandler.contentTop))
            context.addLine(to: CGPoint(x: viewPortHandler.contentRight, y: viewPortHandler.contentTop))
            context.strokePath()
        }
        else
        {
            context.beginPath()
            context.move(to: CGPoint(x: viewPortHandler.contentLeft, y: viewPortHandler.contentBottom))
            context.addLine(to: CGPoint(x: viewPortHandler.contentRight, y: viewPortHandler.contentBottom))
>>>>>>> e716a0e (Initial commit - transfer from other project)
            context.strokePath()        }
        
        context.restoreGState()
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        }
        context.strokePath()
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    }

    /// draws the y-labels on the specified x-position
    @objc open func drawYLabels(
        context: CGContext,
        fixedPosition: CGFloat,
        positions: [CGPoint],
        offset: CGFloat)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        let labelFont = axis.labelFont
        let labelTextColor = axis.labelTextColor
        
        let from = axis.isDrawBottomYLabelEntryEnabled ? 0 : 1
        let to = axis.isDrawTopYLabelEntryEnabled ? axis.entryCount : (axis.entryCount - 1)
        
        let xOffset = axis.labelXOffset
        
        for i in from..<to
        {
            let text = axis.getFormattedLabel(i)
            context.drawText(text,
                             at: CGPoint(x: positions[i].x, y: fixedPosition - offset + xOffset),
                             align: .center,
                             attributes: [.font: labelFont, .foregroundColor: labelTextColor])
=======
        guard let
            yAxis = axis as? YAxis
            else { return }
<<<<<<< HEAD
=======
        let labelFont = axis.labelFont
        let labelTextColor = axis.labelTextColor
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
        
        let from = axis.isDrawBottomYLabelEntryEnabled ? 0 : 1
        let to = axis.isDrawTopYLabelEntryEnabled ? axis.entryCount : (axis.entryCount - 1)
        
        let xOffset = axis.labelXOffset
        
        for i in from..<to
        {
<<<<<<< HEAD
=======
        
        let labelFont = yAxis.labelFont
        let labelTextColor = yAxis.labelTextColor
        
        let from = yAxis.isDrawBottomYLabelEntryEnabled ? 0 : 1
        let to = yAxis.isDrawTopYLabelEntryEnabled ? yAxis.entryCount : (yAxis.entryCount - 1)
        
        let xOffset = yAxis.labelXOffset
        
        for i in stride(from: from, to: to, by: 1)
        {
>>>>>>> e716a0e (Initial commit - transfer from other project)
            let text = yAxis.getFormattedLabel(i)
            
            ChartUtils.drawText(
                context: context,
                text: text,
                point: CGPoint(
                    x: positions[i].x, y:
                    fixedPosition - offset + xOffset
                ),
                align: .center,
                attributes: [NSAttributedString.Key.font: labelFont, NSAttributedString.Key.foregroundColor: labelTextColor])
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
            let text = axis.getFormattedLabel(i)
            context.drawText(text,
                             at: CGPoint(x: positions[i].x, y: fixedPosition - offset + xOffset),
                             align: .center,
                             attributes: [.font: labelFont, .foregroundColor: labelTextColor])
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        }
    }
    
    open override var gridClippingRect: CGRect
    {
        var contentRect = viewPortHandler.contentRect
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        let dx = self.axis.gridLineWidth
=======
        let dx = self.axis?.gridLineWidth ?? 0.0
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        let dx = self.axis.gridLineWidth
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        contentRect.origin.x -= dx / 2.0
        contentRect.size.width += dx
        return contentRect
    }
    
    open override func drawGridLine(
        context: CGContext,
        position: CGPoint)
    {
        context.beginPath()
        context.move(to: CGPoint(x: position.x, y: viewPortHandler.contentTop))
        context.addLine(to: CGPoint(x: position.x, y: viewPortHandler.contentBottom))
        context.strokePath()
    }
    
    open override func transformedPositions() -> [CGPoint]
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        guard let transformer = self.transformer else { return [] }
        
        var positions = axis.entries.map { CGPoint(x: $0, y: 0.0) }
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
            positions.append(CGPoint(x: entries[i], y: 0.0))
        }
        
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        guard let transformer = self.transformer else { return [] }
        
        var positions = axis.entries.map { CGPoint(x: $0, y: 0.0) }
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        transformer.pointValuesToPixel(&positions)
        
        return positions
    }
    
    /// Draws the zero line at the specified position.
    open override func drawZeroLine(context: CGContext)
    {
        guard
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            let transformer = self.transformer,
            let zeroLineColor = axis.zeroLineColor
=======
            let yAxis = self.axis as? YAxis,
            let transformer = self.transformer,
            let zeroLineColor = yAxis.zeroLineColor
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
            let transformer = self.transformer,
            let zeroLineColor = axis.zeroLineColor
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            else { return }
        
        context.saveGState()
        defer { context.restoreGState() }
        
        var clippingRect = viewPortHandler.contentRect
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        clippingRect.origin.x -= axis.zeroLineWidth / 2.0
        clippingRect.size.width += axis.zeroLineWidth
        context.clip(to: clippingRect)
        
        context.setStrokeColor(zeroLineColor.cgColor)
        context.setLineWidth(axis.zeroLineWidth)
        
        let pos = transformer.pixelForValues(x: 0.0, y: 0.0)
        
        if axis.zeroLineDashLengths != nil
        {
            context.setLineDash(phase: axis.zeroLineDashPhase, lengths: axis.zeroLineDashLengths!)
=======
        clippingRect.origin.x -= yAxis.zeroLineWidth / 2.0
        clippingRect.size.width += yAxis.zeroLineWidth
<<<<<<< HEAD
=======
        clippingRect.origin.x -= axis.zeroLineWidth / 2.0
        clippingRect.size.width += axis.zeroLineWidth
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
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
        context.clip(to: clippingRect)
        
        context.setStrokeColor(zeroLineColor.cgColor)
        context.setLineWidth(yAxis.zeroLineWidth)
        
        let pos = transformer.pixelForValues(x: 0.0, y: 0.0)
        
        if yAxis.zeroLineDashLengths != nil
        {
            context.setLineDash(phase: yAxis.zeroLineDashPhase, lengths: yAxis.zeroLineDashLengths!)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
>>>>>>> e716a0e (Initial commit - transfer from other project)
        }
        else
        {
            context.setLineDash(phase: 0.0, lengths: [])
        }
        
        context.move(to: CGPoint(x: pos.x - 1.0, y: viewPortHandler.contentTop))
        context.addLine(to: CGPoint(x: pos.x - 1.0, y: viewPortHandler.contentBottom))
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        context.drawPath(using: .stroke)
    }
        
    open override func renderLimitLines(context: CGContext)
    {
        guard let transformer = self.transformer else { return }
        
        let limitLines = axis.limitLines

        guard !limitLines.isEmpty else { return }

        context.saveGState()
        defer { context.restoreGState() }

        let trans = transformer.valueToPixelMatrix
        var position = CGPoint.zero

        for l in limitLines where l.isEnabled
        {
=======
        context.drawPath(using: CGPathDrawingMode.stroke)
<<<<<<< HEAD
=======
        context.drawPath(using: .stroke)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
    }
        
    open override func renderLimitLines(context: CGContext)
    {
        guard let transformer = self.transformer else { return }
        
        let limitLines = axis.limitLines

        guard !limitLines.isEmpty else { return }

        context.saveGState()
        defer { context.restoreGState() }

        let trans = transformer.valueToPixelMatrix
        var position = CGPoint.zero

        for l in limitLines where l.isEnabled
        {
<<<<<<< HEAD
=======
    }
    
    private var _limitLineSegmentsBuffer = [CGPoint](repeating: CGPoint(), count: 2)
    
    open override func renderLimitLines(context: CGContext)
    {
        guard
            let yAxis = axis as? YAxis,
            let transformer = self.transformer
            else { return }
        
        let limitLines = yAxis.limitLines

        if limitLines.count <= 0
        {
            return
        }
        
        context.saveGState()
        
        let trans = transformer.valueToPixelMatrix
        
        var position = CGPoint(x: 0.0, y: 0.0)
        
        for i in 0 ..< limitLines.count
        {
>>>>>>> e716a0e (Initial commit - transfer from other project)
            let l = limitLines[i]
            
            if !l.isEnabled
            {
                continue
            }
            
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            context.saveGState()
            defer { context.restoreGState() }

            var clippingRect = viewPortHandler.contentRect
            clippingRect.origin.x -= l.lineWidth / 2.0
            clippingRect.size.width += l.lineWidth
            context.clip(to: clippingRect)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)

            position = CGPoint(x: l.limit, y: 0)
                .applying(trans)

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
=======
            
            position.x = CGFloat(l.limit)
            position.y = 0.0
            position = position.applying(trans)
            
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            context.beginPath()
            context.move(to: CGPoint(x: position.x, y: viewPortHandler.contentTop))
            context.addLine(to: CGPoint(x: position.x, y: viewPortHandler.contentBottom))
            
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
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            if l.drawLabelEnabled, !label.isEmpty
            {
                let labelLineHeight = l.valueFont.lineHeight
                
                let xOffset = l.lineWidth + l.xOffset
                let yOffset = 2.0 + l.yOffset

                let align: TextAlignment
                let point: CGPoint

                switch l.labelPosition
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
                                 attributes: [.font: l.valueFont, .foregroundColor: l.valueTextColor])
            }
        }
=======
            if l.drawLabelEnabled && label.count > 0
<<<<<<< HEAD
=======
            if l.drawLabelEnabled, !label.isEmpty
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
            {
                let labelLineHeight = l.valueFont.lineHeight
                
                let xOffset = l.lineWidth + l.xOffset
                let yOffset = 2.0 + l.yOffset

                let align: TextAlignment
                let point: CGPoint

                switch l.labelPosition
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
                                 attributes: [.font: l.valueFont, .foregroundColor: l.valueTextColor])
            }
        }
<<<<<<< HEAD
        
        context.restoreGState()
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
            {
                let labelLineHeight = l.valueFont.lineHeight
                
                let xOffset: CGFloat = l.lineWidth + l.xOffset
                let yOffset: CGFloat = 2.0 + l.yOffset

                if l.labelPosition == .topRight
                {
                    ChartUtils.drawText(context: context,
                        text: label,
                        point: CGPoint(
                            x: position.x + xOffset,
                            y: viewPortHandler.contentTop + yOffset),
                        align: .left,
                        attributes: [NSAttributedString.Key.font: l.valueFont, NSAttributedString.Key.foregroundColor: l.valueTextColor])
                }
                else if l.labelPosition == .bottomRight
                {
                    ChartUtils.drawText(context: context,
                        text: label,
                        point: CGPoint(
                            x: position.x + xOffset,
                            y: viewPortHandler.contentBottom - labelLineHeight - yOffset),
                        align: .left,
                        attributes: [NSAttributedString.Key.font: l.valueFont, NSAttributedString.Key.foregroundColor: l.valueTextColor])
                }
                else if l.labelPosition == .topLeft
                {
                    ChartUtils.drawText(context: context,
                        text: label,
                        point: CGPoint(
                            x: position.x - xOffset,
                            y: viewPortHandler.contentTop + yOffset),
                        align: .right,
                        attributes: [NSAttributedString.Key.font: l.valueFont, NSAttributedString.Key.foregroundColor: l.valueTextColor])
                }
                else
                {
                    ChartUtils.drawText(context: context,
                        text: label,
                        point: CGPoint(
                            x: position.x - xOffset,
                            y: viewPortHandler.contentBottom - labelLineHeight - yOffset),
                        align: .right,
                        attributes: [NSAttributedString.Key.font: l.valueFont, NSAttributedString.Key.foregroundColor: l.valueTextColor])
                }
            }
        }
        
        context.restoreGState()
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
>>>>>>> e716a0e (Initial commit - transfer from other project)
    }
}
