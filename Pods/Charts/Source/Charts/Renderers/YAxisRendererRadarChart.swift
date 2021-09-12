//
//  YAxisRendererRadarChart.swift
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

open class YAxisRendererRadarChart: YAxisRenderer
{
    private weak var chart: RadarChartView?
    
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
    @objc public init(viewPortHandler: ViewPortHandler, axis: YAxis, chart: RadarChartView)
    {
        self.chart = chart

        super.init(viewPortHandler: viewPortHandler, axis: axis, transformer: nil)
=======
    @objc public init(viewPortHandler: ViewPortHandler, yAxis: YAxis?, chart: RadarChartView)
<<<<<<< HEAD
=======
    @objc public init(viewPortHandler: ViewPortHandler, axis: YAxis, chart: RadarChartView)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
    {
        self.chart = chart
<<<<<<< HEAD
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======

        super.init(viewPortHandler: viewPortHandler, axis: axis, transformer: nil)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
    {
        super.init(viewPortHandler: viewPortHandler, yAxis: yAxis, transformer: nil)
        
        self.chart = chart
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
>>>>>>> e716a0e (Initial commit - transfer from other project)
    }
    
    open override func computeAxisValues(min yMin: Double, max yMax: Double)
    {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        let labelCount = axis.labelCount
        let range = abs(yMax - yMin)
        
        guard labelCount != 0,
            range > 0,
            range.isFinite
            else
        {
            axis.entries = []
            axis.centeredEntries = []
=======
        guard let
            axis = axis as? YAxis
            else { return }
        
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
        let labelCount = axis.labelCount
        let range = abs(yMax - yMin)
        
        guard labelCount != 0,
            range > 0,
            range.isFinite
            else
        {
<<<<<<< HEAD
            axis.entries = [Double]()
            axis.centeredEntries = [Double]()
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
            axis.entries = []
            axis.centeredEntries = []
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
        let labelCount = axis.labelCount
        let range = abs(yMax - yMin)
        
        if labelCount == 0 || range <= 0 || range.isInfinite
        {
            axis.entries = [Double]()
            axis.centeredEntries = [Double]()
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
>>>>>>> e716a0e (Initial commit - transfer from other project)
            return
        }
        
        // Find out how much spacing (in yValue space) between axis values
        let rawInterval = range / Double(labelCount)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        var interval = rawInterval.roundedToNextSignificant()

=======
        var interval = rawInterval.roundedToNextSignficant()
        
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
        var interval = rawInterval.roundedToNextSignificant()

>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        // If granularity is enabled, then do not allow the interval to go below specified granularity.
        // This is used to avoid repeated values when rounding values for display.
        if axis.isGranularityEnabled
        {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            interval = max(interval, axis.granularity)
        }
        
        // Normalize interval
        let intervalMagnitude = pow(10.0, floor(log10(interval))).roundedToNextSignificant()
=======
            interval = interval < axis.granularity ? axis.granularity : interval
        }
        
        // Normalize interval
        let intervalMagnitude = pow(10.0, floor(log10(interval))).roundedToNextSignficant()
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
            interval = max(interval, axis.granularity)
        }
        
        // Normalize interval
        let intervalMagnitude = pow(10.0, floor(log10(interval))).roundedToNextSignificant()
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        let intervalSigDigit = Int(interval / intervalMagnitude)
        
        if intervalSigDigit > 5
        {
            // Use one order of magnitude higher, to avoid intervals like 0.9 or 90
            // if it's 0.0 after floor(), we use the old value
            interval = floor(10.0 * intervalMagnitude) == 0.0 ? interval : floor(10.0 * intervalMagnitude)
        }
        
        let centeringEnabled = axis.isCenterAxisLabelsEnabled
        var n = centeringEnabled ? 1 : 0

        // force label count
        if axis.isForceLabelsEnabled
        {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            let step = range / Double(labelCount - 1)
=======
            let step = Double(range) / Double(labelCount - 1)
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
            let step = range / Double(labelCount - 1)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            
            // Ensure stops contains at least n elements.
            axis.entries.removeAll(keepingCapacity: true)
            axis.entries.reserveCapacity(labelCount)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)

            let values = stride(from: yMin, to: Double(labelCount) * step + yMin, by: step)
            axis.entries.append(contentsOf: values)
=======
            
            var v = yMin
            
            for _ in 0 ..< labelCount
            {
                axis.entries.append(v)
                v += step
            }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======

            let values = stride(from: yMin, to: Double(labelCount) * step + yMin, by: step)
            axis.entries.append(contentsOf: values)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            
            n = labelCount
        }
        else
        {
            // no forced count
            
            var first = interval == 0.0 ? 0.0 : ceil(yMin / interval) * interval
            
            if centeringEnabled
            {
                first -= interval
            }

            let last = interval == 0.0 ? 0.0 : (floor(yMax / interval) * interval).nextUp
            
            if interval != 0.0
            {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
                stride(from: first, through: last, by: interval).forEach { _ in n += 1 }
=======
                for _ in stride(from: first, through: last, by: interval)
                {
                    n += 1
                }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
                stride(from: first, through: last, by: interval).forEach { _ in n += 1 }
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            }
            
            n += 1
            
            // Ensure stops contains at least n elements.
            axis.entries.removeAll(keepingCapacity: true)
            axis.entries.reserveCapacity(labelCount)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)

            // Fix for IEEE negative zero case (Where value == -0.0, and 0.0 == -0.0)
            let values = stride(from: first, to: Double(n) * interval + first, by: interval).map { $0 == 0.0 ? 0.0 : $0 }
            axis.entries.append(contentsOf: values)
=======
            
            var f = first
            var i = 0
            while i < n
            {
                if f == 0.0
                {
                    // Fix for IEEE negative zero case (Where value == -0.0, and 0.0 == -0.0)
                    f = 0.0
                }

                axis.entries.append(Double(f))
                
                f += interval
                i += 1
            }
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======

            // Fix for IEEE negative zero case (Where value == -0.0, and 0.0 == -0.0)
            let values = stride(from: first, to: Double(n) * interval + first, by: interval).map { $0 == 0.0 ? 0.0 : $0 }
            axis.entries.append(contentsOf: values)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
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
        
        if centeringEnabled
        {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            let offset = (axis.entries[1] - axis.entries[0]) / 2.0
            axis.centeredEntries = axis.entries.map { $0 + offset }
        }
        
        axis._axisMinimum = axis.entries.first!
        axis._axisMaximum = axis.entries.last!
=======
            axis.centeredEntries.reserveCapacity(n)
            axis.centeredEntries.removeAll()
            
<<<<<<< HEAD
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
            let offset = (axis.entries[1] - axis.entries[0]) / 2.0
            axis.centeredEntries = axis.entries.map { $0 + offset }
        }
        
<<<<<<< HEAD
        axis._axisMinimum = axis.entries[0]
        axis._axisMaximum = axis.entries[n-1]
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
        axis._axisMinimum = axis.entries.first!
        axis._axisMaximum = axis.entries.last!
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
            let offset = (axis.entries[1] - axis.entries[0]) / 2.0
            
            for i in 0 ..< n
            {
                axis.centeredEntries.append(axis.entries[i] + offset)
            }
        }
        
        axis._axisMinimum = axis.entries[0]
        axis._axisMaximum = axis.entries[n-1]
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
>>>>>>> e716a0e (Initial commit - transfer from other project)
        axis.axisRange = abs(axis._axisMaximum - axis._axisMinimum)
    }
    
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
            let chart = chart,
            axis.isEnabled,
            axis.isDrawLabelsEnabled
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            else { return }

        let labelFont = axis.labelFont
        let labelTextColor = axis.labelTextColor
=======
        guard let
            yAxis = axis as? YAxis,
            let chart = chart
            else { return }
        
        if !yAxis.isEnabled || !yAxis.isDrawLabelsEnabled
        {
            return
        }
        
        let labelFont = yAxis.labelFont
        let labelTextColor = yAxis.labelTextColor
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
            else { return }

        let labelFont = axis.labelFont
        let labelTextColor = axis.labelTextColor
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        
        let center = chart.centerOffsets
        let factor = chart.factor
        
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        let labelLineHeight = axis.labelFont.lineHeight
        
        let from = axis.isDrawBottomYLabelEntryEnabled ? 0 : 1
        let to = axis.isDrawTopYLabelEntryEnabled ? axis.entryCount : (axis.entryCount - 1)

        let alignment = axis.labelAlignment
        let xOffset = axis.labelXOffset

        let entries = axis.entries[from..<to]
        entries.indexed().forEach { index, entry in
            let r = CGFloat(entry - axis._axisMinimum) * factor
            let p = center.moving(distance: r, atAngle: chart.rotationAngle)
            let label = axis.getFormattedLabel(index)
            context.drawText(
                label,
                at: CGPoint(x: p.x + xOffset, y: p.y - labelLineHeight),
                align: alignment,
                attributes: [.font: labelFont,
                             .foregroundColor: labelTextColor]
            )
=======
        let labelLineHeight = yAxis.labelFont.lineHeight
<<<<<<< HEAD
=======
        let labelLineHeight = axis.labelFont.lineHeight
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
        
        let from = axis.isDrawBottomYLabelEntryEnabled ? 0 : 1
        let to = axis.isDrawTopYLabelEntryEnabled ? axis.entryCount : (axis.entryCount - 1)

        let alignment = axis.labelAlignment
        let xOffset = axis.labelXOffset

        let entries = axis.entries[from..<to]
        entries.indexed().forEach { index, entry in
            let r = CGFloat(entry - axis._axisMinimum) * factor
            let p = center.moving(distance: r, atAngle: chart.rotationAngle)
            let label = axis.getFormattedLabel(index)
            context.drawText(
                label,
                at: CGPoint(x: p.x + xOffset, y: p.y - labelLineHeight),
                align: alignment,
<<<<<<< HEAD
=======
        
        let from = yAxis.isDrawBottomYLabelEntryEnabled ? 0 : 1
        let to = yAxis.isDrawTopYLabelEntryEnabled ? yAxis.entryCount : (yAxis.entryCount - 1)

        let alignment: NSTextAlignment = yAxis.labelAlignment
        let xOffset = yAxis.labelXOffset
        
        for j in stride(from: from, to: to, by: 1)
        {
            let r = CGFloat(yAxis.entries[j] - yAxis._axisMinimum) * factor
            
            let p = center.moving(distance: r, atAngle: chart.rotationAngle)
            
            let label = yAxis.getFormattedLabel(j)
            
            ChartUtils.drawText(
                context: context,
                text: label,
                point: CGPoint(x: p.x + xOffset, y: p.y - labelLineHeight),
                align: alignment,
>>>>>>> e716a0e (Initial commit - transfer from other project)
                attributes: [
                    NSAttributedString.Key.font: labelFont,
                    NSAttributedString.Key.foregroundColor: labelTextColor
                ])
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
<<<<<<< HEAD
=======
                attributes: [.font: labelFont,
                             .foregroundColor: labelTextColor]
            )
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        }
    }
    
    open override func renderLimitLines(context: CGContext)
    {
        guard
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
            let yAxis = axis as? YAxis,
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
=======
            let yAxis = axis as? YAxis,
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
>>>>>>> e716a0e (Initial commit - transfer from other project)
            let chart = chart,
            let data = chart.data
            else { return }
        
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
        let limitLines = axis.limitLines
        
        guard !limitLines.isEmpty else { return }

        context.saveGState()
        defer { context.restoreGState() }

=======
        let limitLines = yAxis.limitLines
        
        if limitLines.count == 0
        {
            return
        }
<<<<<<< HEAD
=======
        let limitLines = axis.limitLines
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
        
        guard !limitLines.isEmpty else { return }

        context.saveGState()
<<<<<<< HEAD
        
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
        defer { context.restoreGState() }

>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
        
        context.saveGState()
        
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
>>>>>>> e716a0e (Initial commit - transfer from other project)
        let sliceangle = chart.sliceAngle
        
        // calculate the factor that is needed for transforming the value to pixels
        let factor = chart.factor
        
        let center = chart.centerOffsets
        
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
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
=======
        for l in limitLines where l.isEnabled
        {
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
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
            
            let r = CGFloat(l.limit - chart.chartYMin) * factor
            
            context.beginPath()
            
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e716a0e (Initial commit - transfer from other project)
            for i in 0 ..< (data.maxEntryCountSet?.entryCount ?? 0)
            {
                let p = center.moving(
                    distance: r,
                    atAngle: sliceangle * CGFloat(i) + chart.rotationAngle
                )

                i == 0 ? context.move(to: p) : context.addLine(to: p)
            }
            
            context.closePath()
            context.strokePath()
        }
=======
            for j in 0 ..< (data.maxEntryCountSet?.entryCount ?? 0)
<<<<<<< HEAD
=======
            for i in 0 ..< (data.maxEntryCountSet?.entryCount ?? 0)
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
            {
                let p = center.moving(
                    distance: r,
                    atAngle: sliceangle * CGFloat(i) + chart.rotationAngle
                )

                i == 0 ? context.move(to: p) : context.addLine(to: p)
            }
            
            context.closePath()
            context.strokePath()
        }
<<<<<<< HEAD
        
        context.restoreGState()
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
=======
>>>>>>> 3fdccef (Updated code and styling for iOS version 16.4)
=======
            {
                let p = center.moving(distance: r, atAngle: sliceangle * CGFloat(j) + chart.rotationAngle)
                
                if j == 0
                {
                    context.move(to: CGPoint(x: p.x, y: p.y))
                }
                else
                {
                    context.addLine(to: CGPoint(x: p.x, y: p.y))
                }
            }
            
            context.closePath()
            
            context.strokePath()
        }
        
        context.restoreGState()
>>>>>>> 3ac0d68 (Initial commit - transfer from other project)
>>>>>>> e716a0e (Initial commit - transfer from other project)
    }
}
